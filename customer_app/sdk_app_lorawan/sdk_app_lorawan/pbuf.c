//  Lightweight IP Stack pbuf test. Based on 
//  https://github.com/willemwouters/ESP8266/wiki/UDP-Client---LWIP-Stack
//  https://github.com/willemwouters/ESP8266/wiki/UDP-Server---LWIP-Stack
#include <stdio.h>
#include <string.h>
#include <assert.h>
#include "lwip/init.h"  //  For Lightweight IP Stack Init
#include "lwip/pbuf.h"  //  For Lightweight IP Stack pbuf 
#include "demo.h"

/// Test pbuf Packet Buffer from Lightweight IP Stack.
/// We allocate a Packet Buffer, set the header and payload.
/// Then dump the header and payload.
void test_pbuf(char *buf0, int len0, int argc, char **argv)
{
    //  Header bytes to be set (3 bytes)
    uint8_t header[3] = { 0x11, 0x22, 0x33 };

    //  Payload bytes to be set (5 bytes)
    uint8_t payload[5] = { 0x01, 0x02, 0x03, 0x04, 0x05 };

    //  Init LWIP Buffer Pool
    lwip_init();

    //  Allocate a pbuf Packet Buffer
    struct pbuf *buf = pbuf_alloc(
        PBUF_TRANSPORT,   //  Buffer will include UDP Transport Header
        sizeof(payload),  //  Payload size
        PBUF_RAM          //  Allocate a single block of RAM
    );                    //  TODO: Switch to pooled memory (PBUF_POOL), which is more efficient
    assert(buf != NULL);

    //  Payload pointer now points to the payload.
    printf("Before Shift: Packet buffer addr=%p, payload=%p, len=%d, tot_len=%d\r\n", buf, buf->payload, buf->len, buf->tot_len);

    //  Shift the pbuf payload pointer BACKWARD 
    //  to accommodate the header (3 bytes).
    u8_t rc = pbuf_add_header(buf, sizeof(header));
    assert(rc == 0);
    printf("After Shift:  Packet buffer addr=%p, payload=%p, len=%d, tot_len=%d\r\n", buf, buf->payload, buf->len, buf->tot_len);

    //  Payload pointer now points to the header.
    //  We set the header in the pbuf.
    printf("Set header\r\n");
    memcpy(buf->payload, header, sizeof(header));

    //  Shift the pbuf payload pointer FORWARD 
    //  to skip the header (3 bytes).
    rc = pbuf_remove_header(buf, sizeof(header));
    assert(rc == 0);
    printf("Undo Shift:   Packet buffer addr=%p, payload=%p, len=%d, tot_len=%d\r\n", buf, buf->payload, buf->len, buf->tot_len);

    //  Payload pointer now points to the payload.
    //  We set the payload in the pbuf.
    printf("Set payload\r\n");
    memcpy(buf->payload, payload, sizeof(payload));

    //  Now we dump the header and payload
    //  by shifting the payload pointer.
    printf("Dumping header and payload...\r\n");

    //  Shift the pbuf payload pointer BACKWARD (3 bytes)
    //  to locate the header.
    rc = pbuf_add_header(buf, sizeof(header));
    assert(rc == 0);

    //  Dump the header
    printf("Packet buffer header: \r\n");
    uint8_t *p = buf->payload;   //  Get the header
    int len = sizeof(header);  //  Header is always fixed size
    for (int i = 0; i < len; i++) {
        printf("%02x ", p[i]);
    }
    printf("\r\n");
    //  Should show the header: 0x11, 0x22, 0x33

    //  Shift the pbuf payload pointer FORWARD (3 bytes)
    //  to locate the payload.
    rc = pbuf_remove_header(buf, sizeof(header));
    assert(rc == 0);

    //  Dump the payload
    printf("Packet buffer payload: \r\n");
    p = buf->payload;  //  Get the payload
    len = buf->len;    //  Payload size is variable
    for (int i = 0; i < len; i++) {
        printf("%02x ", p[i]);
    }
    printf("\r\n");
    //  Should show the payload: 0x01, 0x02, 0x03, 0x04, 0x05

    //  Free the pbuf
    pbuf_free(buf);
}

