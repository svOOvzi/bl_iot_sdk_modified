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
#include <assert.h>
#include <FreeRTOS.h>
#include <task.h>
#include <semphr.h>

#include "demo.h"
#include <device/vfs_spi.h>  //  For spi_ioc_transfer_t
#include <hal/soc/spi.h>     //  For hal_spi_transfer
#include <hal_spi.h>
#include <cli.h>

/// Use SPI Port Number 0
#define SPI_PORT  0

/// SPI Port
static spi_dev_t spi;

/// Init the SPI Port
static void test_spi_init(char *buf, int len, int argc, char **argv)
{
    //  SPI settings based on BL602 Device Tree: https://github.com/bouffalolab/BLOpenFlasher/blob/main/bl602/device_tree/bl_factory_params_IoTKitA_40M.dts
    int rc = spi_init(
        &spi,        //  SPI Device
        SPI_PORT,    //  SPI Port
        0,           //  SPI Mode: 0 for Controller (previously Master), 1 for Peripheral (previously Slave)
        0,           //  SPI Polar Phase
        500 * 1000,  //  SPI Frequency (500 kHz). Previously 3 * 1000 * 0000
        2,  //  Transmit DMA Channel
        3,  //  Receive DMA Channel
        3,  //  (Yellow) SPI Clock Pin 
        2,  //  (Orange) SPI Chip Select Pin
        1,  //  (Green)  SPI Serial Data Out Pin (previously MOSI)
        0   //  (Blue)   SPI Serial Data In Pin  (previously MISO)
    );
    assert(rc == 0);
}

/// SPI Transmit Buffer
static uint8_t tx_buf[1];

/// SPI Receive Buffer
static uint8_t rx_buf[1];

/// Start the SPI data transfer
static void test_spi_transfer(char *buf, int len, int argc, char **argv)
{
    //  Set the transmit data
    memset(&rx_buf, 0, sizeof(rx_buf));
    memset(&tx_buf, 0, sizeof(tx_buf));
    tx_buf[0] = 0xd0;  //  Read BME280 Chip ID Register (0xD0). Read/Write Bit (High Bit) is 1.

    //  Set the SPI transfer
    static spi_ioc_transfer_t trans;
    memset(&trans, 0, sizeof(trans));    
    trans.tx_buf = (uint32_t) tx_buf;  //  Transmit Buffer
    trans.rx_buf = (uint32_t) rx_buf;  //  Receive Buffer
    trans.len    = sizeof(tx_buf);     //  How many bytes
    trans.speed_hz    = 500 * 1000;    //  Frequency (500 kHz)
    trans.delay_msecs = 0;             //  Delay in ms (bl add)
    trans.cs_change   = 1;             //  0 means keep CS activated

    //  Transmit and receive the data over SPI with DMA
    int rc = hal_spi_transfer(
        &spi,    //  SPI Device
        &trans,  //  SPI Transfer
        1        //  How many transfers (Number of requests, not bytes)
    );
    assert(rc == 0);

    //  DMA Controller will transmit and receive the SPI data in the background
}

/// Show the SPI data received and the interrupt counters
static void test_spi_result(char *buf, int len, int argc, char **argv)
{
    //  Show the received data
    printf("Data:\r\n");
    for (int i = 0; i < sizeof(rx_buf); i++) {
        printf("  %02x\r\n", rx_buf[i]);
    }

    //  Show the Interrupt Counters defined in components/hal_drv/bl602_hal/hal_spi.c
    extern int g_counter_tx, g_counter_tx_buf, g_counter_tx_nobuf, g_counter_rx, g_counter_rx_buf, g_counter_rx_nobuf;
    printf("Tx Interrupts: %d\r\n", g_counter_tx);
    printf("Tx Buffer OK:  %d\r\n", g_counter_tx_buf);
    printf("Tx No Buffer:  %d\r\n", g_counter_tx_nobuf);
    printf("Rx Interrupts: %d\r\n", g_counter_rx);
    printf("Rx Buffer OK:  %d\r\n", g_counter_rx_buf);
    printf("Rx No Buffer:  %d\r\n", g_counter_rx_nobuf);
}

#ifdef NOTUSED
typedef struct spi_ioc_transfer {
    uint32_t   tx_buf;               /* uint64_t to uint32_t */
    uint32_t   rx_buf;               /* uint64_t to uint32_t */
    uint32_t   len;
    uint32_t   speed_hz;
    uint16_t   delay_usecs;          /* Unimplemented */
    uint16_t   delay_msecs;          /* delay ms, bl add*/
    uint8_t    bits_per_word;        /* Unimplemented */
    uint8_t    cs_change;            /* 0: Keep CS activated */
    uint8_t    tx_nbits;             /* Unimplemented */
    uint8_t    rx_nbits;             /* Unimplemented */
    uint8_t    word_delay_usecs;     /* Unimplemented */
    uint8_t    pad;                  /* Unimplemented */
} spi_ioc_transfer_t;
#endif  //  NOTUSED

// STATIC_CLI_CMD_ATTRIBUTE makes this(these) command(s) static
const static struct cli_command cmds_user[] STATIC_CLI_CMD_ATTRIBUTE = {
    {"spi_init", "Init SPI port", test_spi_init},
    {"spi_transfer", "Transfer SPI data", test_spi_transfer},
    {"spi_result", "Show SPI data received", test_spi_result},
};                                                                                   

int cli_init(void)
{
    // static command(s) do NOT need to call aos_cli_register_command(s) to register.
    // However, calling aos_cli_register_command(s) here is OK but is of no effect as cmds_user are included in cmds list.
    // XXX NOTE: Calling this *empty* function is necessary to make cmds_user in this file to be kept in the final link.
    //return aos_cli_register_commands(cmds_user, sizeof(cmds_user)/sizeof(cmds_user[0]));          
    return 0;
}
