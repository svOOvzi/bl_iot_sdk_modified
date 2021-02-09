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
//  Display Driver for ST7789 SPI. Based on https://gitlab.com/lupyuen/pinetime_lvgl_mynewt/-/blob/master/src/pinetime/display.c
#include <inttypes.h>
#include <stdio.h>
#include <string.h>
#include <assert.h>
#include <device/vfs_spi.h>  //  For spi_ioc_transfer_t
#include <hal/soc/spi.h>     //  For hal_spi_transfer
#include <bl_gpio.h>         //  For bl_gpio_output_set
#include <bl602_glb.h>       //  For GLB_GPIO_Func_Init
#include "lv_port_disp.h"
#include "demo.h"

/// SPI Device Instance. TODO: Move to demo.h
extern spi_dev_t spi_device;

/// Max number of SPI data bytes to be transmitted when displaying image
#define BATCH_SIZE  256

/// Screen Size
#define ROW_COUNT 240
#define COL_COUNT 240
#define BYTES_PER_PIXEL 2

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
#define PWCTR1   0xC0
#define VCMOFSET 0xC5

/// ST7789 Orientation. From https://github.com/almindor/st7789/blob/master/src/lib.rs#L42-L52
#define Portrait         0x00  //  No inverting
#define Landscape        0x60  //  Invert column and page/column order
#define PortraitSwapped  0xC0  //  Invert page and column order
#define LandscapeSwapped 0xA0  //  Invert page and page/column order

static int hard_reset(void);
static int set_orientation(uint8_t orientation);
static int transmit_spi(const uint8_t *data, uint16_t len);
static void delay_ms(uint32_t ms);
static void console_dump(const uint8_t *buffer, unsigned int len);

/// RGB565 Image. Converted by https://github.com/lupyuen/pinetime-graphic
/// from PNG file https://github.com/lupyuen/pinetime-logo-loader/blob/master/logos/pine64-rainbow.png
static const uint8_t image_data[] = {  //  Should be 115,200 bytes
#include "image.inc"
};

