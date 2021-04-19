//  Rename the NimBLE Porting Layer for BL602
/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */

#ifndef _NIMBLE_NPL_RENAME_H_
#define _NIMBLE_NPL_RENAME_H_

#define npl_event           ble_npl_event
#define npl_event_fn        ble_npl_event_fn
#define npl_error           ble_npl_error

/*
 * Generic
 */

#define os_started          ble_npl_os_started
#define get_current_task_id ble_npl_get_current_task_id

/*
 * Event queue
 */

#define eventq_init ble_npl_eventq_init

#define eventq_get ble_npl_eventq_get

#define eventq_put ble_npl_eventq_put

#define eventq_remove ble_npl_eventq_remove

#define event_init ble_npl_event_init

#define event_is_queued ble_npl_event_is_queued

#define event_get_arg ble_npl_event_get_arg

#define event_set_arg  ble_npl_event_set_arg

#define eventq_is_empty ble_npl_eventq_is_empty

#define event_run ble_npl_event_run

/*
 * Mutexes
 */

#define mutex_init ble_npl_mutex_init

#define mutex_pend ble_npl_mutex_pend

#define mutex_release ble_npl_mutex_release

/*
 * Semaphores
 */

#define sem_init ble_npl_sem_init

#define sem_pend ble_npl_sem_pend

#define sem_release ble_npl_sem_release

#define sem_get_count ble_npl_sem_get_count

/*
 * Callouts
 */

#define callout_init ble_npl_callout_init

#define callout_reset ble_npl_callout_reset

#define callout_stop ble_npl_callout_stop

#define callout_is_active ble_npl_callout_is_active

#define callout_get_ticks ble_npl_callout_get_ticks

#define callout_remaining_ticks ble_npl_callout_remaining_ticks

#define callout_set_arg ble_npl_callout_set_arg

/*
 * Time functions
 */

#define time_get ble_npl_time_get

#define time_ms_to_ticks ble_npl_time_ms_to_ticks

#define time_ticks_to_ms ble_npl_time_ticks_to_ms

#define time_ms_to_ticks32 ble_npl_time_ms_to_ticks32

#define time_ticks_to_ms32 ble_npl_time_ticks_to_ms32

#define time_delay ble_npl_time_delay

/*
 * Hardware-specific
 */

#define hw_set_isr ble_npl_hw_set_isr

#define hw_enter_critical ble_npl_hw_enter_critical

#define hw_exit_critical ble_npl_hw_exit_critical

#define hw_is_in_critical ble_npl_hw_is_in_critical

#ifdef __cplusplus
}
#endif

#endif  /* _NIMBLE_NPL_RENAME_H_ */
