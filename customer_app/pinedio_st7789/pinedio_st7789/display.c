/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */
//  Display Driver for ST7789 SPI in 3-Wire (9-bit) Mode.
//  Normally we connect to ST7789 in 4-Wire (8-bit) Mode: https://lupyuen.github.io/images/st7789-4wire.jpg
//  But for PineDio Stack we use 3-Wire (9-bit) Mode: https://lupyuen.github.io/images/st7789-3wire.jpg
//  This means we will pack 9-bit data into bytes for transmitting over 8-bit SPI.
//  We will send in multiples of 9 bytes (9 bits x 8), padded with the NOP Command (code 0x00).
//  Based on https://gitlab.com/lupyuen/pinetime_lvgl_mynewt/-/blob/master/src/pinetime/display.c
#include <inttypes.h>
#include <stdio.h>
#include <string.h>
#include <assert.h>
#include <device/vfs_spi.h>  //  For spi_ioc_transfer_t
#include <hal/soc/spi.h>     //  For hal_spi_transfer
#include <bl_gpio.h>         //  For bl_gpio_output_set
#include <bl602_glb.h>       //  For GLB_GPIO_Func_Init
#include "display.h"         //  For Display Pins and Functions
#include "demo.h"

/// SPI Device Instance. TODO: Move to demo.h
extern spi_dev_t spi_device;

/// Screen Size
#define ROW_COUNT       LV_VER_RES_MAX        //  240 rows of pixels
#define COL_COUNT       LV_HOR_RES_MAX        //  240 columns of pixels
#define BYTES_PER_PIXEL (LV_COLOR_DEPTH / 8)  //  2 bytes per pixel (RGB565 colour)

/// ST7789 Colour Settings
#define INVERTED 1  //  Display colours are inverted
#define RGB      1  //  Display colours are RGB    

/// ST7789 Commands. From https://github.com/almindor/st7789/blob/master/src/instruction.rs
#define NOP      0x00
#define SWRESET  0x01
#define RDDID    0x04
#define RDDST    0x09
#define SLPIN    0x10
#define SLPOUT   0x11
#define PTLON    0x12
#define NORON    0x13
#define INVOFF   0x20
#define INVON    0x21
#define DISPOFF  0x28
#define DISPON   0x29
#define CASET    0x2A
#define RASET    0x2B
#define RAMWR    0x2C
#define RAMRD    0x2E
#define PTLAR    0x30
#define VSCRDER  0x33
#define MADCTL   0x36
#define VSCAD    0x37
#define COLMOD   0x3A

/// ST7789 Orientation. From https://github.com/almindor/st7789/blob/master/src/lib.rs#L42-L52
#define Portrait         0x00  //  No inverting
#define Landscape        0x60  //  Invert column and page/column order
#define PortraitSwapped  0xC0  //  Invert page and column order
#define LandscapeSwapped 0xA0  //  Invert page and page/column order

static int set_orientation(uint8_t orientation);
static void set_data_command(uint8_t data_command0);
static int transmit_unpacked(const uint8_t *data, uint16_t len);
static int transmit_packed(const uint8_t *data, uint16_t len);
static void pack_byte(uint8_t u);
static void copy_bits(uint8_t src, uint8_t src_start_bit, uint8_t src_end_bit, 
    uint16_t dest_index, uint8_t dest_start_bit);
static void delay_ms(uint32_t ms);

/// RGB565 Image. Converted by https://github.com/lupyuen/pinetime-graphic
/// from PNG file https://github.com/lupyuen/lupyuen.github.io/blob/master/images/display-jewel.png
static const uint8_t image_data[] = {  //  Should be 115,200 bytes
#include "image.inc"
};

/// SPI Buffer for unpacked 8-bit data. We always copy pixels from Flash ROM to RAM
/// before transmitting, because Flash ROM may be too slow for DMA at 4 MHz.
/// Contains 10 rows of 240 pixels of 2 bytes each (16-bit colour).
uint8_t spi_unpacked_buf[BUFFER_ROWS * COL_COUNT * BYTES_PER_PIXEL];

