//  Based on https://github.com/apache/mynewt-core/blob/master/apps/loraping/src/main.c
/*
Copyright (c) 2013, SEMTECH S.A.
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of the Semtech corporation nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL SEMTECH S.A. BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

Description: Ping-Pong implementation.  Adapted to run in the MyNewt OS.
*/
#include <stdio.h>
#include <string.h>
#include <assert.h>
#include <FreeRTOS.h>
#include <task.h>
#include <semphr.h>
#include <cli.h>
#include "radio.h"
#include "rxinfo.h"
#include "demo.h"

/// TODO: We are using LoRa Frequency 923 MHz for Singapore. Change this for your region.
#define USE_BAND_923

#if defined(USE_BAND_433)
    #define RF_FREQUENCY               434000000 /* Hz */
#elif defined(USE_BAND_780)
    #define RF_FREQUENCY               780000000 /* Hz */
#elif defined(USE_BAND_868)
    #define RF_FREQUENCY               868000000 /* Hz */
#elif defined(USE_BAND_915)
    #define RF_FREQUENCY               915000000 /* Hz */
#elif defined(USE_BAND_923)
    #define RF_FREQUENCY               923000000 /* Hz */
#else
    #error "Please define a frequency band in the compiler options."
#endif

/// LoRa Parameters
#define LORAPING_TX_OUTPUT_POWER            14        /* dBm */

#define LORAPING_BANDWIDTH                  0         /* [0: 125 kHz, */
                                                      /*  1: 250 kHz, */
                                                      /*  2: 500 kHz, */
                                                      /*  3: Reserved] */
#define LORAPING_SPREADING_FACTOR           7         /* [SF7..SF12] */
#define LORAPING_CODINGRATE                 1         /* [1: 4/5, */
                                                      /*  2: 4/6, */
                                                      /*  3: 4/7, */
                                                      /*  4: 4/8] */
#define LORAPING_PREAMBLE_LENGTH            8         /* Same for Tx and Rx */
#define LORAPING_SYMBOL_TIMEOUT             5         /* Symbols */
#define LORAPING_FIX_LENGTH_PAYLOAD_ON      false
#define LORAPING_IQ_INVERSION_ON            false

#define LORAPING_TX_TIMEOUT_MS              3000    /* ms */
#define LORAPING_RX_TIMEOUT_MS              1000    /* ms */
#define LORAPING_BUFFER_SIZE                64      /* LoRa message size */

const uint8_t loraping_ping_msg[] = "PING";  //  We send a "PING" message
const uint8_t loraping_pong_msg[] = "PONG";  //  We expect a "PONG" response

static uint8_t loraping_buffer[LORAPING_BUFFER_SIZE];  //  64-byte buffer for our LoRa messages
static int loraping_rx_size;

/// LoRa Statistics
struct {
    int rx_timeout;
    int rx_ping;
    int rx_pong;
    int rx_other;
    int rx_error;
    int tx_timeout;
    int tx_success;
} loraping_stats;

void SX1276IoInit(void);            //  Defined in sx1276-board.c
uint8_t SX1276Read(uint16_t addr);  //  Defined in sx1276.c

static void send_once(int is_ping);
static void loraping_rx(void);
static void on_tx_done(void);
static void on_rx_done(uint8_t *payload, uint16_t size, int16_t rssi, int8_t snr);
static void on_tx_timeout(void);
static void on_rx_timeout(void);
static void on_rx_error(void);

/// Read SX1276 / RF96 registers
static void read_registers(char *buf, int len, int argc, char **argv)
{
    //  Init the SPI port
    SX1276IoInit();

    //  Read and print the first 16 registers: 0 to 15
    for (uint16_t addr = 0; addr < 0x10; addr++) {
        //  Read the register
        uint8_t val = SX1276Read(addr);

        //  Print the register value
        printf("Register 0x%02x = 0x%02x\r\n", addr, val);
    }
}

