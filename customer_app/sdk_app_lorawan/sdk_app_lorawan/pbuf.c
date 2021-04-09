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
