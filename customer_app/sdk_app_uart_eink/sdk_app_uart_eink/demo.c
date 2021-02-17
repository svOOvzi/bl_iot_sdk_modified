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
//  Based on https://github.com/Seeed-Studio/Grove_Triple_Color_E-lnk_2.13/blob/master/examples/Eink_factory_code_213/Eink_factory_code_213.ino
#include <stdio.h>
#include <assert.h>
#include <FreeRTOS.h>
#include <task.h>
#include <aos/kernel.h>
#include <aos/yloop.h>
#include <vfs.h>
#include <utils_log.h>
#include <bl_uart.h>  //  For BL602 Low Level UART HAL
#include <cli.h>      //  For STATIC_CLI_CMD_ATTRIBUTE
#include "demo.h"

/// Use UART Port 1 (UART Port 0 is reserved for console)
#define UART_PORT 1

/// Define the Black Pixels of the image
const unsigned char IMAGE_BLACK[] = { 
    #include "image_black.inc"
};

/// Define the Red Pixels of the image
const unsigned char IMAGE_RED[] = { 
    #include "image_red.inc"
};

/// Do the Start Transfer Handshake with E-Ink Display:
/// Receive 'c', send 'a', receive 'b'
void send_begin() 
{
    printf("Doing start transfer handshake...\r\n");
    //  Wait until 'c' is received
    int last_ch = 0;
    for (;;) {
        //  Read one byte from UART Port, returns -1 if nothing read
        int ch = bl_uart_data_recv(UART_PORT);
        if (ch < 0) { continue; }  //  Loop until we receive something

        //  Stop when we receive 'c'
        if (ch == 'c') { break; }
        if (ch != last_ch) { printf("0x%02x ", ch); last_ch = ch; }
    }
    printf("\r\nReceived 'c'\r\n");

    //  Send 'a'
    int rc = bl_uart_data_send(UART_PORT, 'a');
    assert(rc == 0);
    printf("Sent 'a'\r\n");

    //  Wait until 'b' is received
    for (;;) {
        //  Read one byte from UART Port, returns -1 if nothing read
        int ch = bl_uart_data_recv(UART_PORT);
        if (ch < 0) { continue; }  //  Loop until we receive something

        //  Stop when we receive 'b'
        if (ch == 'b') { break; }
        if (ch != last_ch) { printf("0x%02x ", ch); last_ch = ch; }
    }
    printf("\r\nReceived 'b'\r\n");
    printf("Start transfer handshake OK\r\n");

    //  Note that we're polling the UART Port, which is OK because we're
    //  mostly transmitting data, and receiving little data. If we're
    //  receiving lots of data, polling might lose some received data.
    //  For such cases, use UART Interrupts or DMA.
}

/// Send data to display over UART. data_len is number of bytes.
static void send_data(const uint8_t* data, uint32_t data_len) {
    for (int i = 0; i < data_len; i++) {
        int rc = bl_uart_data_send(UART_PORT, data[i]);
        assert(rc == 0);
    }
}

/// Send Black and Red Image Data to display
static void write_image_picture(void) {    
    //  Send Black Pixels to display in 13 chunks of 212 bytes
    printf("Sending black pixels...\r\n");
    for (int i = 0; i < 13; i++) {
        //  Send a chunk of 212 bytes
        send_data(&IMAGE_BLACK[0 + i * 212], 212);

        //  Sleep for 80 milliseconds
        vTaskDelay(80 / portTICK_PERIOD_MS);
    }

    //  Sleep for 90 milliseconds
    vTaskDelay(90 / portTICK_PERIOD_MS);

    //  Send Red Pixels to display in 13 chunks of 212 bytes
    printf("Sending red pixels...\r\n");
    for (int i = 0; i < 13; i++) {
        //  Send a chunk of 212 bytes
        send_data(&IMAGE_RED[0 + i * 212], 212);

        //  Sleep for 80 milliseconds
        vTaskDelay(80 / portTICK_PERIOD_MS);
    }
}

/// Command to display image
static void display_image(char *buf, int len, int argc, char **argv)
{
    //  Verify size of image
    assert(sizeof(IMAGE_BLACK) == 2756);
    assert(sizeof(IMAGE_RED)   == 2756);
    
    //  Init UART Port 1 with Tx Pin 4, Rx Pin 3 for Rx at 230.4 kbps
    int rc = bl_uart_init(
        UART_PORT,  //  UART Port 1
        4,          //  Tx Pin (Blue)
        3,          //  Rx Pin (Yellow)
        255,        //  CTS Unused
        255,        //  UTS Unused
        230400      //  Buad Rate
    );
    assert(rc == 0);

    //  Sleep for 10 milliseconds
    vTaskDelay(10 / portTICK_PERIOD_MS);
    
    //  Do the Start Transfer Handshake with E-Ink Display
    send_begin();

    //  Sleep for 2 seconds
    vTaskDelay(2000 / portTICK_PERIOD_MS);

    //  Send the display data
    write_image_picture();
}

/// List of commands. STATIC_CLI_CMD_ATTRIBUTE makes this(these) command(s) static
const static struct cli_command cmds_user[] STATIC_CLI_CMD_ATTRIBUTE = {
    {"display_image",  "Display image", display_image},
};

/// Init the command-line interface
int cli_init(void)
{
    //  To run a command at startup, use this...
    //  display_image("", 0, 0, NULL);

    return 0;
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