/// Initialise the ST7789 display controller. Based on https://github.com/almindor/st7789/blob/master/src/lib.rs
int init_display(void) {
    //  Assume that SPI port 0 has been initialised.
    //  Configure Chip Select, Data/Command, Reset, Backlight pins as GPIO Pins
    GLB_GPIO_Type pins[4];
    pins[0] = DISPLAY_CS_PIN;
    pins[1] = DISPLAY_DC_PIN;
    pins[2] = DISPLAY_RST_PIN;
    pins[3] = DISPLAY_BLK_PIN;
    BL_Err_Type rc2 = GLB_GPIO_Func_Init(GPIO_FUN_SWGPIO, pins, sizeof(pins) / sizeof(pins[0]));
    assert(rc2 == SUCCESS);

    //  Configure Chip Select, Data/Command, Reset, Backlight pins as GPIO Output Pins (instead of GPIO Input)
    int rc;
    rc = bl_gpio_enable_output(DISPLAY_CS_PIN,  0, 0);  assert(rc == 0);
    rc = bl_gpio_enable_output(DISPLAY_DC_PIN,  0, 0);  assert(rc == 0);
    rc = bl_gpio_enable_output(DISPLAY_RST_PIN, 0, 0);  assert(rc == 0);
    rc = bl_gpio_enable_output(DISPLAY_BLK_PIN, 0, 0);  assert(rc == 0);

    //  Set Chip Select pin to High, to deactivate SPI Peripheral (not used for ST7789)
    printf("Set CS pin %d to high\r\n", DISPLAY_CS_PIN);
    rc = bl_gpio_output_set(DISPLAY_CS_PIN, 1);  assert(rc == 0);

    //  Switch on backlight
    rc = backlight_on();  assert(rc == 0);

    //  Reset the display controller through the Reset Pin
    rc = hard_reset();  assert(rc == 0);

    //  Software Reset: Reset the display controller through firmware (ST7789 Datasheet Page 163)
    //  https://www.rhydolabz.com/documents/33/ST7789.pdf
    rc = write_command(SWRESET, NULL, 0);  assert(rc == 0);
    delay_ms(200);  //  Need to wait at least 200 milliseconds

    //  Sleep Out: Disable sleep (ST7789 Datasheet Page 184)
    rc = write_command(SLPOUT, NULL, 0);  assert(rc == 0);
    delay_ms(200);  //  Need to wait at least 200 milliseconds

    //  TODO: This is needed to fix the Fallen Lorry problem, although this command comes from ST7735, not ST7789.
    //  https://twitter.com/MisterTechBlog/status/1359077419156598785?s=20
    static const uint8_t PWCTR1_PARA[] = { 0xA2, 0x02, 0x84 };
    rc = write_command(PWCTR1, PWCTR1_PARA, sizeof(PWCTR1_PARA));  assert(rc == 0);

    //  Vertical Scrolling Definition: 0 TSA, 320 VSA, 0 BSA (ST7789 Datasheet Page 208)
    static const uint8_t VSCRDER_PARA[] = { 0x00, 0x00, 0x14, 0x00, 0x00, 0x00 };
    rc = write_command(VSCRDER, VSCRDER_PARA, sizeof(VSCRDER_PARA));  assert(rc == 0);

    //  Normal Display Mode On (ST7789 Datasheet Page 187)
    rc = write_command(NORON, NULL, 0);  assert(rc == 0);
    delay_ms(10);  //  Need to wait at least 200 milliseconds

    //  Display Inversion: Invert the display colours (light becomes dark and vice versa) (ST7789 Datasheet Pages 188, 190)
    if (INVERTED) {
        rc = write_command(INVON, NULL, 0);  assert(rc == 0);
    } else {
        rc = write_command(INVOFF, NULL, 0);  assert(rc == 0);
    }

    //  Set orientation to Landscape or Portrait
    rc = set_orientation(Landscape);  assert(rc == 0);

    //  Interface Pixel Format: 16-bit RGB565 colour (ST7789 Datasheet Page 224)
    static const uint8_t COLMOD_PARA[] = { 0x55 };
    rc = write_command(COLMOD, COLMOD_PARA, sizeof(COLMOD_PARA));  assert(rc == 0);
    
    //  Display On: Turn on display (ST7789 Datasheet Page 196)
    rc = write_command(DISPON, NULL, 0);  assert(rc == 0);
    delay_ms(200);  //  Need to wait at least 200 milliseconds
    return 0;
}

