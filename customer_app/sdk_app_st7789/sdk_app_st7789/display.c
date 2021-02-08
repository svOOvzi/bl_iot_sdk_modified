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
//  Display image on ST7789 display controller (240 x 240)
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

///  Max number of SPI data bytes to be transmitted
#define BATCH_SIZE  256

//  Screen Size
#define ROW_COUNT 240
#define COL_COUNT 240
#define BYTES_PER_PIXEL 2

//  ST7789 Colour Settings
#define INVERTED 1  //  Display colours are inverted
#define RGB      1  //  Display colours are RGB    

//  ST7789 Commands. From https://github.com/lupyuen/st7735-lcd-batch-rs/blob/master/src/instruction.rs
#define NOP 0x00
#define SWRESET 0x01
#define RDDID 0x04
#define RDDST 0x09
#define SLPIN 0x10
#define SLPOUT 0x11
#define PTLON 0x12
#define NORON 0x13
#define INVOFF 0x20
#define INVON 0x21
#define DISPOFF 0x28
#define DISPON 0x29
#define CASET 0x2A
#define RASET 0x2B
#define RAMWR 0x2C
#define RAMRD 0x2E
#define PTLAR 0x30
#define COLMOD 0x3A
#define MADCTL 0x36
#define FRMCTR1 0xB1
#define FRMCTR2 0xB2
#define FRMCTR3 0xB3
#define INVCTR 0xB4
#define DISSET5 0xB6
#define PWCTR1 0xC0
#define PWCTR2 0xC1
#define PWCTR3 0xC2
#define PWCTR4 0xC3
#define PWCTR5 0xC4
#define VMCTR1 0xC5
#define RDID1 0xDA
#define RDID2 0xDB
#define RDID3 0xDC
#define RDID4 0xDD
#define PWCTR6 0xFC
#define GMCTRP1 0xE0
#define GMCTRN1 0xE1

//  ST7789 Orientation. From https://github.com/lupyuen/st7735-lcd-batch-rs/blob/master/src/lib.rs#L52-L58
#define Portrait 0x00
#define Landscape 0x60
#define PortraitSwapped 0xC0
#define LandscapeSwapped 0xA0

static int hard_reset(void);
static int set_orientation(uint8_t orientation);
static int transmit_spi(const uint8_t *data, uint16_t len);
static void delay_ms(uint32_t ms);

/// Buffer for reading flash and writing to display
//  TODO: static uint8_t flash_buffer[BATCH_SIZE];

/// Display the image in SPI Flash to ST7789 display controller. 
/// Derived from https://github.com/lupyuen/pinetime-rust-mynewt/blob/main/logs/spi-non-blocking.log
int NOTUSED_display_image(void) {
    printf("Displaying image...\r\n");
    int rc = pinetime_lvgl_mynewt_init_display();  assert(rc == 0);
    rc = set_orientation(Landscape);  assert(rc == 0);

#ifdef NOTUSED
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
            int rc = hal_flash_read(FLASH_DEVICE, offset, flash_buffer, len); assert(rc == 0);

            //  printf("%lx: ", offset); console_dump(flash_buffer, len); printf("\r\n");

            //  Set the display window.
            rc = pinetime_lvgl_mynewt_set_window(left, top, right, bottom); assert(rc == 0);

            //  Write Pixels (RAMWR): st7735_lcd::draw() → set_pixel()
            rc = pinetime_lvgl_mynewt_write_command(RAMWR, NULL, 0); assert(rc == 0);
            rc = pinetime_lvgl_mynewt_write_data(flash_buffer, len); assert(rc == 0);

            left = right + 1;
        }
    }
