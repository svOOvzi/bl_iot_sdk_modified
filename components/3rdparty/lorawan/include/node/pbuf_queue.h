//  Packet Buffer Queue. Based on mqueue (Mbuf Queue) from Mynewt OS:
//  https://github.com/apache/mynewt-core/blob/master/kernel/os/include/os/os_mbuf.h
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

#ifndef H_PBUF_QUEUE_
#define H_PBUF_QUEUE_

#include "lwip/pbuf.h"       //  For Lightweight IP Stack pbuf 
#include "nimble_npl.h"      //  For NimBLE Porting Layer (multitasking functions)
#include "node/bsd_queue.h"  //  For Queue Functions

/**
 * Structure representing a list of pbufs inside a pbuf_queue.
 * pbuf_list is stored in the header of the pbuf, before the LoRaWAN Header.
 */
struct pbuf_list {
    /**
     * Header length
     */
    u16_t header_len;
    /**
     * Payload length
     */
    u16_t payload_len;
    /**
     * Pointer to pbuf
     */
    struct pbuf *pb;    
    /**
     * Pointer to next node in the pbuf_list
     */
    STAILQ_ENTRY(pbuf_list) next;
};

/**
 * Structure representing a queue of pbufs.
 */
struct pbuf_queue {
    STAILQ_HEAD(, pbuf_list) mq_head;
    /** Event to post when new buffers are available on the queue. */
    struct ble_npl_event mq_ev;
};

/**
 * Initializes a pbuf_queue.  A pbuf_queue is a queue of pbufs that ties to a
 * particular task's event queue.  pbuf_queues form a helper API around a common
 * paradigm: wait on an event queue until at least one packet is available,
 * then process a queue of packets.
 *
 * When pbufs are available on the queue, an event OS_EVENT_T_MQUEUE_DATA
 * will be posted to the task's pbuf queue.
 *
 * @param mq                    The pbuf_queue to initialize
 * @param ev_cb                 The callback to associate with the pbuf_queue
 *                              event.  Typically, this callback pulls each
 *                              packet off the pbuf_queue and processes them.
 * @param arg                   The argument to associate with the pbuf_queue event.
 *
 * @return                      0 on success, non-zero on failure.
 */
int
pbuf_queue_init(struct pbuf_queue *mq, ble_npl_event_fn *ev_cb, void *arg);

/**
 * Remove and return a single pbuf from the pbuf queue.  Does not block.
 *
 * @param mq The pbuf queue to pull an element off of.
 *
 * @return The next pbuf in the queue, or NULL if queue has no pbufs.
 */
struct pbuf *
pbuf_queue_get(struct pbuf_queue *mq);

/**
 * Adds a packet (i.e. packet header pbuf) to a pbuf_queue. The event associated
 * with the pbuf_queue gets posted to the specified eventq.
 *
 * @param mq                    The pbuf queue to append the pbuf to.
 * @param evq                   The event queue to post an event to.
 * @param m                     The pbuf to append to the pbuf queue.
 *
 * @return 0 on success, non-zero on failure.
 */
int
pbuf_queue_put(struct pbuf_queue *mq, struct ble_npl_eventq *evq, struct pbuf *m);

/// Return the pbuf Packet Buffer header
void *get_pbuf_header(
    struct pbuf *buf,    //  pbuf Packet Buffer
    size_t header_size);  //  Size of header

#endif
