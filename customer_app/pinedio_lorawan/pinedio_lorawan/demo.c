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
#include <bl_gpio.h>                //  For bl_gpio_output_set
#include <sx126x-board.h>           //  For SX126X_SPI_CS_PIN
#include "radio.h"
#include "rxinfo.h"
#include "nimble_npl.h"             //  For NimBLE Porting Layer (multitasking functions)
#include "nimble_port_freertos.h"   //  For nimble_port_freertos_init
#include "lorawan.h"                //  For LoRaWAN command line functions
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
#define LORAPING_RX_TIMEOUT_MS              5000    /* ms */
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

/// GPIO for SPI Flash Chip Select Pin. We must set this to High to deselect SPI Flash.
#define FLASH_CS_PIN     14

/// GPIO for ST7789 SPI Chip Select Pin. We must set this to High to deselect ST7789 Display.
#define DISPLAY_CS_PIN   20

/// Set Chip Select pins to High, to deselect SX1262, SPI Flash and ST7789
int deselect_spi(void) {
    //  Configure Chip Select pins as GPIO Output Pins (instead of GPIO Input)
    int rc;
    rc = bl_gpio_enable_output(FLASH_CS_PIN,  0, 0);    assert(rc == 0);
    rc = bl_gpio_enable_output(DISPLAY_CS_PIN,  0, 0);  assert(rc == 0);
    rc = bl_gpio_enable_output(SX126X_SPI_CS_PIN,  0, 0);  assert(rc == 0);

    //  Set Chip Select pins to High, to deselect SX1262, SPI Flash and ST7789
    printf("Set Flash CS pin %d to high\r\n",  FLASH_CS_PIN);
    rc = bl_gpio_output_set(FLASH_CS_PIN, 1);    assert(rc == 0);
    printf("Set ST7789 CS pin %d to high\r\n", DISPLAY_CS_PIN);
    rc = bl_gpio_output_set(DISPLAY_CS_PIN, 1);  assert(rc == 0);
    printf("Set SX1262 CS pin %d to high\r\n", SX126X_SPI_CS_PIN);
    rc = bl_gpio_output_set(SX126X_SPI_CS_PIN, 1);  assert(rc == 0);
    return 0;
}

///////////////////////////////////////////////////////////////////////////////
//  Send LoRaWAN Message

//  Uncomment this if "send_message" command will send a LoRaWAN Join Network Request
//  #define SEND_LORAWAN_MESSAGE

#ifdef SEND_LORAWAN_MESSAGE
#define RF_FREQUENCY                923200000
#define LORAPING_TX_OUTPUT_POWER           22         /* dBm */

#define LORAPING_BANDWIDTH                  0         /* [0: 125 kHz, */
                                                      /*  1: 250 kHz, */
                                                      /*  2: 500 kHz, */
                                                      /*  3: Reserved] */
#define LORAPING_SPREADING_FACTOR          10         /* [SF7..SF12] */
#define LORAPING_CODINGRATE                 1         /* [1: 4/5, */
                                                      /*  2: 4/6, */
                                                      /*  3: 4/7, */
                                                      /*  4: 4/8] */
#define LORAPING_PREAMBLE_LENGTH            8         /* Same for Tx and Rx */
#define LORAPING_SYMBOL_TIMEOUT             5         /* Symbols */
#define LORAPING_FIX_LENGTH_PAYLOAD_ON      false
#define LORAPING_IQ_INVERSION_ON            false

#define LORAPING_TX_TIMEOUT_MS              3000    /* ms */
#define LORAPING_RX_TIMEOUT_MS              5000    /* ms */
#endif  //  SEND_LORAWAN_MESSAGE

///////////////////////////////////////////////////////////////////////////////
//  LoRa Commands

void SX126xIoInit(void);  //  Defined in sx126x-board.c
void SX1276IoInit(void);  //  Defined in sx1276-board.c
uint8_t SX126xReadRegister(uint16_t addr);  //  Defined in sx126x.c
uint8_t SX1276Read(uint16_t addr);          //  Defined in sx1276.c
static void send_once(int is_ping);
static void on_tx_done(void);
static void on_rx_done(uint8_t *payload, uint16_t size, int16_t rssi, int8_t snr);
static void on_tx_timeout(void);
static void on_rx_timeout(void);
static void on_rx_error(void);

