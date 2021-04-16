# BL602 Demo Firmware for LoRa SX1262 / SX1276 

This BL602 demo firmware transmits and receives LoRa packets by calling the SX1262 / SX1276 drivers...

- [`lora-sx1262`: Driver for Semtech SX1262 (Pine64 RFM90 LoRa Module)](../../components/3rdparty/lora-sx1262)

- [`lora-sx1276`: Driver for Semtech SX1276 / HopeRF RF96](../../components/3rdparty/lora-sx1276)

Refer to...

- ["Porting SX1262 Driver to BL602"](https://twitter.com/MisterTechBlog/status/1381870711124369413)

- ["Connect PineCone BL602 to LoRa Transceiver (SX1276)"](https://lupyuen.github.io/articles/lora)

- ["PineCone BL602 RISC-V Board Receives LoRa Packets (SX1276)"](https://lupyuen.github.io/articles/lora2)

# Connect BL602 to SX1262 / SX1276

Refer to...

- ["Connect BL602 to SX1262"](../../components/3rdparty/lora-sx1262#connect-bl602-to-sx1262)

- ["Connect BL602 to SX1276"](../../components/3rdparty/lora-sx1276#connect-bl602-to-sx1276)

# Select Frequency

The demo firmware is configured for LoRa 923 MHz.

To select the LoRa Frequency, change `#define USE_BAND_923` to `USE_BAND_433`, `USE_BAND_780`, `USE_BAND_868`, `USE_BAND_915` or `USE_BAND_923` in [`sdk_app_lora/demo.c`](sdk_app_lora/demo.c)...

```c
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
```

# Select Transceiver

The demo firmware is configured for SX1262.

To select SX1276, change `lora-sx1262` to `lora-sx1276` in [`Makefile`](Makefile)...

```text
# Components needed to transmit and receive LoRa Packets
# For SX1276: Change lora-sx1262 to lora-sx1276

COMPONENTS_LORA    := lora-sx1262 nimble-porting-layer 
```

# LoRa SX1262 Demo

Enter these commands for the SX1262 demo firmware...

1.  Create the Background Task that will process SX1262 interrupts...

    ```text
    # create_task
    ```

    ```text
    # init_driver
    SX126xReset
    SX126xIoInit
    SX126X interrupt init
    SX126X register handler: GPIO 11
    SX126xWakeup
    SX126xGetDeviceId: SX1262
    SX126xSetRfTxPower
    SX126xGetDeviceId: SX1262
    ```

1.  Transmit a 64-byte LoRa packet...

    ```text
    # send_message

    RadioOnDioIrq
    RadioIrqProcess
    SX126xReadCommand
    IRQ_TX_DONE
    Tx done
    ```

1.  Receive a LoRa packet (up to 64 bytes)...

    ```text
    # receive_message
    SX126xWakeup
    RadioOnDioIrq
    RadioIrqProcess
    SX126xReadCommand
    IRQ_PREAMBLE_DETECTED
    RadioOnDioIrq
    RadioIrqProcess
    SX126xReadCommand
    IRQ_HEADER_VALID
    RadioOnDioIrq
    RadioIrqProcess
    SX126xReadCommand
    IRQ_RX_DONE
    SX126xReadCommand
    SX126xReadCommand
    Rx done: 
    48 65 6c 6c 6f 00 01 02 03 04 05 06 07 08 09 0a 0b 0c 0d 0e 0f 10 11 12 13 14 15 16 17 18 19 1a 1b 1c 1d 1e 1f 20 21 22 23 24 25 26 27 28 29 2a 2b 2c 2d 2e 2f 30 31 32 33 34 35 36 37 38 39 3a 
    ```

1.  If no LoRa packet is received in 5 seconds, the driver goes to sleep...

    ```text
    # receive_message
    SX126xWakeup
    RadioOnRxTimeoutIrq
    Rx timeout
    ```

# LoRa SX1276 Demo

Enter these commands for the SX1276 demo firmware...

1.  To see the list of commands...

    ```text
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
    create_task              : Create a task
    put_event                : Add an event
    init_driver              : Init LoRa driver
    send_message             : Send LoRa message
    receive_message          : Receive LoRa message
    read_registers           : Read registers
    spi_result               : Show SPI counters
    blogset                  : blog pri set level
    blogdump                 : blog info dump
    bl_sys_time_now          : sys time now
    ```

1.  Create the Background Task that will process SX1276 interrupts...

    ```text
    # create_task
    ```

    ```text
    # init_driver
    SX1276 init
    SX1276 interrupt init
    SX1276 register handler: GPIO 11
    SX1276 register handler: GPIO 0
    SX126 register handler: GPIO 5
    SX1276 register handler: GPIO 12
    TODO: os_cputime_delay_usecs 1000
    TODO: os_cputime_delay_usecs 6000
    SX1276 DIO3: Channel activity detection
    ```

1.  Transmit a 64-byte LoRa packet...

    ```text
    # send_message
    ```

1.  Receive a LoRa packet (up to 64 bytes)...

    ```text
    # receive_message
    SX1276 DIO0: Packet received
    Rx done: RadioEvents.RxDone=0x23000ca6
    Rx done: 
    48 65 6c 6c 6f 
    ```

1.  Check the SX1276 and SPI counters...

    ```text
    # spi_result
    DIO0 Interrupts: 1
    DIO1 Interrupts: 0
    DIO2 Interrupts: 0
    DIO3 Interrupts: 1
    DIO4 Interrupts: 0
    DIO5 Interrupts: 0
    Unknown Int:     0
    Tx Interrupts:   302
    Tx Status:       0x0
    Tx Term Count:   0x0
    Tx Error:        0x0
    Rx Interrupts:   302
    Rx Status:       0x0
    Rx Term Count:   0x0
    Rx Error:        0x0
    ```

1.  Receive another LoRa packet...

    ```text
    # receive_message
    SX1276 DIO0: Packet received
    Rx done: RadioEvents.RxDone=0x23000ca6
    Rx done: 
    48 65 6c 6c 6f 
    ```

1.  The SX1276 and SPI counters have increased...

    ```text
    # spi_result
    DIO0 Interrupts: 2
    DIO1 Interrupts: 0
    DIO2 Interrupts: 0
    DIO3 Interrupts: 1
    DIO4 Interrupts: 0
    DIO5 Interrupts: 0
    Unknown Int:     0
    Tx Interrupts:   354
    Tx Status:       0x0
    Tx Term Count:   0x0
    Tx Error:        0x0
    Rx Interrupts:   354
    Rx Status:       0x0
    Rx Term Count:   0x0
    Rx Error:        0x0
    ```

1.  Receive another LoRa packet...

    ```text
    # receive_message
    SX1276 DIO0: Packet received
    Rx done: RadioEvents.RxDone=0x23000ca6
    Rx done: 
    48 65 6c 6c 6f 
    ```

1.  The SX1276 and SPI counters have increased again...

    ```text
    # spi_result
    DIO0 Interrupts: 3
    DIO1 Interrupts: 0
    DIO2 Interrupts: 0
    DIO3 Interrupts: 1
    DIO4 Interrupts: 0
    DIO5 Interrupts: 0
    Unknown Int:     0
    Tx Interrupts:   406
    Tx Status:       0x0
    Tx Term Count:   0x0
    Tx Error:        0x0
    Rx Interrupts:   406
    Rx Status:       0x0
    Rx Term Count:   0x0
    Rx Error:        0x0
    ```

1.  Receive one last LoRa packet...

    ```text
    # receive_message
    SX1276 DIO0: Packet received
    Rx done: RadioEvents.RxDone=0x23000ca6
    Rx done: 
    48 65 6c 6c 6f 
    ```

1.  The SX1276 and SPI counters have increased...

    ```text
    # spi_result
    DIO0 Interrupts: 4
    DIO1 Interrupts: 0
    DIO2 Interrupts: 0
    DIO3 Interrupts: 1
    DIO4 Interrupts: 0
    DIO5 Interrupts: 0
    Unknown Int:     0
    Tx Interrupts:   458
    Tx Status:       0x0
    Tx Term Count:   0x0
    Tx Error:        0x0
    Rx Interrupts:   458
    Rx Status:       0x0
    Rx Term Count:   0x0
    Rx Error:        0x0
    ```

1.  If no LoRa packet is received in 5 seconds, the driver goes to sleep...

    ```text
    # receive_message
    SX1276 receive timeout
    Rx timeout
    ```
