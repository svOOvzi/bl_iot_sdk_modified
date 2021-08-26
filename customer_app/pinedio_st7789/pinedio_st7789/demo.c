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
    int rc;
    printf("SPI MOSI GPIO:  %d\r\n", DISPLAY_MOSI_PIN);
    printf("SPI MISO GPIO:  %d\r\n", DISPLAY_MISO_PIN);
    printf("SPI SCK GPIO:   %d\r\n", DISPLAY_SCK_PIN);
    printf("SPI CS GPIO:    %d\r\n", DISPLAY_CS_PIN);
    printf("Debug CS GPIO:  %d\r\n", DISPLAY_DEBUG_CS_PIN);
    printf("Unused CS GPIO: %d\r\n", DISPLAY_UNUSED_CS_PIN);
    printf("Backlight GPIO: %d\r\n", DISPLAY_BLK_PIN);

    //  Configure Chip Select, Backlight pins as GPIO Output Pins (instead of GPIO Input)
    rc = bl_gpio_enable_output(DISPLAY_CS_PIN,  0, 0);  assert(rc == 0);
    rc = bl_gpio_enable_output(DISPLAY_BLK_PIN, 0, 0);  assert(rc == 0);
    rc = bl_gpio_enable_output(DISPLAY_DEBUG_CS_PIN,  0, 0);  assert(rc == 0);  //  TODO: Remove in production

    //  Set Chip Select pin to High, to deactivate SPI Peripheral
    printf("Set CS pin %d to high\r\n", DISPLAY_CS_PIN);
    rc = bl_gpio_output_set(DISPLAY_CS_PIN, 1);  assert(rc == 0);

    //  TODO: Remove in production
    printf("Set Debug CS pin %d to high\r\n", DISPLAY_DEBUG_CS_PIN);
    rc = bl_gpio_output_set(DISPLAY_DEBUG_CS_PIN, 1);  assert(rc == 0);

    //  Note: We must swap MISO and MOSI to comply with the SPI Pin Definitions in BL602 / BL604 Reference Manual
    printf("Swap MISO and MOSI\r\n");
    rc = GLB_Swap_SPI_0_MOSI_With_MISO(ENABLE);  assert(rc == 0);

    //  Note: DISPLAY_UNUSED_CS_PIN must NOT be the same as DISPLAY_CS_PIN. 
    //  Because the SPI Pin Function will override the GPIO Pin Function!

    //  Configure the SPI Port
    rc = spi_init(
        &spi_device, //  SPI Device
        SPI_PORT,    //  SPI Port
        0,           //  SPI Mode: 0 for Controller (formerly Master), 1 for Peripheral (formerly Slave)
        ////3,           //  SPI Polar Phase: Must be 3 for ST7789. Valid values: 0 (CPOL=0, CPHA=0), 1 (CPOL=0, CPHA=1), 2 (CPOL=1, CPHA=0) or 3 (CPOL=1, CPHA=1)
        0,           //  SPI Polar Phase. Valid values: 0 (CPOL=0, CPHA=0), 1 (CPOL=0, CPHA=1), 2 (CPOL=1, CPHA=0) or 3 (CPOL=1, CPHA=1)
        ////4 * 1000 * 1000,  //  SPI Frequency (4 MHz, reduce this in case of problems)
        1 * 1000 * 1000,  //  SPI Frequency (1 MHz, reduce this in case of problems)
        2,   //  Transmit DMA Channel
        3,   //  Receive DMA Channel
        DISPLAY_SCK_PIN,        //  SPI Clock Pin 
        DISPLAY_UNUSED_CS_PIN,  //  Unused SPI Chip Select Pin (Unused because we control GPIO 14 ourselves as Chip Select Pin. This must NOT be set to 20, SPI will override our GPIO!)
        DISPLAY_MOSI_PIN,       //  SPI Serial Data Out Pin (formerly MOSI)
        DISPLAY_MISO_PIN        //  SPI Serial Data In Pin  (formerly MISO) (Unused for ST7789)
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
Set Debug CS pin 5 to high
Swap MISO and MOSI
Set BLK pin 21 to low
SPI Tx: 9 bytes:
 00 80 00 00 00 00 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
TODO Delay 200
SPI Tx: 9 bytes:
 08 80 00 00 00 00 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
TODO Delay 200
SPI Tx: 9 bytes:
 19 c0 20 11 48 04 02 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 09 80 00 00 00 00 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
TODO Delay 10
SPI Tx: 9 bytes:
 10 80 00 00 00 00 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 1b 40 00 00 00 00 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 1d 55 40 00 00 00 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 14 80 00 00 00 00 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
TODO Delay 200

# display_image
Displaying image...
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 20 10 08 00 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 69 66 b6 ba 6d 0a 93 74 88 6d 7a f4 a9 4e 0f 9f ef ce f7...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 20 30 08 08 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 63 2a 3a db ad ae dd 52 e5 d8 e9 b3 18 2e 73 a7 df 9e 77...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 20 50 08 10 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 52 a5 18 4a 86 b6 eb 7b f8 46 38 73 1b 2e 53 a7 a5 cb 75...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 20 70 08 18 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 52 a9 32 99 26 12 61 94 d9 46 34 54 aa 4d 6e 59 7c 98 6b...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 20 90 08 20 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 69 6e b7 3a 6c a6 4b 29 b2 cc 70 b8 cc 8d ef df 4a c5 da...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 20 b0 08 28 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 73 b7 5d f8 de 96 29 20 f2 ce 74 d9 d8 9e fa 31 9c fa 5a...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 20 d0 08 30 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 63 3a 7a 5d b7 7e 79 73 b6 cc 68 b3 1c 3d ef df c6 ac ef...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 20 f0 08 38 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 50 b1 78 4d 9e 97 2d 4a 94 6b 66 99 4c 9c 63 49 5a e5 69...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 21 10 08 40 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 54 b9 74 2e 5d d2 61 41 f3 e7 3e 7f ff fe 96 2b 20 f2 d0...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 21 30 08 48 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 byts:
 16 6b 6e b6 bc 75 0a 53 31 c2 df 22 1a 5b b7 bf 7d bd fc 52...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 21 50 08 50 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 63 32 5b 5e bd 6b 97 21 92 56 e1 97 48 86 b7 af ef de f1...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 21 70 08 58 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 4c 6c b7 c8 7d ae db 31 b2 d6 e1 94 ac 55 8f 5f a5 db f9...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 21 90 08 60 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 5c f5 d3 9d 3c 63 c7 39 f3 e5 36 59 4d 95 8e 9b 5b 96 e3...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 21 b0 08 68 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 6d ab 3a dd bc e7 4d 20 f1 da f1 bb df bf 1a 73 84 a9 5a...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 21 d0 08 70 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 52 bd 9a 5f be 53 a7 31 c2 cc 70 d4 29 46 96 69 d6 ed ef...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 21 f0 08 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 52 b5 54 2e 5d b2 61 5b 85 e5 32 34 1e 3c c6 cd 73 d7 69...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 22 10 08 80 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 6b 6e b6 3b 6d 0a d5 29 b2 df 22 1b e8 c5 cf e1 29 a2 d4...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 22 30 08 88 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 61 26 1a dc ae 12 e3 29 a2 d2 ad 57 48 86 fa b3 9d 9a d4...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 22 50 08 90 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 5a e9 b7 3d 76 b7 6d 52 d5 50 a5 14 2a 4d 6e 5b be cd 6b...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 22 70 08 98 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 5c f9 f5 af 5d 2a 93 39 e3 d0 a5 17 bf 7d 8e 9b 5b 96 e7...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 22 90 08 a0 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 50 b5 56 3d 7d cf 9f 29 a2 c8 64 98 cd 96 d7 af 9c fa 5a...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 22 b0 08 a8 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 61 2a 34 ae 5d b2 21 8c f9 d0 a0 f2 19 25 ae dd be 8c 73...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 22 d0 08 b0 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 69 6e da 5a ad 8e 9b 63 d7 d4 e1 94 28 3d 0a 51 42 94 63...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 22 f0 08 b8 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 5e f9 f8 cd 96 d7 af 8c d9 54 bd 94 aa 4e 32 a3 4a b4 d0...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 23 10 08 c0 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 6b 6a 99 4c 96 12 63 a5 bb 6d 7e f4 ab 55 6e 17 74 88 5c...
Set CS pin 20 to lDebug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 23 30 08 c8 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 5c f1 d7 be 7d ef 9d 7b f7 e9 6a b8 cd 9d 4b 95 5a f6 50...
Set CS pin 20 to lw
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 23 50 08 d0 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 67 3e 76 3a 6d 2b 15 4a b4 d6 b5 76 bd 75 0a 51 5a e5 d8...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 23 70 08 d8 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 63 2e 3b 5e b6 53 e9 53 86 50 ad 35 2e 5c a6 cb 39 f3 e9...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 23 90 08 e0 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 58 e9 b6 3a 6e 53 a7 ad cb 61 2e 35 ba 6d 4e 19 42 94 4c...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 23 b0 08 e8 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 6d 7a f9 4e 9d ef df 7b f8 69 66 99 d8 a5 cf 9f 4a d5 4a...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 23 d0 08 f0 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 65 36 5a dc b6 fa 31 a5 ba e3 2e 59 4d 9e b7 2d 94 e9 d2...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 23 f0 08 f8 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 54 b1 56 bb 6e 12 a3 a5 aa eb 6a b9 cf 9e 53 67 a5 bb 6b...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 0 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 24 10 09 00 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 56 bd 76 bb 6d cf 5f 84 88 65 36 59 4d 96 32 63 73 d7 e7...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 24 30 09 08 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug S pin 5 to high
SPI Tx: 549 bytes:
 16 69 6a b7 3d 7d cf 1d 6b b6 df 22 1a 59 ae 33 65 73 e7 d4...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 24 50 09 10 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 69 6e da 5a ad f2 21 7b e7 d0 a5 34 ab 56 53 e7 a5 bb 63...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 24 70 09 18 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 63 2e 58 cb 96 32 e3 6b a6 d8 e9 b5 2d 55 ae db 7b f8 65...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 24 90 09 20 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 65 36 79 4d 9e 12 63 4a b5 4a 68 b7 3d 6e b6 a9 a5 aa e5...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 24 b0 09 28 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 63 2e 5a 5a ae b7 6f a5 ab 5c f5 f4 aa 4d 2a 51 7b f8 6b...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 24 d0 09 30 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 5e fe 17 3d 7e 33 25 9d 9a ef ab 3b 5e bd af 1d 42 94 d4...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 24 f0 09 38 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 6b 72 f9 4e 9d f2 21 84 98 df 22 18 cc 96 d7 f1 a5 cb 5e...
Set CS pin 20 to lebug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 25 10 09 40 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 6d 7b 1b 5d be 53 a7 7c 88 56 e1 97 3f 86 76 6b a5 bb 6b...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 5 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 25 30 09 48 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 63 2e 58 cc 96 32 e3 5a e5 d0 a9 38 4a 96 96 ed a5 bb 69...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 25 50 09 50 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 56 b9 95 b8 65 f2 21 9c fa 67 3e 97 c8 85 8e 5b 6b b7 63...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 25 70 09 58 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 6f a7 3a 5a ae 53 a9 8c d9 e9 6a bb e8 c6 b6 ed 8c c9 5c...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 25 90 09 60 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 67 62 9b e9 cf 1a b5 ad cb e5 3a 98 ca 96 76 29 be 9c ed...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SP Tx: 9 bytes:
 15 c0 25 b0 09 68 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 56 b9 96 bc 7e 53 a9 b5 db f1 ab 3b 5d be 53 a9 84 a9 65...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 25 d0 09 70 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 65 3a 99 d9 ae 76 2b 8c c9 61 2a 59 d8 a6 b7 2f a5 aa e3...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 25 f0 09 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 65 3a 7a 5a ae d7 b1 ad cb 67 62 98 cc 95 ef a1 8c a9 69...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 26 10 09 80 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 67 62 b8 cc 9d cf 9f 9d 9a ef a3 3a dc b5 f2 21 63 a6 da...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 26 30 09 88 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 6d 7b 18 4a 8d 8e 5b 7b f8 5a e9 d5 af 65 f2 21 8c b9 5a...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 26 50 09 90 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 56 b9 95 af 66 53 67 a5 9a e5 36 78 cb 96 53 67 9d 8a eb...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 26 70 09 98 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 63 2e 58 cc 9e 33 67 94 fa 6b 72 fb e8 c6 b7 2f 94 fa 65...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 26 90 09 a0 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 6f a3 3c 6a d6 fa 33 b5 db e9 6a d9 4e 9e 32 e5 b5 ec 6b...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 26 b0 09 a8 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 63 2e 79 cf a6 96 ed ad cb e9 66 ba 5a ad cf 1d 63 a6 d4...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 26 d0 09 b0 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 6b 76 fa 5a ae 73 e9 84 8 e7 66 b8 49 8d 6e 19 84 99 61...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 26 f0 09 b8 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 6b 76 fa dc be 76 2b 8c b9 58 e9 b3 1c 35 cf 5f b5 ec 71...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 27 10 09 c0 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 65 36 79 4e a6 76 2b 94 d9 52 b1 57 c8 8e 33 27 84 a8 e3...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 27 30 09 c8 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 6b 72 f9 4e a6 32 e5 73 c7 61 26 3b 68 ce fa b5 be 8c eb...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 27 50 09 d0 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 6b 72 da 5a b5 6b d7 42 84 5a e9 d7 3d 7e 12 e5 a5 ab 6d...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 27 70 09 d8 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 67 3e 99 4f a5 4b 55 6b c7 69 6e d9 d8 a6 53 67 94 d9 e5...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 27 90 09 e0 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 63 32 77 3e 7d 4b 57 7c 98 e9 6e db ea cf 1a f5 be 9c ed...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 27 b0 09 e8 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 69 6a d6 3a 65 0a 51 63 b7 5c f5 f8 4b 96 76 2b ad cb 6b...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 27 d0 09 f0 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 67 62 b7 bf 75 4b 55 84 a9 65 3e 99 4e a6 53 67 94 d9 e5...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 27 f0 09 f8 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 65 3a 96 39 65 4b 97 84 a9 6b 72 fb e9 ce d7 f1 b5 db e9...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 28 10 0a 00 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 6b 76 f6 38 65 2a d5 73 e7 df 22 38 49 8e 73 e9 ad cb eb...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 28 30 0a 08 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 69 6e d7 c9 85 8e 5b 94 d9 e9 6e da 5a b6 76 2b 9d 8a e5...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 28 50 0a 10 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 6b 6e d7 bf 85 4b d9 7c 88 e9 66 bb e8 ce fa 73 b5 fc 6d...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 28 70 0a 18 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 63 32 56 bb 75 4b 97 6b d7 dc fa 18 cc 9e 53 e9 a5 ab 6b...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 28 90 0a 20 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 5e f9 f9 4e 9d cf df 73 e7 e1 2a 5a dc be d7 b1 ad cb e9...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 28 b0 0a 28 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 6b 72 fb 5e bd cf 9f 5b 86 5f 22 19 4e a6 da 31 be ad 6f...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 28 d0 0a 30 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 63 2e 59 cf a6 33 25 5a f6 5e fe 19 4d 9e 53 69 94 ea 69...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 28 f0 0a 38 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 67 3e b9 4e a6 12 63 42 a4 df 22 39 d9 ae 76 2b 8c c9 dc...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 29 10 0a 40 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 6b 6e da 5a ad 6b 97 42 a4 dc fa 18 cb 96 53 69 a5 ab 58...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 29 30 0a 48 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 67 3e 9a db b5 4b 97 6b d7 eb 6e da dc b6 96 ad 94 d9 50...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 29 50 0a 50 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 6d 76 f9 4d 9c ea 0f 4a b5 5e fe 19 cf a6 b7 2d 6b b7 56...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 29 70 0a 58 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 6d 7f 17 3e 7d 6b d9 9d 8a e9 66 ba 5a b6 96 ab 63 96 52...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 29 90 0a 60 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 6b 76 f7 3f 85 ae db b5 fc 6b 76 fa 5b b6 53 a7 52 c5 58...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 29 b0 0a 68 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 69 6a d5 af 64 e7 d1 73 e8 65 3a 9a 5b b6 b7 6f 5b 86 61...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 29 d0 0a 70 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 71 ab 36 38 65 8e 5b b5 ec 6f a7 5b e8 ce 96 ad 52 c5 d2...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 29 f0 0a 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 71 a7 36 bc 75 2b 17 8c da 69 6a da dd be 53 a9 73 b7 65...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 2a 10 0a 80 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 6b 72 d8 49 8e 96 6b ad bb 67 3e bb 5e c6 b7 6f 73 d7 e5...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 2a 30 0a 88 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 73 af 5b 5c b7 3a f5 e7 ae f3 b3 7c 69 d6 96 6b 63 b7 5a...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 2a 50 0a 90 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 71 ab 37 bf 85 0a 95 8c da 6d 7b 1b 5f c6 b7 af 8c d9 e9...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 2a 70 0a 98 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 6d 7b 18 4a 8e 12 63 9d 9a e7 3e 9b e8 cf 1a f7 73 e8 5f...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 2a 90 0a a0 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 73 ab 5c 6a ce b6 ed ad eb ed 77 1b e9 ce d7 f1 73 d7 d4...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 2a b0 0a a8 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 75 bf b8 4a 7c ea 11 73 d8 6b 6e da db b7 1a b3 ce bd 5c...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 2a d0 0a b0 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 5a f5 d1 9b 15 af 1d c6 9d 6f 7f 1b de c7 3a b5 a5 99 ce...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 2a f0 0a b8 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 46 68 32 19 1e 32 e1 e7 be f7 eb 9b e8 c6 d7 b1 7c 98 48...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 2b 10 0a c0 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 4a 78 91 98 1c 86 87 21 b2 5c f6 1a 59 ae b7 2f df 8e da...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 2b 30 0a c8 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 48 6c 72 9e 24 23 05 18 e2 65 32 7c 69 cf 1a 73 ce cc e1...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 2b 50 0a d0 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 4e ac b4 2f 2c ea cb 5b 96 6f a3 1b ea d6 53 e9 73 f5 d8...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 2b 70 0a d8 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 48 68 53 1f 24 eb 49 31 f1 52 b5 9b 68 c6 33 9f 29 e1 c4...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 2b 90 0a e0 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 44 34 51 0c 14 66 05 29 e1 5d 21 77 cb 5c a7 c3 31 e2 d0...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 2b b0 0a e8 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 48 68 90 8a 0c 43 47 19 91 e3 31 b7 48 64 02 01 31 e2 d6...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 2b d0 0a f0 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 44 34 50 8b 0c 86 49 42 a4 e5 3a 78 4c 84 87 05 29 d2 44...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 2d 30 0b 48 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 5f 29 b5 ba 4d 4e 0f 3a 92 d2 b9 35 bd 4d 4e 11 4a d3 d2...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS in 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 2d 50 0b 50 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 61 29 97 cb 5d 6e cf 21 a1 40 20 11 19 04 eb 09 53 94 c...
Set CS pin 20 to low
Set Debu CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 2d 70 0b 58 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 56 ed 15 bb 3d f3 15 7c b5 52 b8 f0 08 04 46 81 4b 83 c6...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 2d 90 0b 60 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 58 f1 35 39 3d 2b 8d 74 85 5f 31 b0 8d 0c 02 41 21 e1 4a...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 2d b0 0b 68 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 4a 78 74 af 3c ea cb 42 c3 4e a4 b4 2b 34 46 05 08 c0 40...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 2d d0 0b 70 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 54 bd 32 1c 24 c7 8b 18 f1 c6 60 33 ab 2c 66 07 00 80 46...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 2d f0 0b 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 63 36 14 2b 3c 43 45 00 80 54 e0 f3 2a 24 02 01 31 f2 54...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 2e 10 0b 80 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 4c a0 d3 aa 3c 43 45 08 b0 d2 b8 f6 3c 55 2b 51 3a 92 c8...
St CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 2e 30 0b 88 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 4a 74 92 9d 24 a7 4b 19 81 c8 64 77 ca 6e 96 e3 31 d2 c0...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 2e 50 0b 90 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 4a 70 b3 1f 34 86 c9 10 e1 44 3c 52 1b 1d 2a cf 21 81 c0...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin  to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 2e 70 0b 98 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 42 30 51 8f 14 43 85 21 b2 4a 78 b1 0e 14 23 03 00 a0 c4...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 2e 90 0b a0 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 48 68 92 19 24 a7 09 32 82 c6 38 70 8d 0c a7 87 10 d1 44...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 2e b0 0b a8 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 48 6c 92 1a 25 0a cd 32 82 c8 68 92 9d 1c a7 47 18 e1 c6...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 2e d0 0b b0 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 4c 78 b3 28 25 2b 8d 29 c2 42 34 36 38 4d 6b 11 08 c0 c4...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 2e f0 0b b8 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 58 ed 55 2f 34 ea 89 29 d2 42 30 35 ab 45 ee d7 08 d0 c8...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 2f 10 0b c0 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 58 e9 33 1e 2c a7 49 3a 93 46 64 94 1e 35 ab d3 21 91 c4...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 2f 30 0b c8 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 4c 74 b4 2a 3c 43 87 08 b1 44 38 53 1d 2c ea 0d 4a d4 4c...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debughigh
SPI Tx: 549 bytes:
 16 50 b8 b3 a9 2d 0b 8d 3a c1 cc a8 53 ad 0c eb 87 29 e2 4c...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 33 d0 0c f0 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 4c a4 72 1b 1c a7 89 4b b1 d2 e8 53 2d 0c cb 03 32 82 cc...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 33 f0 0c f8 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 52 e0 b2 1b 1c 66 85 32 b0 d4 f0 96 4a 34 ee 05 10 f0 c8...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 34 10 0d 00 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 54 f8 73 29 1c ea c5 42 f1 56 f0 f5 bd 44 87 c3 2a 81 d0...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CSpin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 34 30 0d 08 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 5d 2d 14 ba 1d 4e c9 5b d2 d4 e8 f2 1b 24 46 03 11 90 52...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 34 50 0d 10 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 56 e9 34 38 0d 6f 8f 53 93 c8 6c 91 0e 14 86 85 4a d4 d6...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 34 70 0d 18 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 4a a4 73 ab 35 6e 8f 42 d3 c4 38 30 08 04 66 85 73 f7 56...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 34 90 0d 20 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 4e b4 93 28 3c ea 8b 21 d1 cc 7c b4 ac 44 c7 cb 29 c2 4e...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 34 b0 0d 28 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 5a f9 34 ae 2d 6e 51 52 e4 52 b5 58 4b 75 cf 97 29 91 c0...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 34 d0 0d 30 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 58 f0 f5 b9 35 6e 4d 63 94 d6 e5 57 3f 76 12 d7 52 f3 4e...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 34 f0 0d 38 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 5f 29 96 bb 4d 4b 8b 2a 90 52 bc 96 bc 4d d2 17 7c 95 d8...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 35 10 0d 40 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 61 35 b6 bc 55 6e 11 42 e2 d2 bc 94 2c 1d af 57 8c c6 dc...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 35 30 0d 48 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 5f 21 56 bd 4d d2 15 6b f4 dc fd 76 3c 45 4e 4d 53 82 d6...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 35 50 0d 50 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 58 ec d6 39 3d 0b 45 53 91 56 ec d5 bb 35 2b 09 4a d2 50...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 35 70 0d 58 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 52 bc d6 3a 3c a7 43 3a a1 4e a8 54 2b 24 e7 c9 52 f3 58...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 35 90 0d 60 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 50 b0 d2 9d 1c 86 03 29 c1 ce a0 b3 1c 25 0a 4b 42 a2 d2...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 35 b0 0d 68 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 52 b5 14 2a 34 a6 85 21 81 48 68 71 98 14 86 87 31 c2 4c...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 35 d0 0d 70 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 4e a0 d2 9d 24 c7 89 21 b1 ca 6c 72 1a 1c 86 47 21 a1 4c...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 35 f0 0d 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 54 bd 11 8e 0c 23 01 29 b1 c8 64 52 19 1d 2a cd 3a 82 4e...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 36 10 0d 80 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 48 60 52 19 14 86 c7 21 b1 c4 3c 31 0e 0c 43 c3 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 37 b0 0d e8 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 54 bc f4 ae 2d 6e 4f 5b a4 4e a4 b7 3d 4e 96 9b 74 83 d8...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 37 d0 0d f0 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 56 e0 d4 ad 1d d2 17 74 86 58 f5 39 4e 5e 33 15 5b 82 d8...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 37 f0 0d f8 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 54 b8 b5 2d 25 af 53 63 c5 dc f8 fa dc 4e 56 1b 4a d2 d6...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 38 10 0e 00 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 4c a0 95 2f 35 8e 51 42 a3 5c f0 b5 ad 25 d2 17 52 f3 5d...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 38 30 0e 08 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 4c 7c 75 ba 3d 8e d3 53 83 da ec f2 99 0c ea 8b 4a d3 58...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 38 50 0e 10 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 4c a0 75 b9 3d 6e 51 74 85 52 b0 d0 8c 0d 0b 0b 4a d3 50...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 38 70 0e 18 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 4a 6c 74 29 2c ea 09 6b d4 50 a8 b1 0e 15 4b cd 5b a4 56...
Set CS pin 20 t low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 38 90 0e 20 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 4a 68 73 1e 24 c7 87 32 82 46 64 53 1f 1d 6e 4f 63 d4 5f...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 38 b0 0e 28 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 4c 78 93 a9 24 ca 09 42 d3 4e a8 b3 28 1d 4e 0d 6b d4 56...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 38 d0 0e 30 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 4a 74 93 a9 2c a7 45 3a 92 d2 b4 d4 ac 35 6e 0f 52 d3 4c...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 38 f0 0e 38 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 4c 78 92 1b 14 63 85 21 b1 d0 b0 b4 2b 34 c7 89 29 c1 cc...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 39 10 0e 40 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 52 b4 d5 b9 44 66 45 19 81 4a 70 71 0d 0c 43 c3 31 f2 50...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 39 30 0e 48 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 56 e5 13 1e 24 86 47 19 81 46 60 72 1a 1c c7 49 42 92 54...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 39 50 0e 50 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 4a 70 70 8b 04 a6 87 29 c1 c4 38 52 1a 1c a7 49 29 c1 cc...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 39 70 0e 58 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 4c 7c 93 a8 2c c7 89 29 c2 48 68 72 1b 1d 0a 8b 4a b3 4a...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 39 90 0e 60 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 52 b0 d3 a9 2c ea 0b 42 a3 4e a0 b2 9d 14 c7 c7 29 e1 c8...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 39 b0 0e 68 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 44 38 33 1d 24 ea 4b 29 d2 48 6c 72 1a 1c 66 45 29 c1 c6...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 39 d0 0e 70 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 4a 6c 93 1e 24 ea 87 3a 92 46 64 71 0e 14 46 05 29 c1 ca...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 39 f0 0e 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 5d 21 15 ba 2d b2 11 53 82 ca 74 52 9a 1c a7 09 21 a1 c6...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 3a 10 0e 80 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 58 f0 d5 39 2d 2b cb 4a d2 56 e8 f5 b8 45 07 cb 10 e1 4a...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 3a 30 0e 88 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 4e a0 73 aa 1c a7 87 3a 92 54 e0 d5 2f 3d 4e 0d 42 c1 d4...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 3a 50 0e 90 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 4e a4 b4 ac 2c ea 49 31 f2 4c 78 75 b9 45 4e 0d 42 d0 d8...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 3a 70 0e 98 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 4e a4 b3 1f 24 c7 c9 31 f2 4a 74 73 28 25 6e cf 42 d1 cc...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 3a 90 0e a0 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 46 3c 52 9b 1c a7 49 31 e2 48 68 53 1f 25 af 95 63 c4 4e...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 3a b0 0e a8 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 549 bytes:
 16 48 60 72 1a 1c c7 c9 39 f2 c8 68 74 ad 34 86 c5 3a a2 50...
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 40 20 10 0f 78 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set Debug CS pin 5 to high
SPI Tx: 9 bytes:
 15 c0 3a d0 0e b0 00 00 00
Set CS pin 20 to low
Set Debug CS pin 5 to low
Set CS pin 20 to high
Set 
# 
*/