/// Read LoRa Transceiver registers
static void read_registers(char *buf, int len, int argc, char **argv)
{
    //  Init the SPI port
    SX126xIoInit();      //  For SX1262
    //  SX1276IoInit();  //  For SX1276

    //  Read and print the first 16 registers: 0 to 15
    for (uint16_t addr = 0; addr < 0x10; addr++) {
        //  Read the register
        uint8_t val = SX126xReadRegister(addr);      //  For SX1262
        //  uint8_t val = SX1276Read(addr);          //  For SX1276

        //  Print the register value
        printf("Register 0x%02x = 0x%02x\r\n", addr, val);
    }
}

/// Command to initialise the LoRa Transceiver driver.
/// Assume that create_task has been called to init the Event Queue.
static void init_driver(char *buf, int len, int argc, char **argv)
{
    //  Set Chip Select pins to High, to deselect SX1262, SPI Flash and ST7789
    deselect_spi();

    //  Set the LoRa Callback Functions
    RadioEvents_t radio_events;
    memset(&radio_events, 0, sizeof(radio_events));  //  Must init radio_events to null, because radio_events lives on stack!
    radio_events.TxDone    = on_tx_done;     //  Packet has been transmitted
    radio_events.RxDone    = on_rx_done;     //  Packet has been received
    radio_events.TxTimeout = on_tx_timeout;  //  Transmit Timeout
    radio_events.RxTimeout = on_rx_timeout;  //  Receive Timeout
    radio_events.RxError   = on_rx_error;    //  Receive Error

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

/// Command to send a LoRa message. Assume that the LoRa Transceiver driver has been initialised.
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

#ifndef SEND_LORAWAN_MESSAGE
    //  Send the transmit buffer (64 bytes)
    Radio.Send(loraping_buffer, sizeof loraping_buffer);
#else
    //  Replay a LoRaWAN Join Network Request
    static uint8_t replay[] = {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x5b, 0xb1, 0x7b, 0x37, 0xe7, 0x5e, 0xc1, 0x4b, 0xb4, 0xb1, 0xb8, 0x30, 0xe9, 0x8c};
    Radio.Send(replay, sizeof replay);
#endif  //  !SEND_LORAWAN_MESSAGE
}

/// Command to receive a LoRa message. Assume that LoRa Transceiver driver has been initialised.
/// Assume that create_task has been called to init the Event Queue.
static void receive_message(char *buf, int len, int argc, char **argv)
{
    //  Receive a LoRa message within the timeout period
    Radio.Rx(LORAPING_RX_TIMEOUT_MS);
}

/// Show the interrupt counters, status and error codes
static void spi_result(char *buf, int len, int argc, char **argv)
{
    //  Interrupt Counters defined in sx126x-board.c and sx1276-board.c
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
    printf("Tx Status:       0x%x\r\n", (unsigned) g_tx_status);
    printf("Tx Term Count:   0x%x\r\n", (unsigned) g_tx_tc);
    printf("Tx Error:        0x%x\r\n", (unsigned) g_tx_error);
    printf("Rx Interrupts:   %d\r\n",   g_rx_counter);
    printf("Rx Status:       0x%x\r\n", (unsigned) g_rx_status);
    printf("Rx Term Count:   0x%x\r\n", (unsigned) g_rx_tc);
    printf("Rx Error:        0x%x\r\n", (unsigned) g_rx_error);
}

///////////////////////////////////////////////////////////////////////////////
//  Multitasking Commands (based on NimBLE Porting Layer)

/// Event Queue containing Events to be processed
struct ble_npl_eventq event_queue;

/// Event to be added to the Event Queue
struct ble_npl_event event;

static void task_callback(void *arg);
static void handle_event(struct ble_npl_event *ev);

