//  Based on https://github.com/apache/mynewt-core/blob/master/hw/drivers/lora/sx1276/src/sx1276-board.c
/*
 / _____)             _              | |
( (____  _____ ____ _| |_ _____  ____| |__
 \____ \| ___ |    (_   _) ___ |/ ___)  _ \
 _____) ) ____| | | || |_| ____( (___| | | |
(______/|_____)_|_|_| \__)_____)\____)_| |_|
    (C)2013 Semtech

Description: SX1276 driver specific target board functions implementation

License: Revised BSD License, see LICENSE.TXT file include in the project

Maintainer: Miguel Luis and Gregory Cristian
*/
#include <stddef.h>
#include <assert.h>
#include <device/vfs_spi.h>  //  For spi_ioc_transfer_t
#include <hal/soc/spi.h>     //  For hal_spi_transfer
#include <hal_spi.h>         //  For spi_init
#include <bl_gpio.h>         //  For bl_gpio_output_set
#include <bl_irq.h>          //  For bl_irq_register_with_ctx
#include <bl602_glb.h>       //  For GLB_GPIO_Func_Init
#include "nimble_npl.h"      //  For NimBLE Porting Layer (multitasking functions)
#include "radio.h"
#include "sx1276.h"
#include "sx1276-board.h"

static int register_gpio_handler(
    uint8_t gpioPin,         //  GPIO Pin Number
    DioIrqHandler *handler,  //  GPIO Handler Function
    uint8_t intCtrlMod,      //  GPIO Interrupt Control Mode (see below)
    uint8_t intTrgMod,       //  GPIO Interrupt Trigger Mode (see below)
    uint8_t pullup,          //  1 for pullup, 0 for no pullup
    uint8_t pulldown);       //  1 for pulldown, 0 for no pulldown
static void gpio_interrupt_entry(void *arg);

extern DioIrqHandler *DioIrq[];

#if SX1276_HAS_ANT_SW
/*!
 * Flag used to set the RF switch control pins in low power mode when the radio is not active.
 */
static bool RadioIsActive = false;
#endif

/*!
 * Radio driver structure initialization
 */
const struct Radio_s Radio =
{
    .Init = SX1276Init,
    .GetStatus = SX1276GetStatus,
    .SetModem = SX1276SetModem,
    .SetChannel = SX1276SetChannel,
    .IsChannelFree = SX1276IsChannelFree,
    .Random = SX1276Random,
    .SetRxConfig = SX1276SetRxConfig,
    .SetTxConfig = SX1276SetTxConfig,
    .CheckRfFrequency = SX1276CheckRfFrequency,
    .TimeOnAir = SX1276GetTimeOnAir,
    .Send = SX1276Send,
    .Sleep = SX1276SetSleep,
    .Standby = SX1276SetStby,
    .Rx = SX1276SetRx,
    .StartCad = SX1276StartCad,
    .Rssi = SX1276ReadRssi,
    .Write = SX1276Write,
    .Read = SX1276Read,
    .WriteBuffer = SX1276WriteBuffer,
    .ReadBuffer = SX1276ReadBuffer,
    .SetMaxPayloadLength = SX1276SetMaxPayloadLength,
    .SetPublicNetwork = SX1276SetPublicNetwork,
    .GetWakeupTime = SX1276GetWakeupTime,
    .RxDisable = SX1276RxDisable
};

/// SPI Port
spi_dev_t spi_device;