/// Command to initialise the SX1276 / RF96 driver
static void init_driver(char *buf, int len, int argc, char **argv)
{
    //  Set the LoRa Callback Functions
    RadioEvents_t radio_events;
    radio_events.TxDone    = on_tx_done;
    radio_events.RxDone    = on_rx_done;
    radio_events.TxTimeout = on_tx_timeout;
    radio_events.RxTimeout = on_rx_timeout;
    radio_events.RxError   = on_rx_error;

    //  Init the SPI Port and the LoRa Transceiver
    Radio.Init(&radio_events);

    //  Set the LoRa Frequency
    Radio.SetChannel(RF_FREQUENCY);

    //  Configure the LoRa Transceiver for transmitting messages
    Radio.SetTxConfig(
        MODEM_LORA,
        LORAPING_TX_OUTPUT_POWER,
        0,        //  Frequency deviation: Unused with LoRa
        LORAPING_BANDWIDTH,
        LORAPING_SPREADING_FACTOR,
        LORAPING_CODINGRATE,
        LORAPING_PREAMBLE_LENGTH,
        LORAPING_FIX_LENGTH_PAYLOAD_ON,
        true,     //  CRC enabled
        0,        //  Frequency hopping disabled
        0,        //  Hop period: N/A
        LORAPING_IQ_INVERSION_ON,
        LORAPING_TX_TIMEOUT_MS
    );

    //  Configure the LoRa Transceiver for receiving messages
    Radio.SetRxConfig(
        MODEM_LORA,
        LORAPING_BANDWIDTH,
        LORAPING_SPREADING_FACTOR,
        LORAPING_CODINGRATE,
        0,        //  AFC bandwidth: Unused with LoRa
        LORAPING_PREAMBLE_LENGTH,
        LORAPING_SYMBOL_TIMEOUT,
        LORAPING_FIX_LENGTH_PAYLOAD_ON,
        0,        //  Fixed payload length: N/A
        true,     //  CRC enabled
        0,        //  Frequency hopping disabled
        0,        //  Hop period: N/A
        LORAPING_IQ_INVERSION_ON,
        true      //  Continuous receive mode
    );    
}

/// Command to send a LoRa message. Assume that SX1276 / RF96 driver has been initialised.
static void send_message(char *buf, int len, int argc, char **argv)
{
    //  Send the "PING" message
    send_once(1);
}

/// Send a LoRa message. If is_ping is 0, send "PONG". Otherwise send "PING".
static void send_once(int is_ping)
{
    //  Copy the "PING" or "PONG" message to the transmit buffer
    if (is_ping) {
        memcpy(loraping_buffer, loraping_ping_msg, 4);
    } else {
        memcpy(loraping_buffer, loraping_pong_msg, 4);
    }

    //  Fill up the remaining space in the transmit buffer (64 bytes) with values 0, 1, 2, ...
    for (int i = 4; i < sizeof loraping_buffer; i++) {
        loraping_buffer[i] = i - 4;
    }

    //  Send the transmit buffer (64 bytes)
    Radio.Send(loraping_buffer, sizeof loraping_buffer);
}

/// Command to receive a LoRa message. Assume that SX1276 / RF96 driver has been initialised.
static void receive_message(char *buf, int len, int argc, char **argv)
{
    //  Receive a "PING" or "PONG" LoRa message
    loraping_rx();
}

/// Receive a "PING" or "PONG" LoRa message
static void loraping_rx(void)
{
    //  Receive a LoRa message
    Radio.Rx(LORAPING_RX_TIMEOUT_MS);
}

/// Show the SPI interrupt counters, status and error codes
static void spi_result(char *buf, int len, int argc, char **argv)
{
    //  SX1276 Interrupt Counters defined in sx1276-board.c
    extern int g_dio0_counter, g_dio1_counter, g_dio2_counter, g_dio3_counter, g_dio4_counter, g_dio5_counter, g_nodio_counter;
    printf("DIO0 Interrupts: %d\r\n",   g_dio0_counter);
    printf("DIO1 Interrupts: %d\r\n",   g_dio1_counter);
    printf("DIO2 Interrupts: %d\r\n",   g_dio2_counter);
    printf("DIO3 Interrupts: %d\r\n",   g_dio3_counter);
    printf("DIO4 Interrupts: %d\r\n",   g_dio4_counter);
    printf("DIO5 Interrupts: %d\r\n",   g_dio5_counter);
    printf("Unknown Int:     %d\r\n",   g_nodio_counter);

    //  Show the Interrupt Counters, Status and Error Codes defined in components/hal_drv/bl602_hal/hal_spi.c
    extern int g_tx_counter, g_rx_counter;
    extern uint32_t g_tx_status, g_tx_tc, g_tx_error, g_rx_status, g_rx_tc, g_rx_error;
    printf("Tx Interrupts:   %d\r\n",   g_tx_counter);
    printf("Tx Status:       0x%x\r\n", g_tx_status);
    printf("Tx Term Count:   0x%x\r\n", g_tx_tc);
    printf("Tx Error:        0x%x\r\n", g_tx_error);
    printf("Rx Interrupts:   %d\r\n",   g_rx_counter);
    printf("Rx Status:       0x%x\r\n", g_rx_status);
    printf("Rx Term Count:   0x%x\r\n", g_rx_tc);
    printf("Rx Error:        0x%x\r\n", g_rx_error);
}

