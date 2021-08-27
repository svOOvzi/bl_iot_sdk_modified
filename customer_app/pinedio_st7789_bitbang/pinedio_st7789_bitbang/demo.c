/*
 * Copyright (c) 2020 Bouffalolab.
 *
 * This file is part of
 *     *** Bouffalolab Software Dev Kit ***
 *      (see www.bouffalolab.com).
 *
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 *   1. Redistributions of source code must retain the above copyright notice,
 *      this list of conditions and the following disclaimer.
 *   2. Redistributions in binary form must reproduce the above copyright notice,
 *      this list of conditions and the following disclaimer in the documentation
 *      and/or other materials provided with the distribution.
 *   3. Neither the name of Bouffalo Lab nor the names of its contributors
 *      may be used to endorse or promote products derived from this software
 *      without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
//  PineDio Stack Demo Firmware for ST7789 SPI in 3-Wire (9-bit) Mode
#include <stdio.h>
#include <string.h>
#include <assert.h>
#include <FreeRTOS.h>
#include <task.h>
#include <semphr.h>

#include "demo.h"            //  For Command-Line Interface
#include "display.h"         //  For Display Pins and Functions
#include <device/vfs_spi.h>  //  For spi_ioc_transfer_t
#include <hal/soc/spi.h>     //  For hal_spi_transfer
#include <hal_spi.h>         //  For spi_init
#include <bl_gpio.h>         //  For bl_gpio_output_set
#include <bl602_glb.h>       //  For GLB_GPIO_Func_Init
#include <cli.h>
#include "Arduino_ST7789.h"  //  For ST7789 GFX Library

/// Use SPI Port Number 0
#define SPI_PORT   0

/// SPI Device Instance. Used by display.c
spi_dev_t spi_device;

/// Sleep for the specified milliseconds
void Arduino_SWSPI_delay(uint32_t millisec) {
    printf("Sleep %d ms\r\n", millisec);
    vTaskDelay(millisec / portTICK_PERIOD_MS);
}

///////////////////////////////////////////////////////////////////////////////
//  Begin Common Code

/// Write a pixel to the display.
/// From https://github.com/moononournation/Arduino_GFX/blob/master/src/Arduino_TFT.cpp#L49-L53
static void Arduino_TFT_writePixelPreclipped(int16_t x, int16_t y, uint16_t color)
{
    Arduino_SWSPI_beginWrite();  ////
    Arduino_ST7789_writeAddrWindow(x, y, 1, 1);
    printf("  d:%04x\r\n", color);
    Arduino_SWSPI_write16(color);
    Arduino_SWSPI_endWrite();  ////
}

/// Command to init the display
static void test_display_init(char *buf, int len, int argc, char **argv)
{
    int rc;
    printf("SPI MOSI GPIO:  %d\r\n", DISPLAY_MOSI_PIN);
    printf("SPI MISO GPIO:  %d\r\n", DISPLAY_MISO_PIN);
    printf("SPI SCK GPIO:   %d\r\n", DISPLAY_SCK_PIN);
    printf("SPI CS GPIO:    %d\r\n", DISPLAY_CS_PIN);
    printf("Debug CS GPIO:  %d\r\n", DISPLAY_DEBUG_CS_PIN);
    printf("Unused CS GPIO: %d\r\n", DISPLAY_UNUSED_CS_PIN);
    printf("Flash CS GPIO:  %d\r\n", FLASH_CS_PIN);
    printf("SX1262 CS GPIO: %d\r\n", SX1262_CS_PIN);
    printf("Backlight GPIO: %d\r\n", DISPLAY_BLK_PIN);
    printf("Resolution:     %d x %d\r\n", LV_VER_RES_MAX, LV_HOR_RES_MAX);

    //  Configure SPI pins as GPIO Output Pins (instead of GPIO Input)
    rc = bl_gpio_enable_output(DISPLAY_MOSI_PIN,  0, 0);  assert(rc == 0);
    rc = bl_gpio_enable_output(DISPLAY_MISO_PIN,  0, 0);  assert(rc == 0);
    rc = bl_gpio_enable_output(DISPLAY_SCK_PIN,  0, 0);  assert(rc == 0);

    //  Configure Chip Select, Backlight pins as GPIO Output Pins (instead of GPIO Input)
    rc = bl_gpio_enable_output(DISPLAY_CS_PIN,  0, 0);  assert(rc == 0);
    rc = bl_gpio_enable_output(DISPLAY_BLK_PIN, 0, 0);  assert(rc == 0);
    rc = bl_gpio_enable_output(DISPLAY_DEBUG_CS_PIN,  0, 0);  assert(rc == 0);  //  TODO: Remove in production
    rc = bl_gpio_enable_output(FLASH_CS_PIN,  0, 0);  assert(rc == 0);
    rc = bl_gpio_enable_output(SX1262_CS_PIN, 0, 0);  assert(rc == 0);

    //  Set Chip Select pin to High, to deactivate SPI Flash and SX1262
    printf("Set Flash CS pin %d to high\r\n", FLASH_CS_PIN);
    rc = bl_gpio_output_set(FLASH_CS_PIN, 1);  assert(rc == 0);
    printf("Set SX1262 CS pin %d to high\r\n", SX1262_CS_PIN);
    rc = bl_gpio_output_set(SX1262_CS_PIN, 1);  assert(rc == 0);

    //  Set Chip Select pin to High, to deactivate ST7789
    printf("Set CS pin %d to high\r\n", DISPLAY_CS_PIN);
    rc = bl_gpio_output_set(DISPLAY_CS_PIN, 1);  assert(rc == 0);

    //  TODO: Remove Debug CS pin in production
    printf("Set Debug CS pin %d to high\r\n", DISPLAY_DEBUG_CS_PIN);
    rc = bl_gpio_output_set(DISPLAY_DEBUG_CS_PIN, 1);  assert(rc == 0);

    //  Init GFX Driver
    Arduino_SWSPI_Arduino_SWSPI(
        -1,                //  dc
        DISPLAY_CS_PIN,    //  cs
        DISPLAY_SCK_PIN,   //  sck
        DISPLAY_MISO_PIN,  //  mosi
        DISPLAY_MOSI_PIN,  //  miso
        DISPLAY_DEBUG_CS_PIN  //  cs2
    );
    Arduino_ST7789_Arduino_ST7789(
        -1,     //  rst, 
        0,      //  r
        false,  //  ips
        LV_HOR_RES_MAX,  //  w
        LV_VER_RES_MAX,  //  h
        0, //  col_offset1
        0, //  row_offset1
        0, //  col_offset2
        0  //  row_offset2
    );
    Arduino_ST7789_begin(1000000);
}

/// Command to display image. Should be done after `display_init`
static void test_display_image(char *buf, int len, int argc, char **argv)
{
    for (int16_t y = 0; y < LV_VER_RES_MAX; y++) {
        for (int16_t x = 0; x < LV_HOR_RES_MAX; x++) {
            Arduino_TFT_writePixelPreclipped(x, y, 0xA0A0);
        }
    }
}

//  End Common Code
///////////////////////////////////////////////////////////////////////////////

/// Command to show the interrupt counters
static void test_display_result(char *buf, int len, int argc, char **argv)
{
    //  Show the Interrupt Counters, Status and Error Codes defined in components/hal_drv/bl602_hal/hal_spi.c
    extern int g_tx_counter, g_rx_counter;
    extern uint32_t g_tx_status, g_tx_tc, g_tx_error, g_rx_status, g_rx_tc, g_rx_error;
    printf("Tx Interrupts: %d\r\n",   g_tx_counter);
    printf("Tx Status:     0x%x\r\n", g_tx_status);
    printf("Tx Term Count: 0x%x\r\n", g_tx_tc);
    printf("Tx Error:      0x%x\r\n", g_tx_error);
    printf("Rx Interrupts: %d\r\n",   g_rx_counter);
    printf("Rx Status:     0x%x\r\n", g_rx_status);
    printf("Rx Term Count: 0x%x\r\n", g_rx_tc);
    printf("Rx Error:      0x%x\r\n", g_rx_error);
}

/// Command to switch on backlight. Should be done after `display_init`
static void test_backlight_on(char *buf, int len, int argc, char **argv)
{
    int rc = backlight_on();
    assert(rc == 0);
}

/// Command to switch off backlight. Should be done after `display_init`
static void test_backlight_off(char *buf, int len, int argc, char **argv)
{
    int rc = backlight_off();
    assert(rc == 0);
}

#ifdef NOTUSED
/// Command to init LVGL. Should be done after `display_init`
static void test_lvgl_init(char *buf, int len, int argc, char **argv)
{
    int rc = lvgl_init();
    assert(rc == 0);
}

/// Command to create LVGL widgets. Should be done after `lvgl_init`
static void test_lvgl_create(char *buf, int len, int argc, char **argv)
{
    int rc = lvgl_create();
    assert(rc == 0);
}

/// Command to update LVGL widgets. Should be done after `lvgl_create`
static void test_lvgl_update(char *buf, int len, int argc, char **argv)
{
    int rc = lvgl_update();
    assert(rc == 0);
}

/// Command to render LVGL display. Should be done after `lvgl_create`
static void test_lvgl_render(char *buf, int len, int argc, char **argv)
{
    int rc = lvgl_render();
    assert(rc == 0);
}
#endif  //  NOTUSED

/// Command to init display, display image
static void test_1(char *buf, int len, int argc, char **argv) {
    test_display_init("", 0, 0, NULL);
    test_display_image("", 0, 0, NULL);
}

#ifdef NOTUSED
/// Command to init display, init LVGL, create LVGL widgets, render LVGL display
static void test_2(char *buf, int len, int argc, char **argv) {
    test_display_init("", 0, 0, NULL);
    test_lvgl_init("", 0, 0, NULL);
    test_lvgl_create("", 0, 0, NULL);
    test_lvgl_render("", 0, 0, NULL);
}

/// Command to update LVGL widgets, render LVGL display
static void test_3(char *buf, int len, int argc, char **argv) {
    test_lvgl_update("", 0, 0, NULL);
    test_lvgl_render("", 0, 0, NULL);
}
#endif  //  NOTUSED

/// List of commands. STATIC_CLI_CMD_ATTRIBUTE makes this(these) command(s) static
const static struct cli_command cmds_user[] STATIC_CLI_CMD_ATTRIBUTE = {
    {"display_init",   "Init display",  test_display_init},
    {"display_image",  "Display image", test_display_image},
    {"display_result", "Show result",   test_display_result},
    {"backlight_on",   "Backlight on",  test_backlight_on},
    {"backlight_off",  "Backlight off", test_backlight_off},
    //  {"lvgl_init",      "Init LVGL",            test_lvgl_init},
    //  {"lvgl_create",    "Create LVGL widgets",  test_lvgl_create},
    //  {"lvgl_update",    "Update LVGL widgets",  test_lvgl_update},
    //  {"lvgl_render",    "Render LVGL display",  test_lvgl_render},
    {"1",              "Init display, display image", test_1},
    //  {"2",              "Init display, init LVGL, create LVGL widgets, render LVGL display", test_2},
    //  {"3",              "Update LVGL widgets, render LVGL display", test_3},
};

/// Init the command-line interface
int cli_init(void)
{
    //  To run a command at startup, use this...
    //  test_1("", 0, 0, NULL);

    return 0;

    // static command(s) do NOT need to call aos_cli_register_command(s) to register.
    // However, calling aos_cli_register_command(s) here is OK but is of no effect as cmds_user are included in cmds list.
    // XXX NOTE: Calling this *empty* function is necessary to make cmds_user in this file to be kept in the final link.
    //return aos_cli_register_commands(cmds_user, sizeof(cmds_user)/sizeof(cmds_user[0]));          
}

/// TODO: We now show assertion failures in development.
/// For production, comment out this function to use the system default,
/// which loops forever without messages.
void __assert_func(const char *file, int line, const char *func, const char *failedexpr)
{
    //  Show the assertion failure, file, line, function name
	printf("Assertion Failed \"%s\": file \"%s\", line %d%s%s\r\n",
        failedexpr, file, line, func ? ", function: " : "",
        func ? func : "");
	//  Loop forever, do not pass go, do not collect $200
	for (;;) {}
}

/* Output Log:


# display_init
SPI MOSI GPIO:  17
SPI MISO GPIO:  0
SPI SCK GPIO:   11
SPI CS GPIO:    20
Debug CS GPIO:  5
Unused CS GPIO: 8
Flash CS GPIO:  14
SX1262 CS GPIO: 15
Backlight GPIO: 21
Resolution:     10 x 5
Set Flash CS pin 14 to high
Set SX1262 CS pin 15 to high
Set CS pin 20 to high
Set Debug CS pin 5 to high
c:01
+ cs 20 enable
+ cs2 5 enable
- cs 20 disable
- cs2 5 disable
Sleep 120 ms
+ cs 20 enable
+ cs2 5 enable
c:11
- cs 20 disable
- cs2 5 disable
Sleep 120 ms
+ cs 20 enable
+ cs2 5 enable
c:3a
  d:55
c:36
  d:00
c:b2
  d:0c
  d:0c
  d:00
  d:33
  d:33
c:b7
  d:35
c:bb
  d:19
c:c0
  d:2c
c:c2
  d:01
c:c3
  d:12
c:c4
  d:20
c:c6
  d:0f
c:d0
  d:a4
  d:a1
c:e0
  d:f0
  d:09
  d:13
  d:12
  d:12
  d:2b
  d:3c
  d:44
  d:4b
  d:1b
  d:18
  d:17
  d:1d
  d:21
c:e1
  d:f0
  d:09
  d:13
  d:0c
  d:0d
  d:27
  d:3b
  d:44
  d:4d
  d:0b
  d:17
  d:17
  d:1d
  d:21
c:13
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ cs 20 enable
+ cs2 5 enable
c:29
- cs 20 disable
- cs2 5 disable
MADCTL
c:36
+ cs 20 enable
+ cs2 5 enable
- cs 20 dible
- cs2 5 disable

# display_image
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0000 0000
RASET
c:2b d:0000 0000
RAMWR
c:2c
  d:a0a
- cs 20 disable
- cs2 5 disable
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0001 0001
RAMWR
c:2c
  d:a0a0
- cs 20 disable
- cs2 5 disable
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0002 0002
RAMWR
c:2c
  d:0a0
- cs 20 disable
- cs2 5 disable
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0003 0003
RAMWR
c:2c
  d:a0a0
- cs 20 disable
- cs2 5 disable
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0004 0004
RAMWR
c:2c
  d:a0a0
- cs 20 disable
- cs2 5 disable
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0000 0000
RASET
c:2b d:0001 0001
RAMWR
c:2c
  d:a0a0
- cs 20 disable
- cs2 5 disable
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0001 0001
RAMWR
c:2c
  d:a0a0
- cs 20 disable
- cs2 5 disable
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0002 0002
RAMWR
c:2c
  d:a0a0
- cs 20 disable
- cs2 5 disable
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0003 0003
RAMWR
c:2c
  d:a0a0
- cs 20 disable
- cs2 5 disable
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0004 0004
RAMWR
c:2c
  d:a0a0
- cs 20 disable
- cs2 5 disable
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0000 0000
RASET
c:2b d:0002 0002
RAMWR
c:2c
  d:a0a0
- cs 20 disable
- cs2 5 disable
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0001 0001
RAMWR
c:2c
  d:a0a0
- cs 20 disable
- cs2 5 disable
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0002 0002
RAMWR
c:2c
  d:a0a0
- cs 20 disable
- cs2 5 disable
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0003 0003
RAMWR
c:2c
  d:a0a0
- cs 20 disable
- cs2 5 disable
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0004 0004
RAMWR
c:2c
  d:a0a0
- cs 20 disable
- cs2 5 disable
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0000 0000
RASET
c:2b d:0003 0003
RAMWR
c:2c
  d:a0a0
- cs 20 disable
- cs2 5 disable
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0001 0001
RAMWR
c:2c
  d:a0a0
- cs 20 disable
- cs2 5 disable
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0002 0002
RAMWR
c:2c
  d:a0a0
- cs 20 disable
- cs2 5 disable
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0003 0003
RAMWR
c:2c
  d:a0a0
- cs 20 disable
- cs2 5 disable
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0004 0004
RAMWR
c:2c
  d:a0a0
- cs 20 disable
- cs2 5 disable
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0000 0000
RASET
c:2b d:0004 0004
RAMWR
c:2c
  d:a0a0
- cs 20 disable
- cs2 5 disable
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0001 0001
RAMWR
c:2c
  d:a0a0
- cs 20 disable
- cs2 5 disable
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0002 0002
RAMWR
c:2c
  d:a0a0
- cs 20 disable
- cs2 5 disable
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0003 0003
RAMWR
c:2c
  d:a0a0
- cs 20 disable
- cs2 5 disable
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0004 0004
RAMWR
c:2c
  d:a0a0
- cs 20 disable
- cs2 5 disable
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0000 0000
RASET
c:2b d:0005 0005
RAMWR
c:2c
  d:a0a0
- cs 20 disable
- cs2 5 disable
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0001 0001
RAMWR
:2c
  d:a0a0
- cs 20 disable
- cs2 5 disable
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0002 0002
RAMWR
c:2c
  d:a0a0
- cs 20 disable
- cs2 5 disable
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0003 0003
RAMWR
c:2c
  d:a0a0
- cs 20 disable
- cs2 5 disable
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0004 0004
RAMWR
c:2c
  d:a0a0
- cs 20 disable
- cs2 5 disable
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0000 0000
RASET
c:2b d:0006 0006
RAMWR
c:2c
  d:a0a0
- cs 20 disable
- cs2 5 disable
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0001 0001
RAMWR
c:2c
  d:a0a0
- cs 20 disable
- cs2 5 disable
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0002 0002
RAMWR
c:2c
  d:a0a0
- cs 20 disable
- cs2 5 disable
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0003 0003
RAMWR
c:2c
  d:a0a0
- cs 20 disable
- cs2 5 disable
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0004 0004
RAMWR
c:2c
  d:a0a0
- cs 20 disable
- cs2 5 disable
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0000 0000
RASET
c:2b d:0007 0007
RAMWR
c:2c
  d:a0a0
- cs 20 disable
- cs2 5 disable
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0001 0001
RAMWR
c:2c
  d:a0a0
- cs 20 disable
- cs2 5 disable
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0002 0002
RAMWR
c:2c
  d:a0a0
- cs 20 disable
- cs2 5 disable
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0003 0003
RAMWR
c:2c
  d:a0a0
- cs 20 disable
- cs2 5 disable
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0004 0004
RAMWR
c:2c
  d:a0a0
- cs 20 disable
- cs2 5 disable
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0000 0000
RASET
c:2b d:0008 0008
RAMWR
c:2c
  d:a0a0
- cs 20 disable
- cs2 5 disable
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0001 0001
RAMWR
c:2c
  d:a0a0
- cs 20 disable
- cs2 5 disable
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0002 0002
RAMWR
c:2c
  d:a0a0
- cs 20 disable
- cs2 5 disable
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0003 0003
RAMWR
c:2c
  d:a0a0
- cs 20 disable
- cs2 5 disable
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0004 0004
RAMWR
c:2c
  d:a0a0
- cs 20 disable
- cs2 5 disable
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0000 0000
RASET
c:2b d:0009 0009
RAMWR
c:2c
  d:a0a0
- cs 20 disable
- cs2 5 disable
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0001 0001
RAMWR
c:2c
  d:a0a0
- cs 20 disable
- cs2 5 disable
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0002 0002
RAMWR
c:2c
  d:a0a0
- cs 20 disable
- cs2 5 disable
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0003 0003
RAMWR
c:2c
  d:a0a0
- cs 20 disable
- cs2 5 disable
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0004 0004
RAMWR
c:2c
  d:a0a0
- cs 20 disable
- cs2 5 disable

# 
*/