#endif  //  NOTUSED

    /*
    //  Set Address Window Columns (CASET): st7735_lcd::draw() → set_pixel() → set_address_window()
    write_command(CASET, NULL, 0);
    static const uint8_t CASET1_PARA[] = { 0x00, 0x00, 0x00, 0x13 };
    pinetime_lvgl_mynewt_write_data(CASET1_PARA, sizeof(CASET1_PARA));  //  Col 0 to 19

    //  Set Address Window Rows (RASET): st7735_lcd::draw() → set_pixel() → set_address_window()
    write_command(RASET, NULL, 0);
    static const uint8_t RASET1_PARA[] = { 0x00, 0x00, 0x00, 0x00 };
    pinetime_lvgl_mynewt_write_data(RASET1_PARA, sizeof(RASET1_PARA));  //  Row 0 to 0

    //  Write Pixels (RAMWR): st7735_lcd::draw() → set_pixel()
    write_command(RAMWR, NULL, 0);
    static const uint8_t RAMWR1_PARA[] = { 0x87, 0xe0, 0x87, 0xe0, 0x87, 0xe0, 0x87, 0xe0, 0x87, 0xe0, 0x87, 0xe0, 0x87, 0xe0, 0x87, 0xe0, 0x87, 0xe0, 0x87, 0xe0, 0x87, 0xe0, 0x87, 0xe0, 0x87, 0xe0, 0x87, 0xe0, 0x87, 0xe0, 0x87, 0xe0, 0x87, 0xe0, 0x87, 0xe0, 0x87, 0xe0, 0x87, 0xe0 };
    pinetime_lvgl_mynewt_write_data(RAMWR1_PARA, sizeof(RAMWR1_PARA));  //  40 bytes

    //  Set Address Window Columns (CASET): st7735_lcd::draw() → set_pixel() → set_address_window()
    write_command(CASET, NULL, 0);
    static const uint8_t CASET2_PARA[] = { 0x00, 0x14, 0x00, 0x27 };
    pinetime_lvgl_mynewt_write_data(CASET2_PARA, sizeof(CASET2_PARA));  //  Col 20 to 39

    //  Set Address Window Rows (RASET): st7735_lcd::draw() → set_pixel() → set_address_window()
    write_command(RASET, NULL, 0);
    static const uint8_t RASET2_PARA[] = { 0x00, 0x00, 0x00, 0x00 };
    pinetime_lvgl_mynewt_write_data(RASET2_PARA, sizeof(RASET2_PARA));  //  Row 0 to 0

    //  Write Pixels (RAMWR): st7735_lcd::draw() → set_pixel()
    write_command(RAMWR, NULL, 0);
    static const uint8_t RAMWR2_PARA[] = { 0x87, 0xe0, 0x87, 0xe0, 0x87, 0xe0, 0x87, 0xe0, 0x87, 0xe0, 0x87, 0xe0, 0x87, 0xe0, 0x87, 0xe0, 0x87, 0xe0, 0x87, 0xe0, 0x87, 0xe0, 0x87, 0xe0, 0x87, 0xe0, 0x87, 0xe0, 0x87, 0xe0, 0x87, 0xe0, 0x87, 0xe0, 0x87, 0xe0, 0x87, 0xe0, 0x87, 0xe0 };
    pinetime_lvgl_mynewt_write_data(RAMWR2_PARA, sizeof(RAMWR2_PARA));  //  40 bytes
    */

    printf("Image displayed\r\n");
    return 0;
}

/// Set the ST7789 display window to the coordinates (left, top), (right, bottom)
int pinetime_lvgl_mynewt_set_window(uint8_t left, uint8_t top, uint8_t right, uint8_t bottom) {
    assert(left < COL_COUNT && right < COL_COUNT && top < ROW_COUNT && bottom < ROW_COUNT);
    assert(left <= right);
    assert(top <= bottom);
    //  Set Address Window Columns (CASET): st7735_lcd::draw() → set_pixel() → set_address_window()
    int rc = pinetime_lvgl_mynewt_write_command(CASET, NULL, 0); assert(rc == 0);
    uint8_t col_para[4] = { 0x00, left, 0x00, right };
    rc = pinetime_lvgl_mynewt_write_data(col_para, 4); assert(rc == 0);

    //  Set Address Window Rows (RASET): st7735_lcd::draw() → set_pixel() → set_address_window()
    rc = pinetime_lvgl_mynewt_write_command(RASET, NULL, 0); assert(rc == 0);
    uint8_t row_para[4] = { 0x00, top, 0x00, bottom };
    rc = pinetime_lvgl_mynewt_write_data(row_para, 4); assert(rc == 0);
    return 0;
}