/// SPI Buffer for packed 9-bit data
/// Contains 10 rows of 240 pixels of 2 bytes each (16-bit colour).
uint8_t spi_packed_buf[BUFFER_ROWS * COL_COUNT * BYTES_PER_PIXEL * 2];  //  TODO

/// SPI Receive Buffer. We don't actually receive data, but SPI Transfer needs this.
/// Contains 10 rows of 240 pixels of 2 bytes each (16-bit colour).
static uint8_t spi_rx_buf[BUFFER_ROWS * COL_COUNT * BYTES_PER_PIXEL * 2];  //  TODO

/// Initialise the ST7789 display controller. Based on https://github.com/almindor/st7789/blob/master/src/lib.rs
int init_display(void) {
    //  Assume that SPI port 0 has been initialised.
    //  Configure Chip Select, Backlight pins as GPIO Pins
    GLB_GPIO_Type pins[2];
    pins[0] = DISPLAY_CS_PIN;
    pins[1] = DISPLAY_BLK_PIN;
    BL_Err_Type rc2 = GLB_GPIO_Func_Init(GPIO_FUN_SWGPIO, pins, sizeof(pins) / sizeof(pins[0]));
    assert(rc2 == SUCCESS);

    //  Configure Chip Select, Backlight pins as GPIO Output Pins (instead of GPIO Input)
    int rc;
    rc = bl_gpio_enable_output(DISPLAY_CS_PIN,  0, 0);  assert(rc == 0);
    rc = bl_gpio_enable_output(DISPLAY_BLK_PIN, 0, 0);  assert(rc == 0);

    //  Set Chip Select pin to High, to deactivate SPI Peripheral
    printf("Set CS pin %d to high\r\n", DISPLAY_CS_PIN);
    rc = bl_gpio_output_set(DISPLAY_CS_PIN, 1);  assert(rc == 0);

    //  Switch on backlight
    rc = backlight_on();  assert(rc == 0);

#ifdef NOTUSED
    //  Reset the display controller through the Reset Pin
    rc = hard_reset();  assert(rc == 0);
#endif  //  NOTUSED

    //  Software Reset: Reset the display controller through firmware (ST7789 Datasheet Page 163)
    //  https://www.rhydolabz.com/documents/33/ST7789.pdf
    rc = write_command(SWRESET, NULL, 0);  assert(rc == 0);
    rc = flush_display();  assert(rc == 0);
    delay_ms(200);  //  Need to wait at least 200 milliseconds

    //  Sleep Out: Disable sleep (ST7789 Datasheet Page 184)
    rc = write_command(SLPOUT, NULL, 0);  assert(rc == 0);
    rc = flush_display();  assert(rc == 0);
    delay_ms(200);  //  Need to wait at least 200 milliseconds

    //  Vertical Scrolling Definition: 0 TSA, 320 VSA, 0 BSA (ST7789 Datasheet Page 208)
    static const uint8_t VSCRDER_PARA[] = { 0x00, 0x00, 0x14, 0x00, 0x00, 0x00 };
    rc = write_command(VSCRDER, VSCRDER_PARA, sizeof(VSCRDER_PARA));  assert(rc == 0);
    rc = flush_display();  assert(rc == 0);  ////

    //  Normal Display Mode On (ST7789 Datasheet Page 187)
    rc = write_command(NORON, NULL, 0);  assert(rc == 0);
    rc = flush_display();  assert(rc == 0);
    delay_ms(10);  //  Need to wait at least 10 milliseconds

    //  Display Inversion: Invert the display colours (light becomes dark and vice versa) (ST7789 Datasheet Pages 188, 190)
    if (INVERTED) {
        rc = write_command(INVON, NULL, 0);  assert(rc == 0);
        rc = flush_display();  assert(rc == 0); ////
    } else {
        rc = write_command(INVOFF, NULL, 0);  assert(rc == 0);
        rc = flush_display();  assert(rc == 0); ////
    }

    //  Set display orientation to Portrait
    rc = set_orientation(Portrait);  assert(rc == 0);

    //  Interface Pixel Format: 16-bit RGB565 colour (ST7789 Datasheet Page 224)
    static const uint8_t COLMOD_PARA[] = { 0x55 };
    rc = write_command(COLMOD, COLMOD_PARA, sizeof(COLMOD_PARA));  assert(rc == 0);
    rc = flush_display();  assert(rc == 0); ////
    
    //  Display On: Turn on display (ST7789 Datasheet Page 196)
    rc = write_command(DISPON, NULL, 0);  assert(rc == 0);
    rc = flush_display();  assert(rc == 0);
    delay_ms(200);  //  Need to wait at least 200 milliseconds
    return 0;
}

