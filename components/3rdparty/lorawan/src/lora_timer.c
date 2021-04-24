//  Timer Functions ported from Mynewt to NimBLE Porting Layer
#include <assert.h>
#include "nimble_npl.h"      //  For NimBLE Porting Layer (timer functions)
#include "node/lora_timer.h"

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