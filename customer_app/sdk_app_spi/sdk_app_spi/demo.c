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
        0,           //  SPI Mode: 0 for Controller (formerly Master), 1 for Peripheral (formerly Slave)
        0,           //  SPI Polar Phase: 0, 1, 2 or 3. TODO: Verify this
        500 * 1000,  //  SPI Frequency (500 kHz). Previously 3 * 1000 * 0000
        2,  //  Transmit DMA Channel
        3,  //  Receive DMA Channel
        3,  //  (Yellow) SPI Clock Pin 
        2,  //  (Orange) SPI Chip Select Pin
        1,  //  (Green)  SPI Serial Data Out Pin (formerly MOSI)
        0   //  (Blue)   SPI Serial Data In Pin  (formerly MISO)
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

    //  Set the SPI transfer (Other fields in trans are not implemented)
    static spi_ioc_transfer_t trans;
    memset(&trans, 0, sizeof(trans));    
    trans.tx_buf = (uint32_t) tx_buf;  //  Transmit Buffer
    trans.rx_buf = (uint32_t) rx_buf;  //  Receive Buffer
    trans.len    = sizeof(tx_buf);     //  How many bytes

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
    printf("Received Data 0x%p:\r\n", rx_buf);
    for (int i = 0; i < sizeof(rx_buf); i++) {
        printf("  %02x\r\n", rx_buf[i]);
    }

    //  Show the Interrupt Counters defined in components/hal_drv/bl602_hal/hal_spi.c
    extern int g_counter_tx, g_counter_tx_buf, g_counter_tx_nobuf, g_counter_rx, g_counter_rx_buf, g_counter_rx_nobuf;
    extern uint32_t g_tx_status, g_tx_tc, g_tx_error, g_rx_status, g_rx_tc, g_rx_error;

    printf("Tx Interrupts: %d\r\n", g_counter_tx);
    printf("Tx Buffer OK:  %d\r\n", g_counter_tx_buf);
    printf("Tx No Buffer:  %d\r\n", g_counter_tx_nobuf);
    printf("Tx Status:     0x%x\r\n", g_tx_status);
    printf("Tx Term Count: 0x%x\r\n", g_tx_tc);
    printf("Tx Error:      0x%x\r\n", g_tx_error);
    printf("Rx Interrupts: %d\r\n", g_counter_rx);
    printf("Rx Buffer OK:  %d\r\n", g_counter_rx_buf);
    printf("Rx No Buffer:  %d\r\n", g_counter_rx_nobuf);
    printf("Rx Status:     0x%x\r\n", g_rx_status);
    printf("Rx Term Count: 0x%x\r\n", g_rx_tc);
    printf("Rx Error:      0x%x\r\n", g_rx_error);
}

// STATIC_CLI_CMD_ATTRIBUTE makes this(these) command(s) static
const static struct cli_command cmds_user[] STATIC_CLI_CMD_ATTRIBUTE = {
    {"spi_init",     "Init SPI port",          test_spi_init},
    {"spi_transfer", "Transfer SPI data",      test_spi_transfer},
    {"spi_result",   "Show SPI data received", test_spi_result},
};                                                                                   

int cli_init(void)
{
    // static command(s) do NOT need to call aos_cli_register_command(s) to register.
    // However, calling aos_cli_register_command(s) here is OK but is of no effect as cmds_user are included in cmds list.
    // XXX NOTE: Calling this *empty* function is necessary to make cmds_user in this file to be kept in the final link.
    //return aos_cli_register_commands(cmds_user, sizeof(cmds_user)/sizeof(cmds_user[0]));          
    return 0;
}

#ifdef NOTUSED
Testing BME280 SPI with Bus Pirate:
(See http://dangerousprototypes.com/docs/SPI)

HiZ> m
1. HiZ
2. 1-WIRE
3. UART
4. I2C
5. SPI
6. 2WIRE
7. 3WIRE
8. KEYB
9. LCD
10. PIC
11. DIO
x. exit(without change)

(1)> 5
Set speed:
 1. 30KHz
 2. 125KHz
 3. 250KHz
 4. 1MHz

(1)> 3
Clock polarity:
 1. Idle low *default
 2. Idle high

(1)>
Output clock edge:
 1. Idle to active
 2. Active to idle *default

(2)>
Input sample phase:
 1. Middle *default
 2. End

(1)>
CS:
 1. CS
 2. /CS *default

(2)>
Select output type:
 1. Open drain (H=Hi-Z, L=GND)
 2. Normal (H=3.3V, L=GND)

(1)>
Clutch disengaged!!!
To finish setup, start up the power supplies with command 'W'
Ready

SPI> W
POWER SUPPLIES ON
Clutch engaged!!!

SPI> [ 0xD0 r ]
/CS ENABLED
WRITE: 0xD0 
READ: 0x60 
/CS DISABLED

#endif  //  NOTUSED