void SX1276IoInit(void)
{
    int rc;

#if SX1276_HAS_ANT_SW
    //  Configure RXTX pin as a GPIO Pin
    GLB_GPIO_Type pins2[1];
    pins2[0] = SX1276_RXTX;
    BL_Err_Type rc2 = GLB_GPIO_Func_Init(
        GPIO_FUN_SWGPIO,  //  Configure as GPIO 
        pins2,            //  Pins to be configured
        sizeof(pins2) / sizeof(pins2[0])  //  Number of pins (1)
    );
    assert(rc2 == SUCCESS);    

    //  Configure RXTX pin as a GPIO Output Pin (instead of GPIO Input)
    rc = bl_gpio_enable_output(SX1276_RXTX, 0, 0);
    assert(rc == 0);

    //  Set RXTX pin to Low
    rc = bl_gpio_output_set(SX1276_RXTX, 0);
    assert(rc == 0);
#endif

    //  Configure Chip Select pin as a GPIO Pin
    GLB_GPIO_Type pins[1];
    pins[0] = RADIO_NSS;
    BL_Err_Type rc2 = GLB_GPIO_Func_Init(
        GPIO_FUN_SWGPIO,  //  Configure as GPIO 
        pins,             //  Pins to be configured
        sizeof(pins) / sizeof(pins[0])  //  Number of pins (1)
    );
    assert(rc2 == SUCCESS);    

    //  Configure Chip Select pin as a GPIO Output Pin (instead of GPIO Input)
    rc = bl_gpio_enable_output(RADIO_NSS, 0, 0);
    assert(rc == 0);

    //  Set Chip Select pin to High, to deactivate SX1276
    rc = bl_gpio_output_set(RADIO_NSS, 1);
    assert(rc == 0);

    //  Configure the SPI Port
    rc = spi_init(
        &spi_device,    //  SPI Device
        RADIO_SPI_IDX,  //  SPI Port
        0,              //  SPI Mode: 0 for Controller
        //  TODO: Due to a quirk in BL602 SPI, we must set
        //  SPI Polarity-Phase to 1 (CPOL=0, CPHA=1).
        //  But actually Polarity-Phase for SX1276 should be 0 (CPOL=0, CPHA=0). 
        1,                    //  SPI Polarity-Phase
        SX1276_SPI_BAUDRATE,  //  SPI Frequency
        2,                    //  Transmit DMA Channel
        3,                    //  Receive DMA Channel
        SX1276_SPI_CLK_PIN,   //  SPI Clock Pin 
        SX1276_SPI_CS_OLD,    //  Unused SPI Chip Select Pin
        SX1276_SPI_SDI_PIN,   //  SPI Serial Data In Pin  (formerly MISO)
        SX1276_SPI_SDO_PIN    //  SPI Serial Data Out Pin (formerly MOSI)
    );
    assert(rc == 0);
}

/// Register GPIO Interrupt Handlers for DIO0 to DIO5.
/// Based on hal_button_register_handler_with_dts in https://github.com/lupyuen/bl_iot_sdk/blob/master/components/hal_drv/bl602_hal/hal_button.c
void SX1276IoIrqInit(DioIrqHandler **irqHandlers)
{
    int rc;

    //  DIO0: Trigger for Packet Received
    if (SX1276_DIO0 >= 0 && irqHandlers[0] != NULL) {
        rc = register_gpio_handler(SX1276_DIO0, irqHandlers[0], GLB_GPIO_INT_CONTROL_ASYNC,
            GLB_GPIO_INT_TRIG_POS_PULSE, 0, 0);
        assert(rc == 0);
    }

    //  DIO1: Trigger for Sync Timeout
    // if (SX1276_DIO1 >= 0 && irqHandlers[1] != NULL) {
    //     rc = register_gpio_handler(SX1276_DIO1, irqHandlers[1], GLB_GPIO_INT_CONTROL_ASYNC,
    //         GLB_GPIO_INT_TRIG_POS_PULSE, 0, 0);
    //     assert(rc == 0);
    // }

    //  DIO2: Trigger for Change Channel (Spread Spectrum / Frequency Hopping)
    // if (SX1276_DIO2 >= 0 && irqHandlers[2] != NULL) {
    //     rc = register_gpio_handler(SX1276_DIO2, irqHandlers[2], GLB_GPIO_INT_CONTROL_ASYNC,
    //         GLB_GPIO_INT_TRIG_POS_PULSE, 0, 0);
    //     assert(rc == 0);
    // }

    //  DIO3: Trigger for CAD Done.
    //  CAD = Channel Activity Detection. We detect whether a Radio Channel 
    //  is in use, by scanning very quickly for the LoRa Packet Preamble.
    if (SX1276_DIO3 >= 0 && irqHandlers[3] != NULL) {
        rc = register_gpio_handler(SX1276_DIO3, irqHandlers[3], GLB_GPIO_INT_CONTROL_ASYNC,
            GLB_GPIO_INT_TRIG_POS_PULSE, 0, 0);
        assert(rc == 0);
    }

    //  DIO4: Unused (FSK only)
    // if (SX1276_DIO4 >= 0 && irqHandlers[4] != NULL) {
    //     rc = register_gpio_handler(SX1276_DIO4, irqHandlers[4], GLB_GPIO_INT_CONTROL_ASYNC,
    //         GLB_GPIO_INT_TRIG_POS_PULSE, 0, 0);
    //     assert(rc == 0);
    // }

    //  DIO5: Unused (FSK only)
    // if (SX1276_DIO5 >= 0 && irqHandlers[5] != NULL) {
    //     rc = register_gpio_handler(SX1276_DIO5, irqHandlers[5], GLB_GPIO_INT_CONTROL_ASYNC,
    //         GLB_GPIO_INT_TRIG_POS_PULSE, 0, 0);
    //     assert(rc == 0);
    // }

    //  Register Interrupt Handler for GPIO Interrupt
    bl_irq_register_with_ctx(
        GPIO_INT0_IRQn,         //  GPIO Interrupt
        gpio_interrupt_entry,   //  Interrupt Handler
        NULL                    //  Argument for Interrupt Handler
    );

    //  Enable GPIO Interrupt
    bl_irq_enable(GPIO_INT0_IRQn);
}