/// Display image on ST7789 display controller
int display_image(void) {
    //  Render each batch of 10 rows
    printf("Displaying image...\r\n");
    for (uint8_t row = 0; row < ROW_COUNT; row += BUFFER_ROWS) {
        //  Compute the (left, top) and (right, bottom) coordinates of the 10-row window
        uint8_t top    = row;
        uint8_t bottom = (row + BUFFER_ROWS - 1) < ROW_COUNT 
            ? (row + BUFFER_ROWS - 1) 
            : (ROW_COUNT - 1);
        uint8_t left   = 0;
        uint8_t right  = COL_COUNT - 1;

        //  Compute the image offset and how many bytes we will transmit
        uint32_t offset = ((top * COL_COUNT) + left) * BYTES_PER_PIXEL;
        uint16_t len    = (bottom - top + 1) * (right - left + 1) * BYTES_PER_PIXEL;

        //  Copy the image pixels from Flash ROM to RAM, because Flash ROM may be too slow for DMA at 4 MHz
        memcpy(spi_unpacked_buf, image_data + offset, len);

        //  Set the display window
        int rc = set_window(left, top, right, bottom); assert(rc == 0);

        //  Memory Write: Write the bytes from RAM to display (ST7789 Datasheet Page 202)
        rc = write_command(RAMWR, NULL, 0);   assert(rc == 0);
        rc = write_data(spi_unpacked_buf, len);  assert(rc == 0);
        rc = flush_display();  assert(rc == 0);
    }
    printf("Image displayed\r\n");
    return 0;
}

/// Set the ST7789 display window to the coordinates (left, top), (right, bottom)
int set_window(uint8_t left, uint8_t top, uint8_t right, uint8_t bottom) {
    assert(left < COL_COUNT && right < COL_COUNT && top < ROW_COUNT && bottom < ROW_COUNT);
    assert(left <= right);
    assert(top <= bottom);
    //  Set Address Window Columns (ST7789 Datasheet Page 198)
    int rc = write_command(CASET, NULL, 0); assert(rc == 0);
    uint8_t col_para[4] = { 0x00, left, 0x00, right };
    rc = write_data(col_para, 4); assert(rc == 0);
    rc = flush_display();  assert(rc == 0); ////

    //  Set Address Window Rows (ST7789 Datasheet Page 200)
    rc = write_command(RASET, NULL, 0); assert(rc == 0);
    uint8_t row_para[4] = { 0x00, top, 0x00, bottom };
    rc = write_data(row_para, 4); assert(rc == 0);
    rc = flush_display();  assert(rc == 0); ////
    return 0;
}

/// Set the display orientation: Portrait, Landscape, PortraitSwapped or LandscapeSwapped
static int set_orientation(uint8_t orientation) {
    //  Memory Data Access Control (ST7789 Datasheet Page 215)
    if (RGB) {
        uint8_t orientation_para[1] = { orientation };
        int rc = write_command(MADCTL, orientation_para, 1);  assert(rc == 0);
        rc = flush_display();  assert(rc == 0); ////
    } else {
        uint8_t orientation_para[1] = { orientation | 0x08 };
        int rc = write_command(MADCTL, orientation_para, 1); assert(rc == 0);
        rc = flush_display();  assert(rc == 0); ////
    }
    return 0;
}

/// Write unpacked 8-bit ST7789 command and parameters to SPI Buffer. `params` is the array of parameter bytes, `len` is the number of parameters.
int write_command(uint8_t command, const uint8_t *params, uint16_t len) {
    //  Set Data / Command Bit to Low to tell ST7789 this is a command
    set_data_command(0);

    //  Transmit the command byte
    int rc = transmit_unpacked(&command, 1);
    assert(rc == 0);

    //  Transmit the parameters as data bytes
    if (params != NULL && len > 0) {
        rc = write_data(params, len);
        assert(rc == 0);
    }
    return 0;
}

