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
#include <stdio.h>
#include <string.h>
#include <FreeRTOS.h>
#include <task.h>
#include <bl_uart.h>
#include "demo.h"

static const char *ci_table_step_init[] = CI_CASE_TABLE_STEP1;
static const char *ci_table_step_log[] = CI_CASE_TABLE_STEP2;
static const char *ci_table_step_end[] = CI_CASE_TABLE_STEP3;

void log_step(const char *step[2])
{
    printf("%s   %s\r\n", step[0], step[1]);
}

void helloworld(void)
{
    log_step(ci_table_step_init);
    log_step(ci_table_step_log);
    log_step(ci_table_step_end);
}

void user_vApplicationStackOverflowHook(TaskHandle_t xTask, char *pcTaskName )
{
    /*empty*/
}

void user_vApplicationMallocFailedHook(void)
{
    printf("Memory Allocate Failed. Current left size is %d bytes\r\n",
        xPortGetFreeHeapSize()
    );  
    /*empty*/
}

void user_vApplicationIdleHook(void)
{
    __asm volatile(
            "   wfi     "
    );  
    /*empty*/
}

void bfl_main(void)
{
    /*
     * Init UART using pins 16+7 (TX+RX)
     * and baudrate of 2M
     */
    bl_uart_init(0, 16, 7, 255, 255, 2 * 1000 * 1000);    
    helloworld();

    /*
    Default JTAG port is...
    TDO: GPIO 11
    TMS: GPIO 12 (not remapped)
    TCK: GPIO 14
    TDI: GPIO 17

    But 3 of above pins are connected to LED...
    Blue:  GPIO 11
    Green: GPIO 14
    Red:   GPIO 17

    So we need to remap these pins to PWM...
    PWM Ch 1 (Blue):  GPIO 11
    PWM Ch 4 (Green): GPIO 14
    PWM Ch 2 (Red):   GPIO 17

    Then remap these pins to JTAG (0x0e)...
    TDI: GPIO 1
    TCK: GPIO 2
    TDO: GPIO 3
    */

    //  GPIO Functions. From components/bl602/bl602_std/bl602_std/StdDriver/Inc/bl602_gpio.h
    const uint32_t GPIO_FUN_PWM  =  8;
    const uint32_t GPIO_FUN_JTAG = 14;

    //  GPIO_CFGCTL0
    //  Address：0x40000100
    //  27:24 GP1FUNC
    uint32_t *GPIO_CFGCTL0 = (uint32_t *) 0x40000100;
    uint32_t *GP1FUNC_ADDR = GPIO_CFGCTL0;
    const uint32_t GP1FUNC_SHIFT = 24;
    const uint32_t GP1FUNC_MASK  = 0xf << GP1FUNC_SHIFT;

    //  GPIO_CFGCTL1
    //  Address：0x40000104
    //  11:8 GP2FUNC
    //  27:24 GP3FUNC
    uint32_t *GPIO_CFGCTL1 = (uint32_t *) 0x40000104;
    uint32_t *GP2FUNC_ADDR = GPIO_CFGCTL1;
    const uint32_t GP2FUNC_SHIFT =  8;
    const uint32_t GP2FUNC_MASK  = 0xf << GP2FUNC_SHIFT;

    uint32_t *GP3FUNC_ADDR = GPIO_CFGCTL1;
    const uint32_t GP3FUNC_SHIFT = 24;
    const uint32_t GP3FUNC_MASK  = 0xf << GP3FUNC_SHIFT;

    //  GPIO_CFGCTL5
    //  Address：0x40000114
    //  27:24 GP11FUNC
    uint32_t *GPIO_CFGCTL5 = (uint32_t *) 0x40000114;
    uint32_t *GP11FUNC_ADDR = GPIO_CFGCTL5;
    const uint32_t GP11FUNC_SHIFT = 24;
    const uint32_t GP11FUNC_MASK  = 0xf << GP11FUNC_SHIFT;

    //  GPIO_CFGCTL7
    //  Address：0x4000011c
    //  11:8 GP14FUNC
    uint32_t *GPIO_CFGCTL7 = (uint32_t *) 0x4000011c;
    uint32_t *GP14FUNC_ADDR = GPIO_CFGCTL7;
    const uint32_t GP14FUNC_SHIFT =  8;
    const uint32_t GP14FUNC_MASK  = 0xf << GP14FUNC_SHIFT;

    //  GPIO_CFGCTL8
    //  Address：0x40000120
    //  27:24 GP17FUNC
    uint32_t *GPIO_CFGCTL8 = (uint32_t *) 0x40000120;
    uint32_t *GP17FUNC_ADDR = GPIO_CFGCTL8;
    const uint32_t GP17FUNC_SHIFT = 24;
    const uint32_t GP17FUNC_MASK  = 0xf << GP17FUNC_SHIFT;

    //  GPIO 1 becomes JTAG TDI
    *GP1FUNC_ADDR = (*GP1FUNC_ADDR & ~GP1FUNC_MASK) 
        | (GPIO_FUN_JTAG << GP1FUNC_SHIFT);
        
    //  GPIO 2 becomes JTAG TCK
    *GP2FUNC_ADDR = (*GP2FUNC_ADDR & ~GP2FUNC_MASK) 
        | (GPIO_FUN_JTAG << GP2FUNC_SHIFT);

    //  GPIO 3 becomes JTAG TDO
    *GP3FUNC_ADDR = (*GP3FUNC_ADDR & ~GP3FUNC_MASK) 
        | (GPIO_FUN_JTAG << GP3FUNC_SHIFT);

    //  GPIO 11 becomes PWM Ch 1 (Blue)
    *GP11FUNC_ADDR = (*GP11FUNC_ADDR & ~GP11FUNC_MASK) 
        | (GPIO_FUN_PWM << GP11FUNC_SHIFT);

    //  GPIO 14 becomes PWM Ch 4 (Green)
    *GP14FUNC_ADDR = (*GP14FUNC_ADDR & ~GP14FUNC_MASK) 
        | (GPIO_FUN_PWM << GP14FUNC_SHIFT);

    //  GPIO 17 becomes PWM Ch 2 (Red)
    *GP17FUNC_ADDR = (*GP17FUNC_ADDR & ~GP17FUNC_MASK) 
        | (GPIO_FUN_PWM << GP17FUNC_SHIFT);        
}