/// Deregister GPIO Interrupt Handlers for DIO0 to DIO5
void SX1276IoDeInit( void )
{
#ifdef TODO
    if (DioIrq[0] != NULL) {
        hal_gpio_irq_release(SX1276_DIO0);
    }
    if (DioIrq[1] != NULL) {
        hal_gpio_irq_release(SX1276_DIO1);
    }
    if (DioIrq[2] != NULL) {
        hal_gpio_irq_release(SX1276_DIO2);
    }
    if (DioIrq[3] != NULL) {
        hal_gpio_irq_release(SX1276_DIO3);
    }
    if (DioIrq[4] != NULL) {
        hal_gpio_irq_release(SX1276_DIO4);
    }
    if (DioIrq[5] != NULL) {
        hal_gpio_irq_release(SX1276_DIO5);
    }
#endif  //  TODO
}

/// Get the Power Amplifier configuration
uint8_t SX1276GetPaSelect(uint32_t channel)
{
    uint8_t pacfg;

    if (channel < RF_MID_BAND_THRESH) {
#if (SX1276_LF_USE_PA_BOOST == 1)
        pacfg = RF_PACONFIG_PASELECT_PABOOST;
#else
        pacfg = RF_PACONFIG_PASELECT_RFO;
#endif
    } else {
#if (SX1276_HF_USE_PA_BOOST == 1)
        pacfg = RF_PACONFIG_PASELECT_PABOOST;
#else
        pacfg = RF_PACONFIG_PASELECT_RFO;
#endif
    }

    return pacfg;
}

#if SX1276_HAS_ANT_SW
void SX1276SetAntSwLowPower( bool status )
{
    if (RadioIsActive != status) {
        RadioIsActive = status;

        if (status == false) {
            SX1276AntSwInit( );
        } else {
            SX1276AntSwDeInit( );
        }
    }
}

void
SX1276AntSwInit(void)
{
    // Consider turning off GPIO pins for low power. They are always on right
    // now. GPIOTE library uses 0.5uA max when on, typical 0.1uA.
}

void
SX1276AntSwDeInit(void)
{
    // Consider this for low power - ie turning off GPIO pins
}

void
SX1276SetAntSw(uint8_t rxTx)
{
    // 1: TX, 0: RX
    if (rxTx != 0) {
        hal_gpio_write(SX1276_RXTX, 1);
    } else {
        hal_gpio_write(SX1276_RXTX, 0);
    }
}
#endif

/// Checks if the given RF frequency is supported by the hardware
bool SX1276CheckRfFrequency(uint32_t frequency)
{
    // Implement check. Currently all frequencies are supported
    return true;
}

uint32_t SX1276GetBoardTcxoWakeupTime(void)
{
    return 0;
}

/// Disable GPIO Interrupts for DIO0 to DIO3
void SX1276RxIoIrqDisable(void)
{
    printf("SX1276 disable interrupts\r\n");
    if (SX1276_DIO0 >= 0) { bl_gpio_intmask(SX1276_DIO0, 1); }
    if (SX1276_DIO1 >= 0) { bl_gpio_intmask(SX1276_DIO1, 1); }
    if (SX1276_DIO2 >= 0) { bl_gpio_intmask(SX1276_DIO2, 1); }
    if (SX1276_DIO3 >= 0) { bl_gpio_intmask(SX1276_DIO3, 1); }
}

