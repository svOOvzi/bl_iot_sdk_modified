//  Packet Buffer Queue. Based on mqueue (Mbuf Queue) from Mynewt OS.
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

#include "lwip/pbuf.h"   //  For Lightweight IP Stack pbuf 
#include "nimble_npl.h"  //  For NimBLE Porting Layer (multitasking functions)

/**
 * Initializes a pbuf_queue.  A pbuf_queue is a queue of mbufs that ties to a
 * particular task's event queue.  pbuf_queues form a helper API around a common
 * paradigm: wait on an event queue until at least one packet is available,
 * then process a queue of packets.
 *
 * When mbufs are available on the queue, an event OS_EVENT_T_MQUEUE_DATA
 * will be posted to the task's mbuf queue.
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
pbuf_queue_init(struct pbuf_queue *mq, ble_npl_event_fn *ev_cb, void *arg)
{
    struct ble_npl_event *ev;

    STAILQ_INIT(&mq->mq_head);

    ev = &mq->mq_ev;
    memset(ev, 0, sizeof(*ev));
    ev->ev_cb = ev_cb;
    ev->ev_arg = arg;

    return (0);
}

/**
 * Remove and return a single mbuf from the mbuf queue.  Does not block.
 *
 * @param mq The mbuf queue to pull an element off of.
 *
 * @return The next mbuf in the queue, or NULL if queue has no mbufs.
 */
struct pbuf *
pbuf_queue_get(struct pbuf_queue *mq)
{
    struct pbuf *mp;
    struct pbuf *m;
    os_sr_t sr;

    OS_ENTER_CRITICAL(sr);
    mp = STAILQ_FIRST(&mq->mq_head);
    if (mp) {
        STAILQ_REMOVE_HEAD(&mq->mq_head, omp_next);
    }
    OS_EXIT_CRITICAL(sr);

    if (mp) {
        m = OS_MBUF_PKTHDR_TO_MBUF(mp);
    } else {
        m = NULL;
    }

    return (m);
}

/**
 * Adds a packet (i.e. packet header mbuf) to a pbuf_queue. The event associated
 * with the pbuf_queue gets posted to the specified eventq.
 *
 * @param mq                    The mbuf queue to append the mbuf to.
 * @param evq                   The event queue to post an event to.
 * @param m                     The mbuf to append to the mbuf queue.
 *
 * @return 0 on success, non-zero on failure.
 */
int
pbuf_queue_put(struct pbuf_queue *mq, struct ble_npl_eventq *evq, struct pbuf *m)
{
    struct pbuf *mp;
    os_sr_t sr;
    int rc;

    /* Can only place the head of a chained mbuf on the queue. */
    if (!OS_MBUF_IS_PKTHDR(m)) {
        rc = OS_EINVAL;
        goto err;
    }

    mp = OS_MBUF_PKTHDR(m);

    OS_ENTER_CRITICAL(sr);
    STAILQ_INSERT_TAIL(&mq->mq_head, mp, omp_next);
    OS_EXIT_CRITICAL(sr);

    /* Only post an event to the queue if its specified */
    if (evq) {
        ble_npl_eventq_put(evq, &mq->mq_ev);
    }

    return (0);
err:
    return (rc);
}