/// Runs commands to initialize the display. From https://github.com/lupyuen/st7735-lcd-batch-rs/blob/master/src/lib.rs
int pinetime_lvgl_mynewt_init_display(void) {
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
    rc = bl_gpio_output_set(DISPLAY_CS_PIN, 1);
    assert(rc == 0);

    //  Switch on backlight
    printf("Set BLK pin %d to high\r\n", DISPLAY_BLK_PIN);
    rc = bl_gpio_output_set(DISPLAY_BLK_PIN, 1);
    assert(rc == 0);

    /*
    printf("Set BLK pin %d to low\r\n", DISPLAY_BLK_PIN);
    rc = bl_gpio_output_set(DISPLAY_BLK_PIN, 0);
    assert(rc == 0);
    */

    hard_reset();
    pinetime_lvgl_mynewt_write_command(SWRESET, NULL, 0);
    delay_ms(200);
    pinetime_lvgl_mynewt_write_command(SLPOUT, NULL, 0);
    delay_ms(200);

    //  TODO: These commands are actually for ST7735, not ST7789, but seem to work with ST7789. Should be changed to ST7789.
    static const uint8_t FRMCTR1_PARA[] = { 0x01, 0x2C, 0x2D };
    pinetime_lvgl_mynewt_write_command(FRMCTR1, FRMCTR1_PARA, sizeof(FRMCTR1_PARA));

    static const uint8_t FRMCTR2_PARA[] = { 0x01, 0x2C, 0x2D };
    pinetime_lvgl_mynewt_write_command(FRMCTR2, FRMCTR2_PARA, sizeof(FRMCTR2_PARA));

    static const uint8_t FRMCTR3_PARA[] = { 0x01, 0x2C, 0x2D, 0x01, 0x2C, 0x2D };
    pinetime_lvgl_mynewt_write_command(FRMCTR3, FRMCTR3_PARA, sizeof(FRMCTR3_PARA));

    static const uint8_t INVCTR_PARA[] = { 0x07 };
    pinetime_lvgl_mynewt_write_command(INVCTR, INVCTR_PARA, sizeof(INVCTR_PARA));

    static const uint8_t PWCTR1_PARA[] = { 0xA2, 0x02, 0x84 };
    pinetime_lvgl_mynewt_write_command(PWCTR1, PWCTR1_PARA, sizeof(PWCTR1_PARA));

    static const uint8_t PWCTR2_PARA[] = { 0xC5 };
    pinetime_lvgl_mynewt_write_command(PWCTR2, PWCTR2_PARA, sizeof(PWCTR2_PARA));
    
    static const uint8_t PWCTR3_PARA[] = { 0x0A, 0x00 };
    pinetime_lvgl_mynewt_write_command(PWCTR3, PWCTR3_PARA, sizeof(PWCTR3_PARA));
    
    static const uint8_t PWCTR4_PARA[] = { 0x8A, 0x2A };
    pinetime_lvgl_mynewt_write_command(PWCTR4, PWCTR4_PARA, sizeof(PWCTR4_PARA));
    
    static const uint8_t PWCTR5_PARA[] = { 0x8A, 0xEE };
    pinetime_lvgl_mynewt_write_command(PWCTR5, PWCTR5_PARA, sizeof(PWCTR5_PARA));
    
    static const uint8_t VMCTR1_PARA[] = { 0x0E };
    pinetime_lvgl_mynewt_write_command(VMCTR1, VMCTR1_PARA, sizeof(VMCTR1_PARA));

    if (INVERTED) {
        pinetime_lvgl_mynewt_write_command(INVON, NULL, 0);
    } else {
        pinetime_lvgl_mynewt_write_command(INVOFF, NULL, 0);
    }

    set_orientation(Landscape);

    static const uint8_t COLMOD_PARA[] = { 0x05 };
    pinetime_lvgl_mynewt_write_command(COLMOD, COLMOD_PARA, sizeof(COLMOD_PARA));
    
    pinetime_lvgl_mynewt_write_command(DISPON, NULL, 0);
    delay_ms(200);
    return 0;
}

/// Reset the display controller
static int hard_reset(void) {
    int rc;
    rc = bl_gpio_output_set(DISPLAY_RST_PIN, 1);  assert(rc == 0);
    rc = bl_gpio_output_set(DISPLAY_RST_PIN, 0);  assert(rc == 0);
    rc = bl_gpio_output_set(DISPLAY_RST_PIN, 1);  assert(rc == 0);
    return 0;
}

/// Set the display orientation
static int set_orientation(uint8_t orientation) {
    if (RGB) {
        uint8_t orientation_para[1] = { orientation };
        int rc = pinetime_lvgl_mynewt_write_command(MADCTL, orientation_para, 1);
        assert(rc == 0);
    } else {
        uint8_t orientation_para[1] = { orientation | 0x08 };
        int rc = pinetime_lvgl_mynewt_write_command(MADCTL, orientation_para, 1);
        assert(rc == 0);
    }
    return 0;
}

/// Transmit ST7789 command
int pinetime_lvgl_mynewt_write_command(uint8_t command, const uint8_t *params, uint16_t len) {
    int rc = bl_gpio_output_set(DISPLAY_DC_PIN, 0);
    assert(rc == 0);

    rc = transmit_spi(&command, 1);
    assert(rc == 0);
    if (params != NULL && len > 0) {
        rc = pinetime_lvgl_mynewt_write_data(params, len);
        assert(rc == 0);
    }
    return 0;
}

/// Transmit ST7789 data
int pinetime_lvgl_mynewt_write_data(const uint8_t *data, uint16_t len) {
    int rc = bl_gpio_output_set(DISPLAY_DC_PIN, 1);
    assert(rc == 0);

    transmit_spi(data, len);
    return 0;
}

/// SPI Receive Buffer. We don't actually receive data, but SPI Transfer needs this.
static uint8_t rx_buf[BATCH_SIZE];

/// Write to the SPI port
static int transmit_spi(const uint8_t *data, uint16_t len) {
    assert(data != NULL);
    assert(len <= sizeof(rx_buf));
    if (len == 0) { return 0; }

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

/// Delay for the specified number of milliseconds
static void delay_ms(uint32_t ms) {
    //  TODO: Implement delay. For now we write to console.
    printf("TODO Delay %d\r\n", ms);
}