/// Command to create a FreeRTOS Task with NimBLE Porting Layer
static void create_task(char *buf, int len, int argc, char **argv) {
    //  Init the Event Queue
    ble_npl_eventq_init(&event_queue);

    //  Init the Event
    ble_npl_event_init(
        &event,        //  Event
        handle_event,  //  Event Handler Function
        NULL           //  Argument to be passed to Event Handler
    );

    //  Create a FreeRTOS Task to process the Event Queue
    nimble_port_freertos_init(task_callback);
}

/// Command to enqueue an Event into the Event Queue with NimBLE Porting Layer
static void put_event(char *buf, int len, int argc, char **argv) {
    //  Add the Event to the Event Queue
    ble_npl_eventq_put(&event_queue, &event);
}

/// Task Function that dequeues Events from the Event Queue and processes the Events
static void task_callback(void *arg) {
    //  Loop forever handling Events from the Event Queue
    for (;;) {
        //  Get the next Event from the Event Queue
        struct ble_npl_event *ev = ble_npl_eventq_get(
            &event_queue,  //  Event Queue
            1000           //  Timeout in 1,000 ticks
        );

        //  If no Event due to timeout, wait for next Event
        if (ev == NULL) { continue; }

        //  Remove the Event from the Event Queue
        ble_npl_eventq_remove(&event_queue, ev);

        //  Trigger the Event Handler Function (handle_event)
        ble_npl_event_run(ev);
    }
}

/// Handle an Event
static void handle_event(struct ble_npl_event *ev) {
    printf("\r\nHandle an event\r\n");
}

///////////////////////////////////////////////////////////////////////////////
//  Command Line Interface

