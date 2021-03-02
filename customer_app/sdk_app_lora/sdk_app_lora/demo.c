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
#define LORAPING_BUFFER_SIZE                64

const uint8_t loraping_ping_msg[] = "PING";
const uint8_t loraping_pong_msg[] = "PONG";

static uint8_t loraping_buffer[LORAPING_BUFFER_SIZE];
static int loraping_rx_size;
static int loraping_is_master = 1;

struct {
    int rx_timeout;
    int rx_ping;
    int rx_pong;
    int rx_other;
    int rx_error;
    int tx_timeout;
    int tx_success;
} loraping_stats;

static void loraping_tx(void);
static void loraping_rx(void);

#ifdef TODO
static struct os_event loraping_ev_tx = {
    .ev_cb = loraping_tx,
};
static struct os_event loraping_ev_rx = {
    .ev_cb = loraping_rx,
};
#endif  //  TODO

static void send_once(int is_ping)
{
    int i;

    if (is_ping) {
        memcpy(loraping_buffer, loraping_ping_msg, 4);
    } else {
        memcpy(loraping_buffer, loraping_pong_msg, 4);
    }
    for (i = 4; i < sizeof loraping_buffer; i++) {
        loraping_buffer[i] = i - 4;
    }

    Radio.Send(loraping_buffer, sizeof loraping_buffer);
}

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

static void loraping_rx(void)
{
    Radio.Rx(LORAPING_RX_TIMEOUT_MS);
}

static void on_tx_done(void)
{
    loraping_stats.tx_success++;
    Radio.Sleep();
    //  TODO: os_eventq_put(os_eventq_dflt_get(), &loraping_ev_rx);
}

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

static void on_tx_timeout(void)
{
    Radio.Sleep();
    loraping_stats.tx_timeout++;
    //  TODO: os_eventq_put(os_eventq_dflt_get(), &loraping_ev_rx);
}

static void on_rx_timeout(void)
{
    Radio.Sleep();
    loraping_stats.rx_timeout++;
    loraping_rxinfo_timeout();
    //  TODO: os_eventq_put(os_eventq_dflt_get(), &loraping_ev_tx);
}

static void on_rx_error(void)
{
    loraping_stats.rx_error++;
    Radio.Sleep();
    //  TODO: os_eventq_put(os_eventq_dflt_get(), &loraping_ev_tx);
}

void SX1276IoInit(void);            //  Defined in sx1276-board.c
uint8_t SX1276Read(uint16_t addr);  //  Defined in sx1276.c

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

/// Send a LoRa message
static void send_message(char *buf, int len, int argc, char **argv)
{
    RadioEvents_t radio_events;

    /* Radio initialization. */
    radio_events.TxDone = on_tx_done;
    radio_events.RxDone = on_rx_done;
    radio_events.TxTimeout = on_tx_timeout;
    radio_events.RxTimeout = on_rx_timeout;
    radio_events.RxError = on_rx_error;

    Radio.Init(&radio_events);

    Radio.SetChannel(RF_FREQUENCY);

    Radio.SetTxConfig(MODEM_LORA,
                      LORAPING_TX_OUTPUT_POWER,
                      0,        /* Frequency deviation; unused with LoRa. */
                      LORAPING_BANDWIDTH,
                      LORAPING_SPREADING_FACTOR,
                      LORAPING_CODINGRATE,
                      LORAPING_PREAMBLE_LENGTH,
                      LORAPING_FIX_LENGTH_PAYLOAD_ON,
                      true,     /* CRC enabled. */
                      0,        /* Frequency hopping disabled. */
                      0,        /* Hop period; N/A. */
                      LORAPING_IQ_INVERSION_ON,
                      LORAPING_TX_TIMEOUT_MS);

    Radio.SetRxConfig(MODEM_LORA,
                      LORAPING_BANDWIDTH,
                      LORAPING_SPREADING_FACTOR,
                      LORAPING_CODINGRATE,
                      0,        /* AFC bandwisth; unused with LoRa. */
                      LORAPING_PREAMBLE_LENGTH,
                      LORAPING_SYMBOL_TIMEOUT,
                      LORAPING_FIX_LENGTH_PAYLOAD_ON,
                      0,        /* Fixed payload length; N/A. */
                      true,     /* CRC enabled. */
                      0,        /* Frequency hopping disabled. */
                      0,        /* Hop period; N/A. */
                      LORAPING_IQ_INVERSION_ON,
                      true);    /* Continuous receive mode. */

    //  TODO: Send a LoRa message

    /* Immediately receive on start up. */
    //  TODO: os_eventq_put(os_eventq_dflt_get(), &loraping_ev_rx);
}

/// Show the SPI data received and the interrupt counters
static void spi_result(char *buf, int len, int argc, char **argv)
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

// STATIC_CLI_CMD_ATTRIBUTE makes this(these) command(s) static
const static struct cli_command cmds_user[] STATIC_CLI_CMD_ATTRIBUTE = {
    {"read_registers", "Read registers",      read_registers},
    {"send_message",   "Send LoRa message",   send_message},
    {"spi_result",     "Show SPI counters",   spi_result},
};                                                                                   

int cli_init(void)
{
    // static command(s) do NOT need to call aos_cli_register_command(s) to register.
    // However, calling aos_cli_register_command(s) here is OK but is of no effect as cmds_user are included in cmds list.
    // XXX NOTE: Calling this *empty* function is necessary to make cmds_user in this file to be kept in the final link.
    //return aos_cli_register_commands(cmds_user, sizeof(cmds_user)/sizeof(cmds_user[0]));          
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