/// Write unpacked 8-bit ST7789 data to SPI Buffer. `data` is the array of bytes to be transmitted, `len` is the number of bytes.
int write_data(const uint8_t *data, uint16_t len) {
    //  Set Data / Command Bit to High to tell ST7789 this is data
    set_data_command(1);

    //  Transmit the data bytes
    int rc = transmit_unpacked(data, len);
    assert(rc == 0);
    return 0;
}

/// 0 if we sending a command byte, 1 if we are sending data bytes
static uint8_t data_command = 0;

/// 0 if we sending a command byte, 1 if we are sending data bytes
static void set_data_command(uint8_t data_command0) {
    assert(data_command0 == 0 || data_command0 == 1);
    data_command = data_command0;

    //  Previously for 4-Wire 8-bit mode:
    //  int rc = bl_gpio_output_set(DISPLAY_DC_PIN, data_command0); assert(rc == 0);
}

/// Number of bytes used in spi_unpacked_buf
static uint16_t spi_unpacked_len = 0;

/// Number of bytes used in spi_packed_buf
static uint16_t spi_packed_len   = 0;

/// Write unpacked 8-bit data to the packed SPI Buffer. `data` is the array of bytes to be written. `len` is the number of bytes.
static int transmit_unpacked(const uint8_t *data, uint16_t len) {
    if (len == 0) { return 0; }  //  Nothing to transmit
    for (uint16_t i = 0; i < len; i++) {
        //  Pack the byte into the packed SPI Buffer
        pack_byte(data[i]);
    }
    return 0;
}

/*
To pack 9-bit data into bytes, we do this for every 8 bytes of unpacked data:
(Most Significant Bit first)

If Unpacked Length mod 8 is...

0: 
DC -> P0 bit 7
U bits 1 to 7 -> P0 bits 0 to 6,
U bits 0 to 0 -> P1 bits 7 to 7

1:
DC -> P0 bit 6
U bits 2 to 7 -> P0 bits 0 to 5
U bits 0 to 1 -> P1 bits 6 to 7

2:
DC -> P0 bit 5
U bits 3 to 7 -> P0 bits 0 to 4
U bits 0 to 2 -> P1 bits 5 to 7

...

6:
DC -> P0 bit 1
U bits 7 to 7 -> P0 bits 0 to 0
U bits 0 to 6 -> P1 bits 1 to 7

7:
DC -> P0 bit 0
U bits 0 to 7 -> P0 bits 0 to 7
No change to P1

Where...
  DC is the Data/Command bit (0 = command, 1 = data)
  U is the unpacked 8-bit data byte,
  P0 is the current byte of the packed data,
  P1 is the next byte of the packed data.
*/