/// List of commands. STATIC_CLI_CMD_ATTRIBUTE makes this(these) command(s) static
const static struct cli_command cmds_user[] STATIC_CLI_CMD_ATTRIBUTE = {
    {"init_driver",      "Init LoRa driver",       init_driver},
    {"send_message",     "Send LoRa message",      send_message},
    {"receive_message",  "Receive LoRa message",   receive_message},
    {"read_registers",   "Read registers",         read_registers},
    {"spi_result",       "Show SPI counters",      spi_result},
};                                                                                   

/// Init the command-line interface
int cli_init(void)
{
   //  To run a command at startup, do this...
   //  init_driver("", 0, 0, NULL);
   //  send_message("", 0, 0, NULL);
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

///////////////////////////////////////////////////////////////////////////////
//  Unused Functions: They will be needed when we receive LoRa messages

/// Callback Function that is called when our LoRa message has been transmitted
static void on_tx_done(void)
{
    loraping_stats.tx_success++;
    Radio.Sleep();
    //  TODO: os_eventq_put(os_eventq_dflt_get(), &loraping_ev_rx);
}

/// Callback Function that is called when a LoRa message has been received
static void on_rx_done(uint8_t *payload, uint16_t size, int16_t rssi, int8_t snr)
{
    Radio.Sleep();
    if (size > sizeof loraping_buffer) {
        size = sizeof loraping_buffer;
    }
    loraping_rx_size = size;
    memcpy(loraping_buffer, payload, size);
    loraping_rxinfo_rxed(rssi, snr);
    //  TODO: os_eventq_put(os_eventq_dflt_get(), &loraping_ev_tx);
}

/// Callback Function that is called when our LoRa message couldn't be transmitted due to timeout
static void on_tx_timeout(void)
{
    Radio.Sleep();
    loraping_stats.tx_timeout++;
    //  TODO: os_eventq_put(os_eventq_dflt_get(), &loraping_ev_rx);
}

/// Callback Function that is called when no LoRa messages could be received due to timeout
static void on_rx_timeout(void)
{
    Radio.Sleep();
    loraping_stats.rx_timeout++;
    loraping_rxinfo_timeout();
    //  TODO: os_eventq_put(os_eventq_dflt_get(), &loraping_ev_tx);
}

/// Callback Function that is called when we couldn't receive a LoRa message due to error
static void on_rx_error(void)
{
    loraping_stats.rx_error++;
    Radio.Sleep();
    //  TODO: os_eventq_put(os_eventq_dflt_get(), &loraping_ev_tx);
}

#ifdef TODO  //  Needed only for receiving LoRa messages
static int loraping_is_master = 1;  //  1 if we should send "PING", else we reply "PONG"
#endif  //  TODO

#ifdef TODO  //  Needed only for receiving LoRa messages
/// Transmit a "PING" or "PONG" LoRa message
static void loraping_tx(void)
{
    /* Print information about last rx attempt. */
    loraping_rxinfo_print();

    if (loraping_rx_size == 0) {
        /* Timeout. */
    } else {
        vTaskDelay(1);
        if (memcmp(loraping_buffer, loraping_pong_msg, 4) == 0) {
            loraping_stats.rx_ping++;
        } else if (memcmp(loraping_buffer, loraping_ping_msg, 4) == 0) {
            loraping_stats.rx_pong++;

            /* A master already exists.  Become a slave. */
            loraping_is_master = 0;
        } else {
            /* Valid reception but neither a PING nor a PONG message. */
            loraping_stats.rx_other++;
            /* Set device as master and start again. */
            loraping_is_master = 1;
        }
    }

    loraping_rx_size = 0;
    send_once(loraping_is_master);
}
#endif  //  TODO

#ifdef NOTUSED
Output Log:


# help
====Build-in Commands====
====Support 4 cmds once, seperate by ; ====
help                     : print this
p                        : print memory
m                        : modify memory
echo                     : echo for command
exit                     : close CLI
devname                  : print device name
sysver                   : system version
reboot                   : reboot system
poweroff                 : poweroff system
reset                    : system reset
time                     : system time
ota                      : system ota
ps                       : thread dump
ls                       : file list
hexdump                  : dump file
cat                      : cat file

====User Commands====
init_driver              : Init LoRa driver
send_message             : Send LoRa message
receive_message          : Receive LoRa message
read_registers           : Read registers
spi_result               : Show SPI counters
blogset                  : blog pri set level
blogdump                 : blog info dump
bl_sys_time_now          : sys time now

# read_registers
port0 eventloop init = 42010780
[HAL] [SPI] Init :
port=0, mode=0, polar_phase = 1, freq=200000, tx_dma_ch=2, rx_dma_ch=3, pin_clk=3, pin_cs=2, pin_mosi=1, pin_miso=4
set rwspeed = 200000
hal_gpio_init: cs:2, clk:3, mosi:1, miso: 4
hal_gpio_init: SPI controller mode
hal_spi_init.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
Register 0x00 = 0x00
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
Register 0x01 = 0x09
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
Register 0x02 = 0x1a
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
Register 0x03 = 0x0b
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
Register 0x04 = 0x00
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
Register 0x05 = 0x52
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
Register 0x06 = 0x6c
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
Register 0x07 = 0x80
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
Register 0x08 = 0x00
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all evet group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
Register 0x09 = 0x4f
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
Register 0x0a = 0x09
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
Register 0x0b = 0x2b
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
Register 0x0c = 0x20
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
Register 0x0d = 0x08
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
Register 0x0e = 0x02
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
Register 0x0f = 0x0a

# 
# reboot
reboot
ˇStarting bl602 now....
Booting BL602 Chip...
‚ñà‚ñà‚ñà‚ñà‚ñà‚ñà‚ïó ‚ñà‚ñà‚ïó      ‚ñà‚ñà‚ñà‚ñà‚ñà‚ñà‚ïó  ‚ñà‚ñà‚ñà‚ñà‚ñà‚ñà‚ïó ‚ñà‚ñà‚ñà‚ñà‚ñà‚ñà‚ïó

‚ñà‚ñà‚ïî‚ïê‚ïê‚ñà‚ñà‚ïó‚ñà‚ñà‚ïë     ‚ñà‚ñà‚ïî‚ïê‚ïê‚ïê‚ïê‚ïù ‚ñà‚ñà‚ïî‚ïê‚ñà‚ñà‚ñà‚ñà‚ïó‚ïö‚ïê‚ïê‚ïê‚ïê‚ñà‚ñà‚ïó

‚ñà‚ñà‚ñà‚ñà‚ñà‚ñà‚ïî‚ïù‚ñà‚ñà‚ïë     ‚ñà‚ñà‚ñà‚ñà‚ñà‚ñà‚ñà‚ïó ‚ñà‚ñà‚ïë‚ñà‚ñà‚ïî‚ñà‚ñà‚ïë ‚ñà‚ñà‚ñà‚ñà‚ñà‚ïî‚ïù

‚ñà‚ñà‚ïî‚ïê‚ïê‚ñà‚ñà‚ïó‚ñà‚ñà‚ïë     ‚ñà‚ñà‚ïî‚ïê‚ïê‚ïê‚ñà‚ñà‚ïó‚ñà‚ñà‚ñà‚ñà‚ïî‚ïù‚ñà‚ñà‚ïë‚ñà‚ñà‚ïî‚ïê‚ïê‚ïê‚ïù

‚ñà‚ñà‚ñà‚ñà‚ñà‚ñà‚ïî‚ïù‚ñà‚ñà‚ñà‚ñà‚ñà‚ñà‚ñà‚ïó‚ïö‚ñà‚ñà‚ñà‚ñà‚ñà‚ñà‚ïî‚ïù‚ïö‚ñà‚ñà‚ñà‚ñà‚ñà‚ñà‚ïî‚ïù‚ñà‚ñà‚ñà‚ñà‚ñà‚ñà‚ñà‚ïó

‚ïö‚ïê‚ïê‚ïê‚ïê‚ïê‚ïù ‚ïö‚ïê‚ïê‚ïê‚ïê‚ïê‚ïê‚ïù ‚ïö‚ïê‚ïê‚ïê‚ïê‚ïê‚ïù  ‚ïö‚ïê‚ïê‚ïê‚ïê‚ïê‚ïù ‚ïö‚ïê‚ïê‚ïê‚ïê‚ïê‚ïê‚ïù



------------------------------------------------------------
RISC-V Core Feature:RV32-ACFIMX
Build Version: release_bl_iot_sdk_1.6.11-1-g66bb28da-dirty
Build Date: Feb 20 2021
Build Time: 16:38:09
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
      evt handler 0x2300c720, msg handler 0x2300c6f0, trigged cnt 0, bitmap async 0 sync 0, time consumed 0us acc 0ms, max 0us
    task[30] : empty
    task[29] : empty
    task[28] : empty
    task[27] : empty
    task[26] : empty
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

# spi_result
DIO0 Interrupts: 0
DIO1 Interrupts: 0
DIO2 Interrupts: 0
DIO3 Interrupts: 0
DIO4 Interrupts: 0
DIO5 Interrupts: 0
Unknown Int:     0
Tx Interrupts:   0
Tx Status:       0x0
Tx Term Count:   0x0
Tx Error:        0x0
Rx Interrupts:   0
Rx Status:       0x0
Rx Term Count:   0x0
Rx Error:        0x0

# init_driver
port0 eventloop init = 42010780
[HAL] [SPI] Init :
port=0, mode=0, polar_phase = 1, freq=200000, tx_dma_ch=2, rx_dma_ch=3, pin_clk=3, pin_cs=2, pin_mosi=1, pin_miso=4
set rwspeed = 200000
hal_gpio_init: cs:2, clk:3, mosi:1, miso: 4
hal_gpio_init: SPI controller mode
hal_spi_init.
SX1276 register handler: GPIO 5
SX1276 register handler: GPIO 0
SX1276 register handler: GPIO 11
SX1276 register handler: GPIO 12
TODO: os_cputime_delay_usecs 1000
TODO: os_cputime_delay_usecs 6000
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200c58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
tansfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].le = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, ize=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x
# 
# spi_result
DIO0 Interrupts: 0
DIO1 Interrupts: 0
IO2 Interrupts: 0
DIO3 Interrupts: 1
DIO4 Interrupts: 0
DIO5 Interrupts: 0
Unknown Int:     0
Tx Interrupts:   178
Tx Status:       0x0
Tx Term Count:   0x0
Tx Error:        0x0
Rx Interrupts:   178
Rx Status:       0x0
Rx Term Count:   0x0
Rx Error:        0x0