typedef enum eLoRaMacEventInfoStatus
{
    /*!
     * Service performed successfully
     */
    LORAMAC_EVENT_INFO_STATUS_OK = 0,
    /*!
     * An error occurred during the execution of the service
     */
    LORAMAC_EVENT_INFO_STATUS_ERROR,
    /*!
     * A Tx timeout occurred
     */
    LORAMAC_EVENT_INFO_STATUS_TX_TIMEOUT,
    /*!
     * An Rx timeout occurred on receive window 1
     */
    LORAMAC_EVENT_INFO_STATUS_RX1_TIMEOUT,
    /*!
     * An Rx timeout occurred on receive window 2
     */
    LORAMAC_EVENT_INFO_STATUS_RX2_TIMEOUT,
    /*!
     * An Rx error occurred on receive window 1
     */
    LORAMAC_EVENT_INFO_STATUS_RX1_ERROR,
    /*!
     * An Rx error occurred on receive window 2
     */
    LORAMAC_EVENT_INFO_STATUS_RX2_ERROR,
    /*!
     * An error occurred in the join procedure
     */
    LORAMAC_EVENT_INFO_STATUS_JOIN_FAIL,
    /*!
     * A frame with an invalid downlink counter was received. The
     * downlink counter of the frame was equal to the local copy
     * of the downlink counter of the node.
     */
    LORAMAC_EVENT_INFO_STATUS_DOWNLINK_REPEATED,
    /*!
     * The MAC could not retransmit a frame since the MAC decreased the datarate. The
     * payload size is not applicable for the datarate.
     */
    LORAMAC_EVENT_INFO_STATUS_TX_DR_PAYLOAD_SIZE_ERROR,
    /*!
     * The node has lost MAX_FCNT_GAP or more frames.
     */
    LORAMAC_EVENT_INFO_STATUS_DOWNLINK_TOO_MANY_FRAMES_LOSS,
    /*!
     * An address error occurred
     */
    LORAMAC_EVENT_INFO_STATUS_ADDRESS_FAIL,
    /*!
     * message integrity check failure
     */
    LORAMAC_EVENT_INFO_STATUS_MIC_FAIL,
    /*!
     * No network joined
     */
    LORAMAC_EVENT_INFO_STATUS_NO_NETWORK_JOINED,
    /*!
     * Maximum number of frame retries attempted with no ack
     */
    LORAMAC_EVENT_INFO_STATUS_TX_RETRIES_EXCEEDED,
}LoRaMacEventInfoStatus_t;

/* Received packet information */
struct lora_rx_info
{
    /*!
     * Downlink datarate
     */
    uint8_t rxdatarate;

    /*!
     * Snr of the received packet
     */
    uint8_t snr;

    /*!
     * Frame pending status
     */
    uint8_t frame_pending: 1;

    /*!
     * Receive window
     *
     * [0: Rx window 1, 1: Rx window 2, 2: class C only. Not 1 or 2]
     */
    uint8_t rxslot: 2;

    /*!
     * Set if an acknowledgement was received
     */
    uint8_t ack_rxd: 1;

    /*!
     * Indicates, if data is available
     */
    uint8_t rxdata: 1;

    /*!
     * Multicast
     */
    uint8_t multicast: 1;

    /*!
     * Rssi of the received packet
     */
    int16_t rssi;

    /*!
     * The downlink counter value for the received frame
     */
    uint32_t downlink_cntr;
};

/* Transmitted packet information */
struct lora_txd_info
{
    /*!
     * Uplink datarate
     */
    uint8_t datarate;

    /*!
     * Transmission power
     */
    int8_t txpower;

    /*!
     * Initially, 'retries' for confirmed frames is the number of trials
     * (described below). In the confirmation, this field is set to the
     * actual # of retries (0 retries if successful on first attempt).
     *
     * Number of trials to transmit the frame, if the LoRaMAC layer did not
     * receive an acknowledgment. The MAC performs a datarate adaptation,
     * according to the LoRaWAN Specification V1.0.1, chapter 19.4, according
     * to the following table:
     *
     * Transmission nb | Data Rate
     * ----------------|-----------
     * 1 (first)       | DR
     * 2               | DR
     * 3               | max(DR-1,0)
     * 4               | max(DR-1,0)
     * 5               | max(DR-2,0)
     * 6               | max(DR-2,0)
     * 7               | max(DR-3,0)
     * 8               | max(DR-3,0)
     *
     * Note, that if NbTrials is set to 1 or 2, the MAC will not decrease
     * the datarate, in case the LoRaMAC layer did not receive an acknowledgment
     */
    uint8_t retries;

    /*!
     * Set if an acknowledgement was received
     */
    uint8_t ack_rxd: 1;

    /*!
     * The transmission time on air of the frame (in msecs)
     */
    uint32_t tx_time_on_air;

    /*!
     * The uplink counter value related to the frame
     */
    uint32_t uplink_cntr;

    /*!
     * The uplink channel related to the frame
     */
    uint32_t uplink_chan;
};

struct lora_pkt_info
{
    uint8_t port;
    uint8_t pkt_type;
    LoRaMacEventInfoStatus_t status;

