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
//  PineDio Stack Demo Firmware for ST7789 SPI in 4-Wire (8-bit) Mode, bit-banging with GFX Library
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
    debug_st7789("  d:%04x\r\n", color);
    Arduino_SWSPI_write16(color);
    Arduino_SWSPI_endWrite();  ////
}

/// Command to init the display
static void test_display_init(char *buf, int len, int argc, char **argv)
{
    int rc;
    printf("Display DC GPIO:  %d\r\n", DISPLAY_DC_PIN);
    printf("Display RST GPIO: %d\r\n", DISPLAY_RST_PIN);
    printf("SPI MOSI GPIO:    %d\r\n", DISPLAY_MOSI_PIN);
    printf("SPI MISO GPIO:    %d\r\n", DISPLAY_MISO_PIN);
    printf("SPI SCK GPIO:     %d\r\n", DISPLAY_SCK_PIN);
    printf("SPI CS GPIO:      %d\r\n", DISPLAY_CS_PIN);
    printf("Debug CS GPIO:    %d\r\n", DISPLAY_DEBUG_CS_PIN);
    printf("Unused CS GPIO:   %d\r\n", DISPLAY_UNUSED_CS_PIN);
    printf("Flash CS GPIO:    %d\r\n", FLASH_CS_PIN);
    printf("SX1262 CS GPIO:   %d\r\n", SX1262_CS_PIN);
    printf("Backlight GPIO:   %d\r\n", DISPLAY_BLK_PIN);
    printf("Resolution:       %d x %d\r\n", LV_VER_RES_MAX, LV_HOR_RES_MAX);

#ifdef NOTUSED
    //  Configure Chip Select, Data/Command, MOSI, SCK pins as GPIO Pins
    GLB_GPIO_Type pins[] = {
        DISPLAY_DC_PIN,
        DISPLAY_MOSI_PIN,
        DISPLAY_MISO_PIN,
        DISPLAY_SCK_PIN,
        DISPLAY_CS_PIN,
        DISPLAY_DEBUG_CS_PIN,
        DISPLAY_UNUSED_CS_PIN,
        FLASH_CS_PIN,
        SX1262_CS_PIN,
        DISPLAY_BLK_PIN
    };
    BL_Err_Type rc2 = GLB_GPIO_Func_Init(
        GPIO_FUN_SWGPIO, 
        pins, 
        sizeof(pins) / sizeof(pins[0])
    );
    assert(rc2 == SUCCESS);
#endif // NOTUSED

    //  Configure MISO as GPIO Input Pin (instead of GPIO Output)
    rc = bl_gpio_enable_input(DISPLAY_MISO_PIN,  0, 0);  assert(rc == 0);

    //  Configure MOSI and SCK pins as GPIO Output Pins (instead of GPIO Input)
    rc = bl_gpio_enable_output(DISPLAY_MOSI_PIN, 0, 0);  assert(rc == 0);
    rc = bl_gpio_enable_output(DISPLAY_SCK_PIN,  0, 0);  assert(rc == 0);

    //  Configure DC, Chip Select, Reset, Backlight pins as GPIO Output Pins (instead of GPIO Input)
    rc = bl_gpio_enable_output(DISPLAY_DC_PIN,   0, 0);  assert(rc == 0);
    rc = bl_gpio_enable_output(DISPLAY_CS_PIN,   0, 0);  assert(rc == 0);
    rc = bl_gpio_enable_output(DISPLAY_RST_PIN,  0, 0);  assert(rc == 0);
    rc = bl_gpio_enable_output(DISPLAY_BLK_PIN,  0, 0);  assert(rc == 0);
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

    //  Init GFX Driver for Bit-Banging 9-bit data
    Arduino_SWSPI_Arduino_SWSPI(
        DISPLAY_DC_PIN,    //  dc
        DISPLAY_CS_PIN,    //  cs
        DISPLAY_SCK_PIN,   //  sck
        DISPLAY_MOSI_PIN,  //  mosi
        DISPLAY_MISO_PIN,  //  miso
        DISPLAY_DEBUG_CS_PIN  //  cs2
    );
    Arduino_ST7789_Arduino_ST7789(
        DISPLAY_RST_PIN,   //  rst, 
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
    //  Call GFX Library to render a box of color 0xAAAA, by Bit-Banging 9-bit data
    for (int16_t y = 0; y < LV_VER_RES_MAX; y++) {
        for (int16_t x = 0; x < LV_HOR_RES_MAX; x++) {
            Arduino_TFT_writePixelPreclipped(x, y, 0xAAAA);
            Arduino_SWSPI_delay(10);
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

# reboot
reboot
▒Starting bl602 now....
Booting BL602 Chip...
██████╗ ██╗      ██████╗  ██████╗ ██████╗
██╔══██╗██║     ██╔════╝ ██╔═████╗╚════██╗
██████╔╝██║     ███████╗ ██║██╔██║ █████╔╝
██╔══██╗██║     ██╔═══██╗████╔╝██║██╔═══╝
██████╔╝███████╗╚██████╔╝╚██████╔╝███████╗
╚═════╝ ╚══════╝ ╚═════╝  ╚═════╝ ╚══════╝


------------------------------------------------------------
RISC-V Core Feature:RV32-ACFIMX
Build Version: release_bl_iot_sdk_1.6.11-1-g66bb28da-dirty
Build Date: Dec  2 2021
Build Time: 14:14:27
------------------------------------------------------------

blog init set power on level 2, 2, 2.
[IRQ] Clearing and Disable all the pending IRQ...
[OS] Starting aos_loop_proc task...
[OS] Starting OS Scheduler...
=== 32 task inited
====== bloop dump ======
  bitmap_evt 0
  bitmap_msg 0
--->>> timer list:
  32 task:
    task[31] : SYS [built-in]
      evt handler 0x2300a616, msg handler 0x2300a5e6, trigged cnt 0, bitmap async 0 sync 0, time consumed 0us acc 0ms, max 0us
    task[30] : empty
    task[29] : empty
    task[28] : empty
    task[27] : empty
    task[26] :empty
    task[25] : empty
    task[24] : empty
    task[23] : empty
    task[22] : empty
    task[21] : empty
    task[20] : empty
    task[19] : empty
    task[18] : empty
    task[17] : empty
    task[16] : empty
    task[15] : empty
    task[14] : empty
    task[13] : empty
    task[12] : empty
    task[11] : empty
    task[10] : empty
    task[09] : empty
    task[08] : empty
    task[07] : empty
    task[06] : empty
    task[05] : empty
    task[04] : empty
    task[03] : empty
    task[02] : empty
    task[01] : empty
    task[00] : empty
Init CLI with event Driven

# display_init
Display DC GPIO:  13
Display RST GPIO: 3
SPI MOSI GPIO:    0
SPI MISO GPIO:    8
SPI SCK GPIO:     11
SPI CS GPIO:      13
Debug CS GPIO:    5
Unused CS GPIO:   8
Flash CS GPIO:    14
SX1262 CS GPIO:   15
Backlight GPIO:   21
Resolution:       10 x 5
Set Flash CS pin 14 to high
Set SX1262 CS pin 15 to high
Set CS pin 13 to high
Set Debug CS pin 5 to high
+ rst 3
- rst 3
+ rst 3
c:01
+ dc 13 data
+ cs 13 enable
+ cs2 5 enable
- dc 13 command
+ dc 13 data
- cs 13 disable
- cs2 5 disable
+ dc 13 data
+ cs 13 enable
+ cs2 5 enable
c:11
- dc 13 command
+ dc 13 data
- cs 13 disable
- cs2 5 disable
+ dc 13 data
+ cs 13 enable
+ cs2 5 enable
c:3a
- dc 13 command
+ dc 13 data
  d:55
c:36
- dc 13 command
+ dc 13 data
  d:00
c:b2
- dc 13 command
+ dc 13 data
  d:0c
  d:0c
  d:00
  d:33
  d:33
c:b7
- dc 13 command
+ dc 13 data
  d:35
c:bb
- dc 13 command
+ dc 13 data
  d:19
c:c0
- dc 13 command
+ dc 13 data
  d:2c
c:c2
- dc 13 command
+ dc 13 data
  d:01
c:c3
- dc 13 command
+ dc 13 data
  d:12
c:c4
- dc 13 command
+ dc 13 data
  d:20
c:c6
- dc 13 command
+ dc 13 data
  d:0f
c:d0
- dc 13 command
+ dc 13 data
  d:a4
  d:a1
c:e0
- dc 13 command
+ dc 13 data
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
- dc 13 command
+ dc 13 data
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
- dc 13 command
+ dc 13 data
- cs 13 disable
- cs2 5 disable
+ dc 13 data
+ cs 13 enable
+ cs2 5 enable
c:29
- dc 13 command
+ dc 13 data
- cs 13 disable
- cs2 5 disable
MADCTL
c:36
+ dc 13 data
+ cs 13 enable
+ cs2 5 enable
- dc 13 command
+ dc 13 data
- cs 13 disable
- cs2 5 disable

# display_image
+ dc 13 data
+ cs 13 enable
+ cs2 5 enable
CASET
c:2a d:0000 0000
- dc 13 command
+ dc 13 data
RASET
c:2b d:0000 0000
- dc 13 command
+ dc 13 data
RAMWR
c:2c
- dc 13 command
+ dc 13 data
  d:aaaa
- cs 13 disable
- cs2 5 disable
+ dc 13 data
+ cs 13 enable
+ cs2 5 enable
CASET
c:2a d:0001 0001
- dc 13 command
+ dc 13 data
RAMWR
c:2c
- dc 13 command
+ dc 13 data
  d:aaaa
- cs 13 disable
- cs2 5 disable
+ dc 13 data
+ cs 13 enable
+ cs2 5 enable
CASET
c:2a d:0002 0002
- dc 13 command
+ dc 13 data
RAMWR
c:2c
- dc 13 command
+ dc 13 data
  d:aaaa
- cs 13 disable
- cs2 5 disable
+ dc 13 data
+ cs 13 enable
+ cs2 5 enable
CASET
c:2a d:0003 0003
- dc 13 command
+ dc 13 data
RAMWR
c:2c
- dc 13 command
+ dc 13 data
  d:aaaa
- cs 13 disable
- cs2 5 disable
+ dc 13 data
+ cs 13 enable
+ cs2 5 enable
CASET
c:2a d:0004 0004
- dc 13 command
+ dc 13 data
RAMWR
c:2c
- dc 13 command
+ dc 13 data
  d:aaaa
- cs 13 disable
- cs2 5 disable
+ dc 13 data
+ cs 13 enable
+ cs2 5 enable
CASET
c:2a d:0000 0000
- dc 13 command
+ dc 13 data
RASET
c:2b d:0001 0001
- dc 13 command
+ dc 13 data
RAMWR
c:2c
- dc 13 command
+ dc 13 data
  d:aaaa
- cs 13 disable
- cs2 5 disable
+ dc 13 data
+ cs 13 enable
+ cs2 5 enable
CASET
c:2a d:0001 0001
- dc 13 command
+ dc 13 data
RAMWR
c:2c
- dc 13 command
+ dc 13 data
  d:aaaa
- cs 13 disable
- cs2 5 disable
+ dc 13 data
+ cs 13 enable
+ cs2 5 enable
CASET
c:2a d:0002 0002
- dc 13 command
+ dc 13 data
RAMWR
c:2c
- dc 13 command
+ dc 13 data
  d:aaaa
- cs 13 disable
- cs2 5 disable
+ dc 13 data
+ cs 13 enable
+ cs2 5 enable
CASET
c:2a d:0003 0003
- dc 13 command
+ dc 13 data
RAMWR
c:2c
- dc 13 command
+ dc 13 data
  d:aaaa
- cs 13 disable
- cs2 5 disable
+ dc 13 data
+ cs 13 enable
+ cs2 5 enable
CASET
c:2a d:0004 0004
- dc 13 command
+ dc 13 data
RAMWR
c:2c
- dc 13 command
+ dc 13 data
  d:aaaa
- cs 13 disable
- cs2 5 disable
+ dc 13 data
+ cs 13 enable
+ cs2 5 enable
CASET
c:2a d:0000 0000
- dc 13 command
+ dc 13 data
RASET
c:2b d:0002 0002
- dc 13 command
+ dc 13 data
RAMWR
c:2c
- dc 13 command
+ dc 13 data
  d:aaaa
- cs 13 disable
- cs2 5 disable
+ dc 13 data
+ cs 13 enable
+ cs2 5 enable
CASET
c:2a d:0001 0001
- dc 13 command
+ dc 13 data
RAMWR
c:2c
- dc 13 command
+ dc 13 data
  d:aaaa
- cs 13 disable
- cs2 5 disable
+ dc 13 data
+ cs 13 enable
+ cs2 5 enable
CASET
c:2a d:0002 0002
- dc 13 command
+ dc 13 data
RAMWR
c:2c
- dc 13 command
+ dc 13 data
  d:aaaa
- cs 13 disable
- cs2 5 disable
+ dc 13 data
+ cs 13 enable
+ cs2 5 enable
CASET
c:2a d:0003 0003
- dc 13 command
+ dc 13 data
RAMWR
c:2c
- dc 13 command
+ dc 13 data
  d:aaaa
- cs 13 disable
- cs2 5 disable
+ dc 13 data
+ cs 13 enable
+ cs2 5 enable
CASET
c:2a d:0004 0004
- dc 13 command
+ dc 13 data
RAMWR
c:2c
- dc 13 command
+ dc 13 data
  d:aaaa
- cs 13 disable
- cs2 5 disable
+ dc 13 data
+ cs 13 enable
+ cs2 5 enable
CASET
c:2a d:0000 0000
- dc 13 command
+ dc 13 data
RASET
c:2b d:0003 0003
- dc 13 command
+ dc 13 data
RAMWR
c:2c
- dc 13 command
+ dc 13 data
  d:aaaa
- cs 13 disable
- cs2 5 disable
+ dc 13 data
+ cs 13 enable
+ cs2 5 enable
CASET
c:2a d:0001 0001
- dc 13 command
+ dc 13 data
RAMWR
c:2c
- dc 13 command
+ dc 13 data
  d:aaaa
- cs 13 disable
- cs2 5 disable
+ dc 13 data
+ cs 13 enable
+ cs2 5 enable
CASET
c:2a d:0002 0002
- dc 13 command
+ dc 13 data
RAMWR
c:2c
- dc 13 command
+ dc 13 data
  d:aaaa
- cs 13 disable
- cs2 5 disable
+ dc 13 data
+ cs 13 enable
+ cs2 5 enable
CASET
c:2a d:0003 0003
- dc 13 command
+ dc 13 data
RAMWR
c:2c
- dc 13 command
+ dc 13 data
  d:aaaa
- cs 13 disable
- cs2 5 disable
+ dc 13 data
+ cs 13 enable
+ cs2 5 enable
CASET
c:2a d:0004 0004
- dc 13 command
+ dc 13 data
RAMWR
c:2c
- dc 13 command
+ dc 13 data
  d:aaaa
- cs 13 disable
- cs2 5 disable
+ dc 13 data
+ cs 13 enable
+ cs2 5 enable
CASET
c:2a d:0000 0000
- dc 13 command
+ dc 13 data
RASET
c:2b d:0004 0004
- dc 13 command
+ dc 13 data
RAMWR
c:2c
- dc 13 command
+ dc 13 data
  d:aaaa
- cs 13 disable
- cs2 5 disable
+ dc 13 data
+ cs 13 enable
+ cs2 5 enable
CASET
c:2a d:0001 0001
- dc 13 command
+ dc 13 data
RAMWR
c:2c
- dc 13 command
+ dc 13 data
  d:aaaa
- cs 13 disable
- cs2 5 disable
+ dc 13 data
+ cs 13 enable
+ cs2 5 enable
CASET
c:2a d:0002 0002
- dc 13 command
+ dc 13 data
RAMWR
c:2c
- dc 13 command
+ dc 13 data
  d:aaaa
- cs 13 disable
- cs2 5 disable
+ dc 13 data
+ cs 13 enable
+ cs2 5 enable
CASET
c:2a d:0003 0003
- dc 13 command
+ dc 13 data
RAMWR
c:2c
- dc 13 command
+ dc 13 data
  d:aaaa
- cs 13 disable
- cs2 5 disable
+ dc 13 data
+ cs 13 enable
+ cs2 5 enable
CASET
c:2a d:0004 0004
- dc 13 command
+ dc 13 data
RAMWR
c:2c
- dc 13 command
+ dc 13 data
  d:aaaa
- cs 13 disable
- cs2 5 disable
+ dc 13 data
+ cs 13 enable
+ cs2 5 enable
CASET
c:2a d:0000 0000
- dc 13 command
+ dc 13 data
RASET
c:2b d:0005 0005
- dc 13 command
+ dc 13 data
RAMWR
c:2c
- dc 13 command
+ dc 13 data
  d:aaaa
- cs 13 disable
- cs2 5 disable
+ dc 13 data
+ cs 13 enable
+ cs2 5 enable
CASET
c:2a d:0001 0001
- dc 13 command
+ dc 13 data
RAMWR
c:2c
- dc 13 command
+ dc 13 data
  d:aaaa
- cs 13 disable
- cs2 5 disable
+ dc 13 data
+ cs 13 enable
+ cs2 5 enable
CASET
c:2a d:0002 0002
- dc 13 command
+ dc 13 data
RAMWR
c:2c
- dc 13 command
+ dc 13 data
  d:aaaa
- cs 13 disable
- cs2 5 disable
+ dc 13 data
+ cs 13 enable
+ cs2 5 enable
CASET
c:2a d:0003 0003
- dc 13 command
+ dc 13 data
RAMWR
c:2c
- dc 13 command
+ dc 13 data
  d:aaaa
- cs 13 disable
- cs2 5 disable
+ dc 13 data
+ cs 13 enable
+ cs2 5 enable
CASET
c:2a d:0004 0004
- dc 13 command
+ dc 13 data
RAMWR
c:2c
- dc 13 command
+ dc 13 data
  d:aaaa
- cs 13 disable
- cs2 5 disable
+ dc 13 data
+ cs 13 enable
+ cs2 5 enable
CASET
c:2a d:0000 0000
- dc 13 command
+ dc 13 data
RASET
c:2b d:0006 0006
- dc 13 command
+ dc 13 data
RAMWR
c:2c
- dc 13 command
+ dc 13 data
  d:aaaa
- cs 13 disable
- cs2 5 disable
+ dc 13 data
+ cs 13 enable
+ cs2 5 enable
CASET
c:2a d:0001 0001
- dc 13 command
+ dc 13 data
RAMWR
c:2c
- dc 13 command
+ dc 13 data
  d:aaaa
- cs 13 disable
- cs2 5 disable
+ dc 13 data
+ cs 13 enable
+ cs2 5 enable
CASET
c:2a d:0002 0002
- dc 13 command
+ dc 13 data
RAMWR
c:2c
- dc 13 command
+ dc 13 data
  d:aaaa
- cs 13 disable
- cs2 5 disable
+ dc 13 data
+ cs 13 enable
+ cs2 5 enable
CASET
c:2a d:0003 0003
- dc 13 command
+ dc 13 data
RAMWR
c:2c
- dc 13 command
+ dc 13 data
  d:aaaa
- cs 13 disable
- cs2 5 disable
+ dc 13 data
+ cs 13 enable
+ cs2 5 enable
CASET
c:2a d:0004 0004
- dc 13 command
+ dc 13 data
RAMWR
c:2c
- dc 13 command
+ dc 13 data
  d:aaaa
- cs 13 disable
- cs2 5 disable
+ dc 13 data
+ cs 13 enable
+ cs2 5 enable
CASET
c:2a d:0000 0000
- dc 13 command
+ dc 13 data
RASET
c:2b d:0007 0007
- dc 13 command
+ dc 13 data
RAMWR
c:2c
- dc 13 command
+ dc 13 data
  d:aaaa
- cs 13 disable
- cs2 5 disable
+ dc 13 data
+ cs 13 enable
+ cs2 5 enable
CASET
c:2a d:0001 0001
- dc 13 command
+ dc 13 data
RAMWR
c:2c
- dc 13 command
+ dc 13 data
  d:aaaa
- cs 13 disable
- cs2 5 disable
+ dc 13 data
+ cs 13 enable
+ cs2 5 enable
CASET
c:2a d:0002 0002
- dc 13 command
+ dc 13 data
RAMWR
c:2c
- dc 13 command
+ dc 13 data
  d:aaaa
- cs 13 disable
- cs2 5 disable
+ dc 13 data
+ cs 13 enable
+ cs2 5 enable
CASET
c:2a d:0003 0003
- dc 13 command
+ dc 13 data
RAMWR
c:2c
- dc 13 command
+ dc 13 data
  d:aaaa
- cs 13 disable
- cs2 5 disable
+ dc 13 data
+ cs 13 enable
+ cs2 5 enable
CASET
c:2a d:0004 0004
- dc 13 command
+ dc 13 data
RAMWR
c:2c
- dc 13 command
+ dc 13 data
  d:aaaa
- cs 13 disable
- cs2 5 disable
+ dc 13 data
+ cs 13 enable
+ cs2 5 enable
CASET
c:2a d:0000 0000
- dc 13 command
+ dc 13 data
RASET
c:2b d:0008 0008
- dc 13 command
+ dc 13 data
RAMWR
c:2c
- dc 13 command
+ dc 13 data
  d:aaaa
- cs 13 disable
- cs2 5 disable
+ dc 13 data
+ cs 13 enable
+ cs2 5 enable
CASET
c:2a d:0001 0001
- dc 13 command
+ dc 13 data
RAMWR
c:2c
- dc 13 command
+ dc 13 data
  d:aaaa
- cs 13 disable
- cs2 5 disable
+ dc 13 data
+ cs 13 enable
+ cs2 5 enable
CASET
c:2a d:0002 0002
- dc 13 command
+ dc 13 data
RAMWR
c:2c
- dc 13 command
+ dc 13 data
  d:aaaa
- cs 13 disable
- cs2 5 disable
+ dc 13 data
+ cs 13 enable
+ cs2 5 enable
CASET
c:2a d:0003 0003
- dc 13 command
+ dc 13 data
RAMWR
c:2c
- dc 13 command
+ dc 13 data
  d:aaaa
- cs 13 disable
- cs2 5 disable
+ dc 13 data
+ cs 13 enable
+ cs2 5 enable
CASET
c:2a d:0004 0004
- dc 13 command
+ dc 13 data
RAMWR
c:2c
- dc 13 command
+ dc 13 data
  d:aaaa
- cs 13 disable
- cs2 5 disable
+ dc 13 data
+ cs 13 enable
+ cs2 5 enable
CASET
c:2a d:0000 0000
- dc 13 command
+ dc 13 data
RASET
c:2b d:0009 0009
- dc 13 command
+ dc 13 data
RAMWR
c:2c
- dc 13 command
+ dc 13 data
  d:aaaa
- cs 13 disable
- cs2 5 disable
+ dc 13 data
+ cs 13 enable
+ cs2 5 enable
CASET
c:2a d:0001 0001
- dc 13 command
+ dc 13 data
RAMWR
c:2c
- dc 13 command
+ dc 13 data
  d:aaaa
- cs 13 disable
- cs2 5 disable
+ dc 13 data
+ cs 13 enable
+ cs2 5 enable
CASET
c:2a d:0002 0002
- dc 13 command
+ dc 13 data
RAMWR
c:2c
- dc 13 command
+ dc 13 data
  d:aaaa
- cs 13 disable
- cs2 5 disable
+ dc 13 data
+ cs 13 enable
+ cs2 5 enable
CASET
c:2a d:0003 0003
- dc 13 command
+ dc 13 data
RAMWR
c:2c
- dc 13 command
+ dc 13 data
  d:aaaa
- cs 13 disable
- cs2 5 disable
+ dc 13 data
+ cs 13 enable
+ cs2 5 enable
CASET
c:2a d:0004 0004
- dc 13 command
+ dc 13 data
RAMWR
c:2c
- dc 13 command
+ dc 13 data
  d:aaaa
- cs 13 disable
- cs2 5 disable

#
*/