/// List of commands. STATIC_CLI_CMD_ATTRIBUTE makes this(these) command(s) static
const static struct cli_command cmds_user[] STATIC_CLI_CMD_ATTRIBUTE = {
    //  LoRa
    {"put_event",        "Add an event",           put_event},
    {"init_driver",      "Init LoRa driver",       init_driver},
    {"send_message",     "Send LoRa message",      send_message},
    {"receive_message",  "Receive LoRa message",   receive_message},
    {"read_registers",   "Read registers",         read_registers},
    {"spi_result",       "Show SPI counters",      spi_result},

    //  LoRaWAN
    {"create_task",     "Create LoRaWAN task",                  create_task},
    {"init_lorawan",    "Init LoRaWAN driver",                  init_lorawan},
    {"las_wr_mib",      "Write LoRaWAN MIB",                    las_cmd_wr_mib},
    {"las_rd_mib",      "Read LoRaWAN MIB",                     las_cmd_rd_mib},
    {"las_rd_dev_eui",  "Read LoRaWAN device EUI",              las_cmd_rd_dev_eui},
    {"las_wr_dev_eui",  "Write LoRaWAN device EUI",             las_cmd_wr_dev_eui},
    {"las_rd_app_eui",  "Read LoRaWAN application EUI",         las_cmd_rd_app_eui},
    {"las_wr_app_eui",  "Write LoRaWAN application EUI",        las_cmd_wr_app_eui},
    {"las_rd_app_key",  "Read LoRaWAN application key",         las_cmd_rd_app_key},
    {"las_wr_app_key",  "Write LoRaWAN application key",        las_cmd_wr_app_key},
    {"las_app_port",    "Open/close LoRaWAN application port",  las_cmd_app_port},
    {"las_app_tx",      "Transmit on LoRaWAN application port", las_cmd_app_tx},
    {"las_join",        "Perform a LoRaWAN OTA join",           las_cmd_join},
    {"las_link_chk",    "Perform a LoRaWAN link check",         las_cmd_link_chk},

    //  pbuf
    {"test_pbuf",        "Test LWIP pbuf",         test_pbuf},
    {"test_pbuf2",       "Test LWIP pbuf (large)", test_pbuf2},
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
//  LoRa Callback Functions

/// Callback Function that is called when our LoRa message has been transmitted
static void on_tx_done(void)
{
    printf("Tx done\r\n");

    //  Log the success status
    loraping_stats.tx_success++;

    //  Switch the LoRa Transceiver to low power, sleep mode
    Radio.Sleep();
    
    //  TODO: Receive a "PING" or "PONG" LoRa message
    //  os_eventq_put(os_eventq_dflt_get(), &loraping_ev_rx);
}

/// Callback Function that is called when a LoRa message has been received
static void on_rx_done(
    uint8_t *payload,  //  Buffer containing received LoRa message
    uint16_t size,     //  Size of the LoRa message
    int16_t rssi,      //  Signal strength
    int8_t snr)        //  Signal To Noise ratio
{
    printf("Rx done: \r\n");

    //  Switch the LoRa Transceiver to low power, sleep mode
    Radio.Sleep();

    //  Copy the received packet
    if (size > sizeof loraping_buffer) {
        size = sizeof loraping_buffer;
    }
    loraping_rx_size = size;
    memcpy(loraping_buffer, payload, size);

    //  Log the signal strength, signal to noise ratio
    loraping_rxinfo_rxed(rssi, snr);

    //  Dump the contents of the received packet
    for (int i = 0; i < loraping_rx_size; i++) {
        printf("%02x ", loraping_buffer[i]);
    }
    printf("\r\n");

    //  TODO: Send a "PING" or "PONG" LoRa message
    //  os_eventq_put(os_eventq_dflt_get(), &loraping_ev_tx);
}

/// Callback Function that is called when our LoRa message couldn't be transmitted due to timeout
static void on_tx_timeout(void)
{
    printf("Tx timeout\r\n");

    //  Switch the LoRa Transceiver to low power, sleep mode
    Radio.Sleep();

    //  Log the timeout
    loraping_stats.tx_timeout++;

    //  TODO: Receive a "PING" or "PONG" LoRa message
    //  os_eventq_put(os_eventq_dflt_get(), &loraping_ev_rx);
}

/// Callback Function that is called when no LoRa messages could be received due to timeout
static void on_rx_timeout(void)
{
    printf("Rx timeout\r\n");

    //  Switch the LoRa Transceiver to low power, sleep mode
    Radio.Sleep();

    //  Log the timeout
    loraping_stats.rx_timeout++;
    loraping_rxinfo_timeout();

    //  TODO: Send a "PING" or "PONG" LoRa message
    //  os_eventq_put(os_eventq_dflt_get(), &loraping_ev_tx);
}

/// Callback Function that is called when we couldn't receive a LoRa message due to error
static void on_rx_error(void)
{
    printf("Rx error\r\n");

    //  Log the error
    loraping_stats.rx_error++;

    //  Switch the LoRa Transceiver to low power, sleep mode
    Radio.Sleep();

    //  TODO: Send a "PING" or "PONG" LoRa message
    //  os_eventq_put(os_eventq_dflt_get(), &loraping_ev_tx);
}

#ifdef TODO
static int loraping_is_master = 1;  //  1 if we should send "PING", else we reply "PONG"
#endif  //  TODO

#ifdef TODO
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

///////////////////////////////////////////////////////////////////////////////
//  Dump Stack

/// Dump the current stack
void dump_stack(void)
{
    //  For getting the Stack Frame Pointer. Must be first line of function.
    uintptr_t *fp;

    //  Fetch the Stack Frame Pointer. Based on backtrace_riscv from
    //  https://github.com/bouffalolab/bl_iot_sdk/blob/master/components/bl602/freertos_riscv_ram/panic/panic_c.c#L76-L99
    __asm__("add %0, x0, fp" : "=r"(fp));
    printf("dump_stack: frame pointer=%p\r\n", fp);

    //  Dump the stack, starting at Stack Frame Pointer - 1
    printf("=== stack start ===\r\n");
    for (int i = 0; i < 128; i++) {
        uintptr_t *ra = (uintptr_t *)*(unsigned long *)(fp - 1);
        printf("@ %p: %p\r\n", fp - 1, ra);
        fp++;
    }
    printf("=== stack end ===\r\n\r\n");
}
