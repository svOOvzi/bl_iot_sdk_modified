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
#include <bl_gpio.h>         //  For bl_gpio_output_set
#include <bl602_glb.h>       //  For GLB_GPIO_Func_Init
#include "radio.h"
#include "rxinfo.h"
#include "sx1276.h"
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

/// Show the SPI interrupt counters, status and error codes
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

/// List of commands. STATIC_CLI_CMD_ATTRIBUTE makes this(these) command(s) static
const static struct cli_command cmds_user[] STATIC_CLI_CMD_ATTRIBUTE = {
    {"init_driver",    "Init LoRa driver",    init_driver},
    {"send_message",   "Send LoRa message",   send_message},
    {"read_registers", "Read registers",      read_registers},
    {"spi_result",     "Show SPI counters",   spi_result},
};                                                                                   

/// At startup, init the LoRa driver and send LoRa messages in a loop, at 10-second intervals
int cli_init(void)
{
    //  Configure Blue LED pin as a GPIO Pin
    GLB_GPIO_Type pins[1];
    pins[0] = SX1276_LED;  //  Pin number
    BL_Err_Type rc2 = GLB_GPIO_Func_Init(
        GPIO_FUN_SWGPIO,  //  Configure as GPIO 
        pins,             //  Pins to be configured
        sizeof(pins) / sizeof(pins[0])  //  Number of pins (1)
    );
    assert(rc2 == SUCCESS);    

    //  Configure Blue LED pin as a GPIO Output Pin (instead of GPIO Input)
    int rc = bl_gpio_enable_output(SX1276_LED, 0, 0);
    assert(rc == 0);

    //  Set Blue LED pin to High, to turn the LED off
    rc = bl_gpio_output_set(SX1276_LED, 1);
    assert(rc == 0);

    //  Init the LoRa driver
    init_driver("", 0, 0, NULL);

    //  Loop forever sending messages
    for (;;) {
        //  Wait 10 seconds
        vTaskDelay(10000 / portTICK_PERIOD_MS);

        //  Send the "PING" message
        send_message("", 0, 0, NULL);

        //  Flip the Blue LED on and off
        static int blink = 0;
        blink = (blink + 1) % 2;
        if (blink == 0) {
            //  Set Blue LED pin to High, to turn the LED off
            rc = bl_gpio_output_set(SX1276_LED, 1);
            assert(rc == 0);
        } else {
            //  Set Blue LED pin to Low, to turn the LED on
            rc = bl_gpio_output_set(SX1276_LED, 0);
            assert(rc == 0);
        }
    }

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

#ifdef TODO  //  Needed only for receiving LoRa messages
/// Receive a "PING" or "PONG" LoRa message
static void loraping_rx(void)
{
    Radio.Rx(LORAPING_RX_TIMEOUT_MS);
}
#endif  //  TODO
