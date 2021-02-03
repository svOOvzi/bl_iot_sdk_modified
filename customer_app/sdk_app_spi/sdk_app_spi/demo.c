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
#include <hal_spi.h>         //  For spi_init
#include <bl_gpio.h>         //  For bl_gpio_output_set
#include <bl602_glb.h>       //  For GLB_GPIO_Func_Init
#include <cli.h>

/// Use SPI Port Number 0
#define SPI_PORT   0

/// Use GPIO 14 (PineCone Green LED) as SPI Chip Select Pin
#define SPI_CS_PIN 14

/// SPI Port
static spi_dev_t spi;

/// Init the SPI Port
static void test_spi_init(char *buf, int len, int argc, char **argv)
{
    //  Set SPI pins based on PineCone / Pinenut GPIO Definition: https://wiki.pine64.org/wiki/Nutcracker#Pinenut-12S_Module_information
    //  Note: The Chip Select Pin below (2) must NOT be the same as SPI_CS_PIN (14). Because the SPI Pin Function will override the GPIO Pin Function!
    //  TODO: Serial Data In and Serial Data Out seem to be flipped, inconsistent with Reference Manual
    int rc = spi_init(
        &spi,        //  SPI Device
        SPI_PORT,    //  SPI Port
        0,           //  SPI Mode: 0 for Controller (formerly Master), 1 for Peripheral (formerly Slave)
        0,           //  SPI Polar Phase: 0 (CPOL=0, CPHA=0), 1 (CPOL=0, CPHA=1), 2 (CPOL=1, CPHA=0) or 3 (CPOL=1, CPHA=1)
        250 * 1000,  //  SPI Frequency (250 kHz)
        2,   //  Transmit DMA Channel
        3,   //  Receive DMA Channel
        11,  //  (Yellow) SPI Clock Pin 
        2,   //  (Unused) SPI Chip Select Pin (Unused because we control GPIO 14 ourselves as Chip Select Pin. This must NOT be set to 14, SPI will override our GPIO!)
        17,  //  (Green)  SPI Serial Data In Pin  (formerly MISO)
        0    //  (Blue)   SPI Serial Data Out Pin (formerly MOSI)
    );
    assert(rc == 0);

    //  Configure Chip Select pin as GPIO Pin
    GLB_GPIO_Type pins[1];
    pins[0] = SPI_CS_PIN;
    BL_Err_Type rc2 = GLB_GPIO_Func_Init(GPIO_FUN_SWGPIO, pins, sizeof(pins) / sizeof(pins[0]));
    assert(rc2 == SUCCESS);

    //  Configure Chip Select pin as GPIO Output Pin (instead of GPIO Input)
    rc = bl_gpio_enable_output(SPI_CS_PIN, 0, 0);
    assert(rc == 0);

    //  Set Chip Select pin to High, to deactivate BME280
    printf("Set CS pin %d to high\r\n", SPI_CS_PIN);
    rc = bl_gpio_output_set(SPI_CS_PIN, 1);
    assert(rc == 0);
}

/// SPI Transmit and Receive Buffers for First SPI Transfer
static uint8_t tx_buf1[1];  //  We shall transmit Register ID (0xD0)
static uint8_t rx_buf1[1];  //  Unused. We expect to receive the result from BME280 in the second SPI Transfer.

/// SPI Transmit and Receive Buffers for Second SPI Transfer
static uint8_t tx_buf2[1];  //  Unused. For safety, we shall transmit 0xFF which is a read command (not write).
static uint8_t rx_buf2[1];  //  We expect to receive Chip ID (0x60) from BME280

/// Start the SPI data transfer
static void test_spi_transfer(char *buf, int len, int argc, char **argv)
{
    //  Clear the buffers
    memset(&tx_buf1, 0, sizeof(tx_buf1));
    memset(&rx_buf1, 0, sizeof(rx_buf1));
    memset(&tx_buf2, 0, sizeof(tx_buf2));
    memset(&rx_buf2, 0, sizeof(rx_buf2));

    //  Prepare 2 SPI Transfers
    static spi_ioc_transfer_t transfers[2];
    memset(transfers, 0, sizeof(transfers));    

    //  First SPI Transfer: Shall transmit Register ID (0xD0) to BME280
    tx_buf1[0] = 0xd0;  //  Read BME280 Chip ID Register (0xD0). Read/Write Bit (High Bit) is 1 for Read.
    transfers[0].tx_buf = (uint32_t) tx_buf1;  //  Transmit Buffer (Register ID)
    transfers[0].rx_buf = (uint32_t) rx_buf1;  //  Receive Buffer
    transfers[0].len    = sizeof(tx_buf1);     //  How many bytes

    //  Second SPI Transfer: Receive Chip ID (0x60) from BME280
    tx_buf2[0] = 0xff;  //  Unused. Read/Write Bit (High Bit) is 1 for Read.
    transfers[1].tx_buf = (uint32_t) tx_buf2;  //  Transmit Buffer
    transfers[1].rx_buf = (uint32_t) rx_buf2;  //  Receive Buffer (Chip ID)
    transfers[1].len    = sizeof(tx_buf2);     //  How many bytes

    //  Set Chip Select pin to Low, to activate BME280
    printf("Set CS pin %d to low\r\n", SPI_CS_PIN);
    int rc = bl_gpio_output_set(SPI_CS_PIN, 0);
    assert(rc == 0);

    //  Execute the two SPI Transfers with the DMA Controller
    rc = hal_spi_transfer(
        &spi,       //  SPI Device
        transfers,  //  SPI Transfers
        sizeof(transfers) / sizeof(transfers[0])  //  How many transfers (Number of requests, not bytes)
    );
    assert(rc == 0);

    //  DMA Controller will transmit and receive the SPI data in the background

    //  Set Chip Select pin to High, to deactivate BME280
    rc = bl_gpio_output_set(SPI_CS_PIN, 1);
    assert(rc == 0);
    printf("Set CS pin %d to high\r\n", SPI_CS_PIN);
}

/// Show the SPI data received and the interrupt counters
static void test_spi_result(char *buf, int len, int argc, char **argv)
{
    //  Show the received data
    printf("SPI Transfer #1: Received Data 0x%p:\r\n", rx_buf1);
    for (int i = 0; i < sizeof(rx_buf1); i++) {
        printf("  %02x\r\n", rx_buf1[i]);
    }
    printf("SPI Transfer #2: Received Data 0x%p:\r\n", rx_buf2);
    for (int i = 0; i < sizeof(rx_buf2); i++) {
        printf("  %02x\r\n", rx_buf2[i]);
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
