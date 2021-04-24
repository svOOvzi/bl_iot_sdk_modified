//  Timer Functions ported from Mynewt to NimBLE Porting Layer
#ifndef __LORA_TIMER_H__
#define __LORA_TIMER_H__

#include "nimble_npl.h"      //  For NimBLE Porting Layer (timer functions)

/// Initialise a timer. Based on https://mynewt.apache.org/latest/os/core_os/cputime/os_cputime.html#c.os_cputime_timer_init
void os_cputime_timer_init(
    struct ble_npl_callout *timer,   //  The timer to initialize. Cannot be NULL.
    ble_npl_event_fn *f,             //  The timer callback function. Cannot be NULL.
    void *arg);                      //  Pointer to data object to pass to timer.

/// Stops a timer from running.  Can be called even if timer is not running.
/// Based on https://mynewt.apache.org/latest/os/core_os/cputime/os_cputime.html#c.os_cputime_timer_stop
void os_cputime_timer_stop(
    struct ble_npl_callout *timer);  //  Pointer to timer to stop. Cannot be NULL.

/// Sets a timer that will expire ‘usecs’ microseconds from the current time.
/// NOTE: This must be called when the timer is stopped.
/// Based on https://mynewt.apache.org/latest/os/core_os/cputime/os_cputime.html#c.os_cputime_timer_relative
void os_cputime_timer_relative(
    struct ble_npl_callout *timer,   //  Pointer to timer. Cannot be NULL.
    uint32_t microsecs);             //  The number of microseconds from now at which the timer will expire.

#endif  //  __LORA_TIMER_H__