    union {
        struct lora_rx_info rxdinfo;
        struct lora_txd_info txdinfo;
    };
};

/// Same as test_pbuf, but with actual LoRaWAN Header and Payload sizes.
/// LoRaWAN Header Size = 20 bytes, Max Payload = 255 bytes
void test_pbuf2(char *buf0, int len0, int argc, char **argv)
{
    printf("Size=%d\r\n", sizeof(struct lora_pkt_info)); ////
    //  Header bytes to be set (LoRaWAN Header Size = 20 bytes)
    uint8_t header[20];  //  Will contain 0x00, 0x11, 0x22, 0x33, ...
    for (int i = 0; i < sizeof(header); i++) { header[i] = (i % 16) * 0x11; }

    //  Payload bytes to be set (LoRaWAN Max Payload = 255 bytes)
    uint8_t payload[255];  //  Will contain 0, 1, 2, 3, ...
    for (int i = 0; i < sizeof(payload); i++) { payload[i] = i; }

    //  Init LWIP Buffer Pool
    lwip_init();

    //  Allocate a pbuf Packet Buffer
    struct pbuf *buf = pbuf_alloc(
        PBUF_TRANSPORT,   //  Buffer will include UDP Transport Header
        sizeof(payload),  //  Payload size
        PBUF_RAM          //  Allocate a single block of RAM
    );                    //  TODO: Switch to pooled memory (PBUF_POOL), which is more efficient
    assert(buf != NULL);

    //  Payload pointer now points to the payload.
    printf("Before Shift: Packet buffer addr=%p, payload=%p, len=%d, tot_len=%d\r\n", buf, buf->payload, buf->len, buf->tot_len);

    //  Shift the pbuf payload pointer BACKWARD 
    //  to accommodate the header (3 bytes).
    u8_t rc = pbuf_add_header(buf, sizeof(header));
    assert(rc == 0);
    printf("After Shift:  Packet buffer addr=%p, payload=%p, len=%d, tot_len=%d\r\n", buf, buf->payload, buf->len, buf->tot_len);

    //  Payload pointer now points to the header.
    //  We set the header in the pbuf.
    printf("Set header\r\n");
    memcpy(buf->payload, header, sizeof(header));

    //  Shift the pbuf payload pointer FORWARD 
    //  to skip the header (3 bytes).
    rc = pbuf_remove_header(buf, sizeof(header));
    assert(rc == 0);
    printf("Undo Shift:   Packet buffer addr=%p, payload=%p, len=%d, tot_len=%d\r\n", buf, buf->payload, buf->len, buf->tot_len);

    //  Payload pointer now points to the payload.
    //  We set the payload in the pbuf.
    printf("Set payload\r\n");
    memcpy(buf->payload, payload, sizeof(payload));

    //  Now we dump the header and payload
    //  by shifting the payload pointer.
    printf("Dumping header and payload...\r\n");

    //  Shift the pbuf payload pointer BACKWARD (3 bytes)
    //  to locate the header.
    rc = pbuf_add_header(buf, sizeof(header));
    assert(rc == 0);

    //  Dump the header
    printf("Packet buffer header: \r\n");
    uint8_t *p = buf->payload;   //  Get the header
    int len = sizeof(header);  //  Header is always fixed size
    for (int i = 0; i < len; i++) {
        printf("%02x ", p[i]);
    }
    printf("\r\n");
    //  Should show the header: 0x11, 0x22, 0x33

    //  Shift the pbuf payload pointer FORWARD (3 bytes)
    //  to locate the payload.
    rc = pbuf_remove_header(buf, sizeof(header));
    assert(rc == 0);

    //  Dump the payload
    printf("Packet buffer payload: \r\n");
    p = buf->payload;  //  Get the payload
    len = buf->len;    //  Payload size is variable
    for (int i = 0; i < len; i++) {
        printf("%02x ", p[i]);
    }
    printf("\r\n");
    //  Should show the payload: 0x01, 0x02, 0x03, 0x04, 0x05

    //  Free the pbuf
    pbuf_free(buf);
}

#ifdef NOTUSED
Output Log:

# test_pbuf
-------------------->>>>>>>> LWIP tcp_port 57705
Before Shift: Packet buffer addr=0x42030008, payload=0x420300d0, len=5, tot_len=5
After Shift:  Packet buffer addr=0x42030008, payload=0x420300cd, len=8, tot_len=8
Set header
Undo Shift:   Packet buffer addr=0x42030008, payload=0x420300d0, len=5, tot_len=5
Set payload
Dumping header and payload...
Packet buffer header: 
11 22 33 
Packet buffer payload: 
01 02 03 04 05 

#endif  //  NOTUSED
