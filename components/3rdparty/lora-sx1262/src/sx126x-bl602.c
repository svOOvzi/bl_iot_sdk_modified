//  BL602 Functions for LoRa
#include <device/vfs_spi.h>  //  For spi_ioc_transfer_t
#include <hal/soc/spi.h>     //  For hal_spi_transfer
#include <hal_spi.h>         //  For spi_init
#include <bl_gpio.h>         //  For bl_gpio_output_set
#include <bl602_glb.h>       //  For GLB_GPIO_Func_Init
#include "nimble_npl.h"      //  For NimBLE Porting Layer (timer functions)

///////////////////////////////////////////////////////////////////////////////
//  Timer Functions

/// Initialise a timer. Based on https://mynewt.apache.org/latest/os/core_os/cputime/os_cputime.html#c.os_cputime_timer_init
void os_cputime_timer_init(
    struct ble_npl_callout *timer,  //  The timer to initialize. Cannot be NULL.
    ble_npl_event_fn *f,            //  The timer callback function. Cannot be NULL.
    void *arg)                      //  Pointer to data object to pass to timer.
{
    //  Implement with Callout Functions from NimBLE Porting Layer
    assert(timer != NULL);
    assert(f != NULL);

    //  Event Queue containing Events to be processed, defined in demo.c.  TODO: Move to header file.
    extern struct ble_npl_eventq event_queue;

    //  Init the Callout Timer with the Callback Function
    ble_npl_callout_init(
        timer,         //  Callout Timer
        &event_queue,  //  Event Queue that will handle the Callout upon timeout
        f,             //  Callback Function
        arg            //  Argument to be passed to Callback Function
    );
}

/// Stops a timer from running.  Can be called even if timer is not running.
/// Based on https://mynewt.apache.org/latest/os/core_os/cputime/os_cputime.html#c.os_cputime_timer_stop
void os_cputime_timer_stop(
    struct ble_npl_callout *timer)  //  Pointer to timer to stop. Cannot be NULL.
{
    //  Implement with Callout Functions from NimBLE Porting Layer
    assert(timer != NULL);

    //  If Callout Timer is still running...
    if (ble_npl_callout_is_active(timer)) {
        //  Stop the Callout Timer
        ble_npl_callout_stop(timer);
    }
}

/// Sets a timer that will expire ‘usecs’ microseconds from the current time.
/// NOTE: This must be called when the timer is stopped.
/// Based on https://mynewt.apache.org/latest/os/core_os/cputime/os_cputime.html#c.os_cputime_timer_relative
void os_cputime_timer_relative(
    struct ble_npl_callout *timer,  //  Pointer to timer. Cannot be NULL.
    uint32_t microsecs)             //  The number of microseconds from now at which the timer will expire.
{
    //  Implement with Callout Functions from NimBLE Porting Layer.
    //  Assume that Callout Timer has been stopped.
    assert(timer != NULL);

    //  Convert microseconds to ticks
    ble_npl_time_t ticks = ble_npl_time_ms_to_ticks32(
        microsecs / 1000  //  Duration in milliseconds
    );

    //  Wait at least 1 tick
    if (ticks == 0) { ticks = 1; }

    //  Trigger the Callout Timer after the elapsed ticks
    ble_npl_error_t rc = ble_npl_callout_reset(
        timer,  //  Callout Timer
        ticks   //  Number of ticks
    );
    assert(rc == 0);
}

/// Wait until ‘usecs’ microseconds has elapsed. This is a blocking delay.
/// Based on https://mynewt.apache.org/latest/os/core_os/cputime/os_cputime.html#c.os_cputime_delay_usecs
void os_cputime_delay_usecs(
    uint32_t microsecs)  //  The number of microseconds to wait.
{
    //  Implement with Timer Functions from NimBLE Porting Layer.
    //  Convert microseconds to ticks.
    ble_npl_time_t ticks = ble_npl_time_ms_to_ticks32(
        microsecs / 1000  //  Duration in milliseconds
    );

    //  Wait at least 1 tick
    if (ticks == 0) { ticks = 1; }

    //  Wait for the ticks
    ble_npl_time_delay(ticks);
}

///////////////////////////////////////////////////////////////////////////////
//  SPI Functions

/// SPI Device Instance. TODO: Move to sx1276.h
extern spi_dev_t spi_device;

/// SPI Transmit Buffer (1 byte)
static uint8_t spi_tx_buf[1];

/// SPI Receive Buffer (1 byte)
static uint8_t spi_rx_buf[1];

/// Blocking call to send a value on the SPI. Returns the value received from the SPI Peripheral.
/// Assume that we are sending and receiving 8-bit values on SPI.
/// Assume Chip Select Pin has already been set to Low by caller.
/// TODO: We should combine multiple SPI DMA Requests, instead of handling one byte at a time
uint16_t hal_spi_tx_val(int spi_num, uint16_t val) {
    //  Populate the transmit buffer
    spi_tx_buf[0] = val;

    //  Clear the receive buffer
    memset(&spi_rx_buf, 0, sizeof(spi_rx_buf));

    //  Prepare SPI Transfer
    static spi_ioc_transfer_t transfer;
    memset(&transfer, 0, sizeof(transfer));    
    transfer.tx_buf = (uint32_t) spi_tx_buf;  //  Transmit Buffer
    transfer.rx_buf = (uint32_t) spi_rx_buf;  //  Receive Buffer
    transfer.len    = 1;                      //  How many bytes

    //  Assume Chip Select Pin has already been set to Low by caller.

    //  Execute the SPI Transfer with the DMA Controller
    int rc = hal_spi_transfer(
        &spi_device,  //  SPI Device
        &transfer,    //  SPI Transfers
        1             //  How many transfers (Number of requests, not bytes)
    );
    assert(rc == 0);

    //  Return the received byte
    return spi_rx_buf[0];
}
