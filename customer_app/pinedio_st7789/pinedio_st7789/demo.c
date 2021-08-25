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

/// Use SPI Port Number 0
#define SPI_PORT   0

/// SPI Device Instance. Used by display.c
spi_dev_t spi_device;

/// Command to init the display
static void test_display_init(char *buf, int len, int argc, char **argv)
{
    //  Note: DISPLAY_UNUSED_CS_PIN must NOT be the same as DISPLAY_CS_PIN. 
    //  Because the SPI Pin Function will override the GPIO Pin Function!

    //  NOTE: The settings below were tested on PineDio Stack BL604.
    //  For BL602: The pins for Serial Data In and Serial Data Out seem to be swapped.
    //  See https://lupyuen.github.io/articles/spi#spi-data-pins-are-flipped

    //  Configure the SPI Port
    int rc = spi_init(
        &spi_device, //  SPI Device
        SPI_PORT,    //  SPI Port
        0,           //  SPI Mode: 0 for Controller (formerly Master), 1 for Peripheral (formerly Slave)
        3,           //  SPI Polar Phase: Must be 3 for ST7789. Valid values: 0 (CPOL=0, CPHA=0), 1 (CPOL=0, CPHA=1), 2 (CPOL=1, CPHA=0) or 3 (CPOL=1, CPHA=1)
        ////4 * 1000 * 1000,  //  SPI Frequency (4 MHz, reduce this in case of problems)
        1 * 1000 * 1000,  //  SPI Frequency (1 MHz, reduce this in case of problems)
        2,   //  Transmit DMA Channel
        3,   //  Receive DMA Channel
        DISPLAY_SCK_PIN,        //  SPI Clock Pin 
        DISPLAY_UNUSED_CS_PIN,  //  Unused SPI Chip Select Pin (Unused because we control GPIO 14 ourselves as Chip Select Pin. This must NOT be set to 20, SPI will override our GPIO!)
        DISPLAY_MOSI_PIN,       //  SPI Serial Data Out Pin (formerly MOSI)
        DISPLAY_MISO_PIN,       //  SPI Serial Data In Pin  (formerly MISO) (Unused for ST7789)
    );
    assert(rc == 0);

    //  Configure the GPIO Pins, init the display controller and switch on backlight
    rc = init_display();
    assert(rc == 0);
}

/* To troubleshoot SPI Transfers that hang, edit function hal_spi_dma_trans in components/hal_drv/bl602_hal/hal_spi.c...
    uxBits = xEventGroupWaitBits(arg->spi_dma_event_group,
        EVT_GROUP_SPI_DMA_TR,
        pdTRUE,
        pdTRUE,
        //  Previously we wait forever: portMAX_DELAY
        //  Now we wait max 100 milliseconds.
        100 / portTICK_PERIOD_MS);
*/

/// Command to display image. Should be done after `display_init`
static void test_display_image(char *buf, int len, int argc, char **argv)
{
    int rc = display_image();
    assert(rc == 0);
}

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
Set CS pin 20 to high
Set BLK pin 21 to low
SPI Tx: 9 bytes:
 00 80 00 00 00 00 00 00 00
Set CS pin 20 to low
Set CS pin 20 to high
TODO Delay 200
SPI Tx: 9 bytes:
 08 80 00 00 00 00 00 00 00
Set CS pin 20 to low
Set CS pin 20 to high
TODO Delay 200
SPI Tx: 9 bytes:
 19 c0 20 11 48 04 02 00 00
Set CS pin 20 to low
Set CS pin 20 to high
SPI Tx: 9 bytes:
 09 80 00 00 00 00 00 00 00
Set CS pin 20 to low
Set CS pin 20 to high
TODO Delay 10
SPI Tx: 9 bytes:
 10 80 00 00 00 00 00 00 00
Set CS pin 20 to low
Set CS pin 20 to high
SPI Tx: 9 bytes:
 1b 40 00 00 00 00 00 00 00
Set CS pin 20 to low
Set CS pin 20 to high
SPI Tx: 9 bytes:
 1d 55 40 00 00 00 00 00 00
Set CS pin 20 to low
Set CS pin 20 to high
SPI Tx: 9 bytes:
 14 80 00 00 00 00 00 00 00
Set CS pin 20 to low
Set CS pin 20 to high
TODO Delay 200

# display_image
Displaying image...
SPI Tx: 9 bytes:
 15 40 20 10 08 08 00 00 00