/// Enable GPIO Interrupts for DIO0 to DIO3
void SX1276RxIoIrqEnable(void)
{
    printf("SX1276 enable interrupts\r\n");
    if (SX1276_DIO0 >= 0) { bl_gpio_intmask(SX1276_DIO0, 0); }
    if (SX1276_DIO1 >= 0) { bl_gpio_intmask(SX1276_DIO1, 0); }
    if (SX1276_DIO2 >= 0) { bl_gpio_intmask(SX1276_DIO2, 0); }
    if (SX1276_DIO3 >= 0) { bl_gpio_intmask(SX1276_DIO3, 0); }
}

///////////////////////////////////////////////////////////////////////////////
//  GPIO Interrupt: Handle GPIO Interrupt triggered by received LoRa Packet

/// Maximum number of GPIO Pins that can be configured for interrupts
#define MAX_GPIO_INTERRUPTS 6  //  DIO0 to DIO5

/// Array of GPIO Pins that have been configured for interrupts.
/// gpio_interrupts[i] corresponds to gpio_events[i].
static uint8_t gpio_interrupts[MAX_GPIO_INTERRUPTS];

/// Array of Events for the GPIO Interrupts.
/// gpio_interrupts[i] corresponds to gpio_events[i].
static struct ble_npl_event gpio_events[MAX_GPIO_INTERRUPTS];

static int handle_gpio_interrupt(uint8_t gpioPin);

/// Register Interrupt Handler for GPIO. Return 0 if successful.
/// Based on bl_gpio_register in https://github.com/lupyuen/bl_iot_sdk/blob/master/components/hal_drv/bl602_hal/bl_gpio.c
static int register_gpio_handler(
    uint8_t gpioPin,         //  GPIO Pin Number
    DioIrqHandler *handler,  //  GPIO Handler Function
    uint8_t intCtrlMod,      //  GPIO Interrupt Control Mode (see below)
    uint8_t intTrgMod,       //  GPIO Interrupt Trigger Mode (see below)
    uint8_t pullup,          //  1 for pullup, 0 for no pullup
    uint8_t pulldown)        //  1 for pulldown, 0 for no pulldown
{
    printf("SX1276 register handler: GPIO %d\r\n", (int) gpioPin);

    //  Init the Event that will invoke the handler for the GPIO Interrupt
    //  TODO: Handle multiple GPIO Pins
    gpio_interrupts[0] = gpioPin;  //  TODO: Handle multiple GPIO Pins
    ble_npl_event_init(   //  Init the Event for...
        &gpio_events[0],  //  Event. TODO:  Handle multiple GPIO Pins
        handler,          //  Event Handler Function
        NULL              //  Argument to be passed to Event Handler
    );

    //  Configure pin as a GPIO Pin
    GLB_GPIO_Type pins[1];
    pins[0] = gpioPin;
    BL_Err_Type rc2 = GLB_GPIO_Func_Init(
        GPIO_FUN_SWGPIO,  //  Configure as GPIO 
        pins,             //  Pins to be configured
        sizeof(pins) / sizeof(pins[0])  //  Number of pins (1)
    );
    assert(rc2 == SUCCESS);    

    //  Configure pin as a GPIO Input Pin
    int rc = bl_gpio_enable_input(
        gpioPin,  //  GPIO Pin Number
        pullup,   //  1 for pullup, 0 for no pullup
        pulldown  //  1 for pulldown, 0 for no pulldown
    );
    assert(rc == 0);

    //  Disable GPIO Interrupt for the pin
    bl_gpio_intmask(gpioPin, 1);

    //  Configure GPIO Pin for GPIO Interrupt
    bl_set_gpio_intmod(
        gpioPin,     //  GPIO Pin Number
        intCtrlMod,  //  GPIO Interrupt Control Mode (see below)
        intTrgMod    //  GPIO Interrupt Trigger Mode (see below)
    );

    //  Enable GPIO Interrupt for the pin
    bl_gpio_intmask(gpioPin, 0);
    return 0;
}

//  GPIO Interrupt Control Modes:
//  GLB_GPIO_INT_CONTROL_SYNC:  GPIO interrupt sync mode
//  GLB_GPIO_INT_CONTROL_ASYNC: GPIO interrupt async mode
//  See hal_button_register_handler_with_dts in https://github.com/lupyuen/bl_iot_sdk/blob/master/components/hal_drv/bl602_hal/hal_button.c

