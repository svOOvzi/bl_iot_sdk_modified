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
#include <bl602_glb.h>       //  For GLB_GPIO_Func_Init
#include "radio.h"
#include "sx1276.h"
#include "sx1276-board.h"

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

#ifdef NOTUSED
    spi_settings.data_order = HAL_SPI_MSB_FIRST;
    spi_settings.data_mode = HAL_SPI_MODE0;
    spi_settings.baudrate = SX1276_SPI_BAUDRATE;
    spi_settings.word_size = HAL_SPI_WORD_SIZE_8BIT;
#endif  //  NOTUSED
}

void SX1276IoIrqInit(DioIrqHandler **irqHandlers)
{
#ifdef TODO
    int rc;

    if (irqHandlers[0] != NULL) {
        rc = hal_gpio_irq_init(SX1276_DIO0, irqHandlers[0], NULL,
                               HAL_GPIO_TRIG_RISING, HAL_GPIO_PULL_NONE);
        assert(rc == 0);
        hal_gpio_irq_enable(SX1276_DIO0);
    }

    if (irqHandlers[1] != NULL) {
        rc = hal_gpio_irq_init(SX1276_DIO1, irqHandlers[1], NULL,
                               HAL_GPIO_TRIG_RISING, HAL_GPIO_PULL_NONE);
        assert(rc == 0);
        hal_gpio_irq_enable(SX1276_DIO1);
    }

    if (irqHandlers[2] != NULL) {
        rc = hal_gpio_irq_init(SX1276_DIO2, irqHandlers[2], NULL,
                               HAL_GPIO_TRIG_RISING, HAL_GPIO_PULL_NONE);
        assert(rc == 0);
        hal_gpio_irq_enable(SX1276_DIO2);
    }

    if (irqHandlers[3] != NULL) {
        rc = hal_gpio_irq_init(SX1276_DIO3, irqHandlers[3], NULL,
                               HAL_GPIO_TRIG_RISING, HAL_GPIO_PULL_NONE);
        assert(rc == 0);
        hal_gpio_irq_enable(SX1276_DIO3);
    }

    if (irqHandlers[4] != NULL) {
        rc = hal_gpio_irq_init(SX1276_DIO4, irqHandlers[4], NULL,
                               HAL_GPIO_TRIG_RISING, HAL_GPIO_PULL_NONE);
        assert(rc == 0);
        hal_gpio_irq_enable(SX1276_DIO4);
    }

    if (irqHandlers[5] != NULL) {
        rc = hal_gpio_irq_init(SX1276_DIO5, irqHandlers[5], NULL,
                               HAL_GPIO_TRIG_RISING, HAL_GPIO_PULL_NONE);
        assert(rc == 0);
        hal_gpio_irq_enable(SX1276_DIO5);
    }
#endif  //  TODO
}

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

bool SX1276CheckRfFrequency(uint32_t frequency)
{
    // Implement check. Currently all frequencies are supported
    return true;
}

uint32_t SX1276GetBoardTcxoWakeupTime(void)
{
    return 0;
}

void SX1276RxIoIrqDisable(void)
{
#ifdef TODO
    hal_gpio_irq_disable(SX1276_DIO0);
    hal_gpio_irq_disable(SX1276_DIO1);
    hal_gpio_irq_disable(SX1276_DIO2);
    hal_gpio_irq_disable(SX1276_DIO3);
#endif  //  TODO
}

void SX1276RxIoIrqEnable(void)
{
#ifdef TODO
    hal_gpio_irq_enable(SX1276_DIO0);
    hal_gpio_irq_enable(SX1276_DIO1);
    hal_gpio_irq_enable(SX1276_DIO2);
    hal_gpio_irq_enable(SX1276_DIO3);
#endif  //  TODO
}

///////////////////////////////////////////////////////////////////////////////
//  GPIO Interrupt

#ifdef TODO

static int check_gpio_is_interrupt(int gpioPin)
{
    int bitcount = 0;
    int reg_val = 0;

    bitcount = 1 << gpioPin;
    reg_val = *(int32_t *)(GLB_BASE + GPIP_INT_STATE_OFFSET);

    if ((bitcount & reg_val) == bitcount) {
        return 0;
    }
    return -1;
}

static int exec_gpio_handler(gpio_ctx_t *pstnode)
{
    bl_gpio_intmask(pstnode->gpioPin, 1);

    if (pstnode->gpio_handler) {
        pstnode->gpio_handler(pstnode);
        return 0;
    }

    return -1;
}

static void gpio_interrupt_entry(gpio_ctx_t *pstnode)
{
    int ret;

    while (pstnode) {
        ret = check_gpio_is_interrupt(pstnode->gpioPin);
        if (ret == 0) {
            exec_gpio_handler(pstnode);
        }

        pstnode = pstnode->next;
    }
    return;
}

void bl_gpio_register(gpio_ctx_t *pstnode)
{
    bl_gpio_intmask(pstnode->gpioPin, 1);
    bl_set_gpio_intmod(pstnode->gpioPin, pstnode->intCtrlMod, pstnode->intTrgMod);
    bl_irq_register_with_ctx(GPIO_INT0_IRQn, gpio_interrupt_entry, pstnode);
    bl_gpio_intmask(pstnode->gpioPin, 0);
    bl_irq_enable(GPIO_INT0_IRQn);
}

#endif  //  TODO