Set CS pin 20 to low
Set CS pin 20 to high
SPI Tx: 9 bytes:
 15 c0 20 10 08 00 00 00 00
Set CS pin 20 to low
Set CS pin 20 to high
SPI Tx: 9 bytes:
 16 6a b5 5a ad 50 00 00 00
Set CS pin 20 to low
Set CS pin 20 to high
SPI Tx: 9 bytes:
 15 40 20 10 08 08 00 00 00
Set CS pin 20 to low
Set CS pin 20 to high
SPI Tx: 9 bytes:
 15 c0 20 30 08 08 00 00 00
Set CS pin 20 to low
Set CS pin 20 to high
SPI Tx: 9 bytes:
 16 6a b5 5a ad 50 00 00 00
Set CS pin 20 to low
Set CS pin 20 to high
SPI Tx: 9 bytes:
 15 40 20 10 08 08 00 00 00
Set CS pin 20 to low
Set CS pin 20 to high
SPI Tx: 9 bytes:
 15 c0 20 50 08 10 00 00 00
Set CS pin 20 to low
Set CS pin 20 to high
SPI Tx: 9 bytes:
 16 6a b5 5a ad 50 00 00 00
Set CS pin 20 to low
Set CS pin 20 to high
SPI Tx: 9 bytes:
 15 40 20 10 08 08 00 00 00
Set CS pin 20 to low
Set CS pin 20 to high
SPI Tx: 9 bytes:
 15 c0 20 70 08 18 00 00 00
Set CS pin 20 to low
Set CS pin 20 to high
SPI Tx: 9 bytes:
 16 6a b5 5a ad 50 00 00 00
Set CS pin 20 to low
Set CS pin 20 to high
SPI Tx: 9 bytes:
 15 40 20 10 08 08 00 00 00
Set CS pin 20 to low
Set CS pin 20 to high
SPI Tx: 9 bytes:
 15 c0 20 90 08 20 00 00 00
Set CS pin 20 to low
Set CS pin 20 to high
SPI Tx: 9 bytes:
 16 6a b5 5a ad 50 00 00 00
Set CS pin 20 to low
Set CS pin 20 to high
SPI Tx: 9 bytes:
 15 40 20 10 08 08 00 00 00
Set CS pin 20 to low
Set CS pin 20 to high
SPI Tx: 9 bytes:
 15 c0 20 b0 08 28 00 00 00
Set CS pin 20 to low
Set CS pin 20 to high
SPI Tx: 9 bytes:
 16 6a b5 5a ad 50 00 00 00
Set CS pin 20 to low
Set CS pin 20 to high
SPI Tx: 9 bytes:
 15 4020 10 08 08 00 00 00
Set CS pin 20 to low
Set CS pin 20 to high
SPI Tx: 9 bytes:
 15 c0 20 d0 08 30 00 00 00
Set CS pin 20 to low
Set CS pin 20 to high
SPI Tx: 9 bytes:
 16 6a b5 5a ad 50 00 00 00
Set CS pin 20 to low
Set CS pin 20 to high
SPI Tx: 9 bytes:
 15 40 20 10 08 08 00 00 00
Set CS pin 20 to low
Set CS pin 20 to high
SPI Tx: 9 bytes:
 15 c0 20 f0 08 38 00 00 00
Set CS pin 20 to low
Set CS pin 20 to high
SPI Tx: 9 bytes:
 16 6a b5 5a ad 50 00 00 00
Set CS pin 20 to low
Set CS pin 20 to high
SPI Tx: 9 bytes:
 15 40 20 10 08 08 00 00 00
Set CS pin 20 to low
Set CS pin 20 to high
SPI Tx: 9 bytes:
 15 c0 21 10 08 40 00 00 00
Set CS pin 20 to low
Set CS pin 20 to high
SPI Tx: 9 bytes:
 16 6a b5 5a ad 50 00 00 00
Set CS pin 20 to low
Set CS pin 20 to high
SPI Tx: 9 bytes:
 15 40 20 10 08 08 00 00 00
Set CS pin 20 to low
Set CS pin 20 to high
SPI Tx: 9 bytes:
 15 c0 21 30 08 48 00 00 00
Set CS pin 20 to low
Set CS pin 20 to high
SPI Tx: 9 bytes:
 16 6a b5 5a ad 50 00 00 00
Set CS pin 20 to low
Set CS pin 20 to high
Image displayed

# 
*/