//  GPIO Interrupt Trigger Modes:
//  GLB_GPIO_INT_TRIG_NEG_PULSE: GPIO negative edge pulse trigger
//  GLB_GPIO_INT_TRIG_POS_PULSE: GPIO positive edge pulse trigger
//  GLB_GPIO_INT_TRIG_NEG_LEVEL: GPIO negative edge level trigger (32k 3T)
//  GLB_GPIO_INT_TRIG_POS_LEVEL: GPIO positive edge level trigger (32k 3T)
//  See hal_button_register_handler_with_dts in https://github.com/lupyuen/bl_iot_sdk/blob/master/components/hal_drv/bl602_hal/hal_button.c

/// Interrupt Handler for GPIO Pins DIO0 to DIO5. Triggered by SX1276 when LoRa Packet is received 
/// and for other conditions.
/// Based on https://github.com/lupyuen/bl_iot_sdk/blob/master/components/hal_drv/bl602_hal/bl_gpio.c
static void gpio_interrupt_entry(void *arg)
{
    //  TODO: Check all GPIO Pins connected to DIO0 to DIO5
    for (GLB_GPIO_Type gpioPin = 0; gpioPin <= 12; gpioPin++) {
        //  Get the GPIO Pin status
        BL_Sts_Type status = GLB_Get_GPIO_IntStatus(gpioPin);
        //  If the GPIO Pin has triggered an interrupt...
        if (status == SET) {
            //  Handle the GPIO Interrupt
            handle_gpio_interrupt(gpioPin);
        }
    } 
}

/// Interrupt Counters
int g_dio0_counter, g_dio1_counter, g_dio2_counter, g_dio3_counter, g_dio4_counter, g_dio5_counter, g_nodio_counter;

/// Handle GPIO Interrupt
static int handle_gpio_interrupt(
    uint8_t gpioPin)  //  GPIO Pin Number
{
    //  Disable GPIO Interrupt for the pin
    bl_gpio_intmask(gpioPin, 1);

    //  Clear the GPIO Interrupt Status for the pin
    GLB_Clr_GPIO_IntStatus(gpioPin);
    ////bl_gpio_int_clear(gpioPin, 1);

    //  Increment the Interrupt Counters
    if (SX1276_DIO0 >= 0 && gpioPin == (uint8_t) SX1276_DIO0) { g_dio0_counter++; }
    else if (SX1276_DIO1 >= 0 && gpioPin == (uint8_t) SX1276_DIO1) { g_dio1_counter++; }
    else if (SX1276_DIO2 >= 0 && gpioPin == (uint8_t) SX1276_DIO2) { g_dio2_counter++; }
    else if (SX1276_DIO3 >= 0 && gpioPin == (uint8_t) SX1276_DIO3) { g_dio3_counter++; }
    else if (SX1276_DIO4 >= 0 && gpioPin == (uint8_t) SX1276_DIO4) { g_dio4_counter++; }
    else if (SX1276_DIO5 >= 0 && gpioPin == (uint8_t) SX1276_DIO5) { g_dio5_counter++; }
    else { g_nodio_counter++; }

#ifdef TODO  //  Commented out while we test multiple GPIO interrupts
    //  Find Event Handler for the GPIO Interrupt
    struct ble_npl_event *ev = &gpio_events[0];  //  TODO: Handle multiple GPIO Pins
    
    //  Use Event Queue to invoke Event Handler in the Application Task, 
    //  not in the Interrupt Context
    if (ev != NULL && ev->fn != NULL) {
        extern struct ble_npl_eventq event_queue;  //  TODO: Move Event Queue to header file
        ble_npl_eventq_put(&event_queue, ev);
    }
#endif  //  TODO

    //  After 1 interrupt, we suppress interrupts to troubleshoot the 
    //  hanging upon receiving a LoRa Packet.
    //  TODO: Always enable interrupts
    if (g_dio0_counter + g_dio1_counter + g_dio2_counter + g_dio3_counter
        + g_dio4_counter + g_dio5_counter + g_nodio_counter < 1) {
        //  Enable GPIO Interrupt for the pin
        //  TODO: bl_gpio_intmask(gpioPin, 0);
    }
    return 0;
}
