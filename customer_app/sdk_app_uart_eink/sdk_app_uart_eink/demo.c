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
#include <bl_uart.h>
#include "demo.h"

//  Use UART Port 1 (UART Port 0 is reserved for console)
#define UART_PORT 1

//  Do the Start Transfer Handshake with E-Ink Display:
//  Receive 'c', send 'a', receive 'b'
void send_begin() 
{
    //  Wait until 'c' is received
    for (;;) {
        //  Read one byte from UART Port, returns -1 if nothing read
        int ch = bl_uart_data_recv(UART_PORT);
        if (ch > 0) { printf("%c", ch); }
        if (ch == 'c') { break; }
    }

    //  Send 'a'
    int rc = bl_uart_data_send(UART_PORT, 'a');
    assert(rc == 0);

    //  Wait until 'b' is received
    for (;;) {
        //  Read one byte from UART Port, returns -1 if nothing read
        int ch = bl_uart_data_recv(UART_PORT);
        if (ch > 0) { printf("%c", ch); }
        if (ch == 'b') { break; }
    }
}

static void uart_task(void *arg)
{
    //  Init UART Port 1 with Tx Pin 4, Rx Pin 3 for Rx at 230.4 kbps
    int rc = bl_uart_init(
        UART_PORT,  //  UART Port 1
        4,          //  Tx Pin
        3,          //  Rx Pin
        255,        //  CTS Unused
        255,        //  UTS Unused
        230400      //  Buad Rate
    );
    assert(rc == 0);

    //  Do the Start Transfer Handshake with E-Ink Display
    send_begin();
}

void ci_loop_proc()
{
    aos_task_new("uart_task", uart_task, "", 0);
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