/// Pack the unpacked byte into the packed SPI Buffer
static void pack_byte(uint8_t u) {
    //  MOD is the unpacked length mod 8
    uint8_t mod = spi_unpacked_len % 8;
    spi_unpacked_len += 1;

    //  For MOD=0: We will write 2 new packed bytes (partial).
    //  For MOD=1 to 6: We will write 1 new packed byte (partial).
    //  For MOD=7: We will update the last packed byte. (No new packed bytes)
    if (mod == 0)     { spi_packed_len += 2; }
    else if (mod < 7) { spi_packed_len += 1; }

    //  P0 is the current byte of the packed data
    uint16_t p0_index = (mod < 7) 
        ? (spi_packed_len - 2)   //  For MOD=0 to 6: P0 is the second last byte of the packed data
        : (spi_packed_len - 1);  //  For MOD=7: P0 is the last byte of the packed data
    assert(p0_index < spi_packed_len);
    assert(p0_index < sizeof(spi_packed_buf));

    //  For MOD=0: DC -> P0 bit 7
    //  For MOD=1: DC -> P0 bit 6
    //  For MOD=6: DC -> P0 bit 1
    //  For MOD=7: DC -> P0 bit 0
    uint8_t dc_bit = 7 - mod;
    copy_bits(         //  Copy the bits...
        data_command,  //  From Data/Command bit (0 = command, 1 = data)
        0,             //  Start at bit 0
        0,             //  End at bit 0
        p0_index,      //  To destination P0
        dc_bit         //  At DC Bit
    );    

    //  For MOD=0: U bits 1 to 7 -> P0 bits 0 to 6,
    //  For MOD=1: U bits 2 to 7 -> P0 bits 0 to 5
    //  For MOD=6: U bits 7 to 7 -> P0 bits 0 to 0
    //  For MOD=7: U bits 0 to 7 -> P0 bits 0 to 7
    uint8_t u_start  = (mod + 1) % 8;
    uint8_t u_end    = 7;
    uint8_t p0_start = 0;
    copy_bits(     //  Copy the bits...
        u,         //  From unpacked byte
        u_start,   //  Start at this bit
        u_end,     //  End at this bit
        p0_index,  //  To destination P0
        p0_start   //  Start at this bit
    );    

    //  For MOD=0: U bits 0 to 0 -> P1 bits 7 to 7
    //  For MOD=1: U bits 0 to 1 -> P1 bits 6 to 7
    //  For MOD=6: U bits 0 to 6 -> P1 bits 1 to 7
    //  For MOD=7: No change to P1
    if (mod < 7) {
        //  P1 is the next byte of the packed data.
        uint16_t p1_index = p0_index + 1;
        assert(p1_index < sizeof(spi_packed_buf));

        uint8_t u_start   = 0;
        uint8_t u_end     = mod;
        uint8_t p1_start  = 7 - mod;
        copy_bits(     //  Copy the bits...
            u,         //  From unpacked byte
            u_start,   //  Start at this bit
            u_end,     //  End at this bit
            p1_index,  //  To destination P1
            p1_start   //  Start at this bit
        );    
    }
}

/// Copy the bits from src, starting at bit src_start_bit, ending at bit src_end_bit,
/// to spi_packed_buf[dest_index], starting at dest_start_bit.
static void copy_bits(uint8_t src, uint8_t src_start_bit, uint8_t src_end_bit, 
    uint16_t dest_index, uint8_t dest_start_bit) {
    uint8_t num_bits = src_end_bit - src_start_bit + 1;
    assert(num_bits <= 8);
    assert(src_end_bit <= 7);
    assert(src_start_bit <= 7);
    assert(src_start_bit <= src_end_bit);
    assert(dest_start_bit + num_bits <= 8);
    assert(dest_index < spi_packed_len);
    assert(dest_index < sizeof(spi_packed_buf));

    //  Assume src_start_bit=2, src_end_bit=5, dest_start_bit=3, num_bits=4
    //  If the Src Bits are ??xxxx??, shift the bits to become 00??xxxx
    uint8_t src_shift = src >> src_start_bit;

    //  Mask out the Src Bits: 00??xxxx becomes 0000xxxx
    uint8_t src_mask = (1 << num_bits) - 1;
    src_shift &= src_mask;

    //  Shift the bits 0000xxxx to match the Dest Start Bit: 0xxxx000
    uint8_t dest_shift = src_shift << dest_start_bit;

    //  Get the Dest Byte y????yyy
    uint8_t dest = spi_packed_buf[dest_index];

    //  Compute the Dest Mask 01111000
    uint8_t dest_mask = ((1 << num_bits) - 1)
        << dest_start_bit;

    //  Mask out the Dest Bits: y????yyy becomes y0000yyy
    dest &= ~dest_mask;

    //  Merge with the shifted bits to become yxxxxyyy
    dest |= dest_shift;

    //  Update the Dest Byte
    spi_packed_buf[dest_index] = dest;
}

/// Transmit the packed SPI Buffer to ST7789
int flush_display(void) {
    if (spi_packed_len == 0) { return 0; }  //  Nothing to transmit

    //  Fill the remaining packed data with NOP (0x00) 
    //  up to the end of the of the 8-byte unpacked chunk
    //  TODO: Optimise this
    data_command = 0;  //  Sending a NOP Command
    while (spi_unpacked_len % 8 != 0) {
        pack_byte(0x00);  //  Command NOP
    }

    //  We only transmit in chunks of 8 bytes of unpacked data,
    //  equivalent to 9 bytes of packed data.
    assert(spi_unpacked_len % 8 == 0);
    assert(spi_packed_len   % 9 == 0);
    assert(spi_packed_len <= sizeof(spi_packed_buf));

    //  Tranmsit the packed data
    int rc = transmit_packed(spi_packed_buf, spi_packed_len);
    
    //  Reset the unpacked and packed lengths
    spi_unpacked_len = 0;
    spi_packed_len   = 0;
    return rc;
}