# 
# spi_result
DIO0 Interrupts: 0
DIO1 Interrupts: 0
DIO2 Interrupts: 0
DIO3 Interrupts: 1
DIO4 Interrupts: 0
DIO5 Interrupts: 0
Unknown Int:     0
Tx Interrupts:   178
Tx Status:       0x0
Tx Term Count:   0x0
Tx Error:        0x0
Rx Interrupts:   178
Rx Status:       0x0
Rx Term Count:   0x0
Rx Error:        0x0

# 
# receive_message
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.

# spi_result
DIO0 Interrupts: 0
DIO1 Interrupts: 0
DIO2 Interrupts: 0
DIO3 Interrupts: 1
DIO4 Interrupts: 0
DIO5 Interrupts: 0
Unknown Int:     0
Tx Interrupts:   206
Tx Status:       0x0
Tx Term Count:   0x0
Tx Error:        0x0
Rx Interrupts:   206
Rx Status:       0x0
Rx Term Count:   0x0
Rx Error:        0x0

# 
# 
# init_driver
port0 eventloop init = 42010780
[HAL] [SPI] Init :
port=0, mode=0, polar_phase = 1, freq=200000, tx_dma_ch=2, rx_dma_ch=3, pin_clk=3, pin_cs=2, pin_mosi=1, pin_miso=4
set rwspeed = 200000
hal_gpio_init: cs:2, clk:3, mosi:1, miso: 4
hal_gpio_init: SPI controller mode
hal_spi_init.
SX127 register handler: GPIO 5
SX1276 register handler: GPIO 0
SX1276 register handler: GPIO 11
SX1276 register handler: GPIO 12
TODO: os_cputime_delay_usecs 1000
TODO: os_cputime_delay_usecs 6000
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMAsrc=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, det=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
RxDMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].le = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, ize=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc4, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0
# 
# spi_result
DIO0 Interrupts: 0
DIO1 Interrupts: 0
DIO2 Interrupts: 0
DIO3 Interrupts: 1
DIO4 Interrupts: 0
DIO5 Interrupts: 0
Unknown Int:     0
Tx Interrupts:   178
Tx Status:       0x0
Tx Term Count:   0x0
Tx Error:        0x0
Rx Interrupts:   178
Rx Status:       0x0
Rx Term Count:   0x0
Rx Error:        0x0

# receive_message
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200c54, size=1, si=0, di=1, i=1
recv al event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.
hal_spi_transfer = 1
transfer xfer[0].len = 1
Tx DMA src=0x4200cc58, dest=0x4000a288, size=1, si=1, di=0, i=1
Rx DMA src=0x4000a28c, dest=0x4200cc54, size=1, si=0, di=1, i=1
recv all event group.

# 
# 
#endif  //  NOTUSED