/// Display image on ST7789 display controller. 
/// Derived from https://github.com/lupyuen/pinetime-rust-mynewt/blob/main/logs/spi-non-blocking.log
int display_image(void) {
    printf("Displaying image...\r\n");

    //  Render each row of pixels.
    for (uint8_t row = 0; row < ROW_COUNT; row++) {
        uint8_t top = row;
        uint8_t bottom = row;
        uint8_t left = 0;
        //  Screen Buffer: 240 * 240 * 2 / 1024 = 112.5 KB
        //  Render a batch of columns in that row.
        for (;;) {
            if (left >= COL_COUNT) { break; }

            //  How many columns we will render in a batch.
            uint16_t batch_columns = BATCH_SIZE / BYTES_PER_PIXEL;
            uint16_t right = left + batch_columns - 1;
            if (right >= COL_COUNT) { right = COL_COUNT - 1; }

            //  How many bytes we will transmit.
            uint16_t len = (right - left + 1) * BYTES_PER_PIXEL;

            //  Read the bytes from flash memory.
            uint32_t offset = ((top * COL_COUNT) + left) * BYTES_PER_PIXEL;
            printf("%lx: ", offset); console_dump(image_data + offset, len); printf("\r\n");

            //  Set the display window.
            int rc = set_window(left, top, right, bottom); assert(rc == 0);

            //   Memory Write (ST7789 Datasheet Page 202)
            rc = write_command(RAMWR, NULL, 0); assert(rc == 0);
            rc = write_data(image_data + offset, len); assert(rc == 0);

            left = right + 1;
        }
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

    //  Set Address Window Rows (ST7789 Datasheet Page 200)
    rc = write_command(RASET, NULL, 0); assert(rc == 0);
    uint8_t row_para[4] = { 0x00, top, 0x00, bottom };
    rc = write_data(row_para, 4); assert(rc == 0);
    return 0;
}

/// Set the display orientation
static int set_orientation(uint8_t orientation) {
    //  Memory Data Access Control (ST7789 Datasheet Page 215)
    if (RGB) {
        uint8_t orientation_para[1] = { orientation };
        int rc = write_command(MADCTL, orientation_para, 1);
        assert(rc == 0);
    } else {
        uint8_t orientation_para[1] = { orientation | 0x08 };
        int rc = write_command(MADCTL, orientation_para, 1);
        assert(rc == 0);
    }
    return 0;
}

/// Transmit ST7789 command
int write_command(uint8_t command, const uint8_t *params, uint16_t len) {
    int rc = bl_gpio_output_set(DISPLAY_DC_PIN, 0);
    assert(rc == 0);

    rc = transmit_spi(&command, 1);
    assert(rc == 0);
    if (params != NULL && len > 0) {
        rc = write_data(params, len);
        assert(rc == 0);
    }
    return 0;
}

/// Transmit ST7789 data
int write_data(const uint8_t *data, uint16_t len) {
    int rc = bl_gpio_output_set(DISPLAY_DC_PIN, 1);
    assert(rc == 0);

    rc = transmit_spi(data, len);
    assert(rc == 0);
    return 0;
}

/// SPI Receive Buffer. We don't actually receive data, but SPI Transfer needs this.
/// Should contain 10 rows of 240 pixels of 2 bytes each (16-bit colour).
/// TODO: Sync with buf1_1 in lv_port_disp.c
static uint8_t rx_buf[10 * 240 * 2];

/// Write to the SPI port
static int transmit_spi(const uint8_t *data, uint16_t len) {
    assert(data != NULL);
    if (len == 0) { return 0; }
    if (len > sizeof(rx_buf)) { printf("transmit_spi error: Too much data %d\r\n", len); return 1; }

    //  Clear the receive buffer
    memset(&rx_buf, 0, sizeof(rx_buf));

    //  Prepare SPI Transfer
    static spi_ioc_transfer_t transfer;
    memset(&transfer, 0, sizeof(transfer));    
    transfer.tx_buf = (uint32_t) data;    //  Transmit Buffer
    transfer.rx_buf = (uint32_t) rx_buf;  //  Receive Buffer
    transfer.len    = len;                //  How many bytes

    //  Select the device
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

    //  De-select the device
    rc = bl_gpio_output_set(DISPLAY_CS_PIN, 1);
    assert(rc == 0);
    printf("Set CS pin %d to high\r\n", DISPLAY_CS_PIN);
    return 0;
}

/// Reset the display controller
static int hard_reset(void) {
    //  Toggle the Reset Pin: High, Low, High
    int rc;
    rc = bl_gpio_output_set(DISPLAY_RST_PIN, 1);  assert(rc == 0);
    rc = bl_gpio_output_set(DISPLAY_RST_PIN, 0);  assert(rc == 0);
    rc = bl_gpio_output_set(DISPLAY_RST_PIN, 1);  assert(rc == 0);
    return 0;
}

/// Switch on backlight
int backlight_on(void) {
    printf("Set BLK pin %d to high\r\n", DISPLAY_BLK_PIN);
    int rc = bl_gpio_output_set(DISPLAY_BLK_PIN, 1);
    assert(rc == 0);
    return 0;
}

/// Switch off backlight
int backlight_off(void) {
    printf("Set BLK pin %d to low\r\n", DISPLAY_BLK_PIN);
    int rc = bl_gpio_output_set(DISPLAY_BLK_PIN, 0);
    assert(rc == 0);
    return 0;
}

/// Delay for the specified number of milliseconds
static void delay_ms(uint32_t ms) {
    //  TODO: Implement delay. For now we write to console.
    printf("TODO Delay %d\r\n", ms);
}

//  Dump "len" number of bytes from "buffer" in hex format.
static void console_dump(const uint8_t *buffer, unsigned int len) {
    if (buffer == NULL || len == 0) { return; }
	for (int i = 0; i < (len > 8 ? 8 : len); i++) { printf("%02x ", buffer[i]); } 
}