/// Write packed data to the SPI port. `data` is the array of bytes to be written. `len` is the number of bytes.
static int transmit_packed(const uint8_t *data, uint16_t len) {
    assert(data != NULL);
    if (len == 0) { return 0; }
    if (len > sizeof(spi_rx_buf)) { printf("transmit_packed error: Too much data %d\r\n", len); return 1; }

    //  Dump the data
    printf("SPI Tx: %d bytes:\r\n", (int) len);
    for (int i = 0; i < 20 && i < len; i++) { printf(" %02x", data[i]); }
    if (i < len) { printf("..."); }
    printf("\r\n");

    //  Clear the receive buffer
    memset(&spi_rx_buf, 0, sizeof(spi_rx_buf));

    //  Prepare SPI Transfer
    static spi_ioc_transfer_t transfer;
    memset(&transfer, 0, sizeof(transfer));    
    transfer.tx_buf = (uint32_t) data;        //  Transmit Buffer
    transfer.rx_buf = (uint32_t) spi_rx_buf;  //  Receive Buffer
    transfer.len    = len;                    //  How many bytes

    //  Select the SPI Peripheral
    printf("Set CS pin %d to low\r\n", DISPLAY_CS_PIN);
    int rc = bl_gpio_output_set(DISPLAY_CS_PIN, 0);
    assert(rc == 0);

    //  Execute the SPI Transfer with the DMA Controller
    rc = hal_spi_transfer(
        &spi_device,  //  SPI Device
        &transfer,    //  SPI Transfers
        1             //  How many transfers (Number of requests, not bytes)
    );
    assert(rc == 0);

    //  DMA Controller will transmit and receive the SPI data in the background.
    //  hal_spi_transfer will wait for the SPI Transfer to complete before returning.
    //  Now that we're done with the SPI Transfer...

    //  De-select the SPI Peripheral
    rc = bl_gpio_output_set(DISPLAY_CS_PIN, 1);
    assert(rc == 0);
    printf("Set CS pin %d to high\r\n", DISPLAY_CS_PIN);
    return 0;
}

#ifdef NOTUSED
/// Reset the display controller
static int hard_reset(void) {
    //  Toggle the Reset Pin: High, Low, High
    int rc;
    rc = bl_gpio_output_set(DISPLAY_RST_PIN, 1);  assert(rc == 0);
    rc = bl_gpio_output_set(DISPLAY_RST_PIN, 0);  assert(rc == 0);
    rc = bl_gpio_output_set(DISPLAY_RST_PIN, 1);  assert(rc == 0);
    return 0;
}
#endif  //  NOTUSED

/// Switch on backlight
int backlight_on(void) {
    //  Set the Backlight Pin to High
    printf("Set BLK pin %d to high\r\n", DISPLAY_BLK_PIN);
    int rc = bl_gpio_output_set(DISPLAY_BLK_PIN, 1);
    assert(rc == 0);
    return 0;

    //  Can we have multiple levels of backlight brightness?
    //  Yes! Configure the Backlight Pin as a PWM Pin (instead of GPIO).
    //  Set the PWM Duty Cycle to control the brightness.
    //  See https://lupyuen.github.io/articles/led#from-gpio-to-pulse-width-modulation-pwm
}

/// Switch off backlight
int backlight_off(void) {
    //  Set the Backlight Pin to Low
    printf("Set BLK pin %d to low\r\n", DISPLAY_BLK_PIN);
    int rc = bl_gpio_output_set(DISPLAY_BLK_PIN, 0);
    assert(rc == 0);
    return 0;
}

/// Delay for the specified number of milliseconds
static void delay_ms(uint32_t ms) {
    //  TODO: Implement delay. For now we write to console, which also introduces a delay.
    printf("TODO Delay %d\r\n", ms);
}
