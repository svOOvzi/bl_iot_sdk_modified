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
    //  TODO: Move this to startup function
    lwip_init();

    //  Allocate a pbuf Packet Buffer
    struct pbuf *buf = pbuf_alloc(
        PBUF_TRANSPORT,   //  Buffer will include 182-byte transport header
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

/// Test pbuf Packet Buffer from Lightweight IP Stack.
/// We allocate a Packet Buffer, set the header and payload.
/// Then dump the header and payload.
/// This time we use actual LoRaWAN Header and Payload sizes.
/// LoRaWAN Header Size = 20 bytes, Max Payload = 255 bytes
void test_pbuf2(char *buf0, int len0, int argc, char **argv)
{
    //  Header bytes to be set (LoRaWAN Header Size = 20 bytes)
    uint8_t header[20];  //  Will contain 0x00, 0x11, 0x22, 0x33, ...
    for (int i = 0; i < sizeof(header); i++) { header[i] = (i % 16) * 0x11; }

    //  Payload bytes to be set (LoRaWAN Max Payload = 255 bytes)
    uint8_t payload[255];  //  Will contain 0, 1, 2, 3, ...
    for (int i = 0; i < sizeof(payload); i++) { payload[i] = i; }

    //  Init LWIP Buffer Pool
    //  TODO: Move this to startup function
    lwip_init();

    //  Allocate a pbuf Packet Buffer
    struct pbuf *buf = pbuf_alloc(
        PBUF_TRANSPORT,   //  Buffer will include 182-byte transport header
        sizeof(payload),  //  Payload size
        PBUF_RAM          //  Allocate a single block of RAM
    );                    //  TODO: Switch to pooled memory (PBUF_POOL), which is more efficient
    assert(buf != NULL);

    //  Payload pointer now points to the payload.
    printf("Before Shift: Packet buffer addr=%p, payload=%p, len=%d, tot_len=%d\r\n", buf, buf->payload, buf->len, buf->tot_len);

    //  Shift the pbuf payload pointer BACKWARD 
    //  to accommodate the header (20 bytes).
    u8_t rc = pbuf_add_header(buf, sizeof(header));
    assert(rc == 0);
    printf("After Shift:  Packet buffer addr=%p, payload=%p, len=%d, tot_len=%d\r\n", buf, buf->payload, buf->len, buf->tot_len);

    //  Payload pointer now points to the header.
    //  We set the header in the pbuf.
    printf("Set header\r\n");
    memcpy(buf->payload, header, sizeof(header));

    //  Shift the pbuf payload pointer FORWARD 
    //  to skip the header (20 bytes).
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

    //  Shift the pbuf payload pointer BACKWARD (20 bytes)
    //  to locate the header.
    rc = pbuf_add_header(buf, sizeof(header));
    assert(rc == 0);

    //  Dump the header
    printf("Packet buffer header: \r\n");
    uint8_t *p = buf->payload;   //  Get the header
    int len = sizeof(header);    //  Header is always fixed size
    for (int i = 0; i < len; i++) {
        printf("%02x ", p[i]);
    }
    printf("\r\n");
    //  Should show the header: 0x11, 0x22, 0x33

    //  Shift the pbuf payload pointer FORWARD (20 bytes)
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

# test_pbuf2
Size=20
-------------------->>>>>>>> LWIP tcp_port 61397
Before Shift: Packet buffer addr=0x42030008, payload=0x420300d0, len=255, tot_len=255
After Shift:  Packet buffer addr=0x42030008, payload=0x420300bc, len=275, tot_len=275
Set header
Undo Shift:   Packet buffer addr=0x42030008, payload=0x420300d0, len=255, tot_len=255
Set payload
Dumping header and payload...
Packet buffer header: 
00 11 22 33 44 55 66 77 88 99 aa bb cc dd ee ff 00 11 22 33 
Packet buffer payload: 
00 01 02 03 04 05 06 07 08 09 0a 0b 0c 0d 0e 0f 10 11 12 13 14 15 16 17 18 19 1a 1b 1c 1d 1e 1f 20 21 22 23 24 25 26 27 28 29 2a 2b 2c 2d 2e 2f 30 31 32 33 34 35 36 37 38 39 3a 3b 3c 3d 3e 3f 40 41 42 43 44 45 46 47 48 49 4a 4b 4c 4d 4e 4f 50 51 52 53 54 55 56 57 58 59 5a 5b 5c 5d 5e 5f 60 61 62 63 64 65 66 67 68 69 6a 6b 6c 6d 6e 6f 70 71 72 73 74 75 76 77 78 79 7a 7b 7c 7d 7e 7f 80 81 82 83 84 85 86 87 88 89 8a 8b 8c 8d 8e 8f 90 91 92 93 94 95 96 97 98 99 9a 9b 9c 9d 9e 9f a0 a1 a2 a3 a4 a5 a6 a7 a8 a9 aa ab ac ad ae af b0 b1 b2 b3 b4 b5 b6 b7 b8 b9 ba bb bc bd be bf c0 c1 c2 c3 c4 c5 c6 c7 c8 c9 ca cb cc cd ce cf d0 d1 d2 d3 d4 d5 d6 d7 d8 d9 da db dc dd de df e0 e1 e2 e3 e4 e5 e6 e7 e8 e9 ea eb ec ed ee ef f0 f1 f2 f3 f4 f5 f6 f7 f8 f9 fa fb fc fd fe 

#endif  //  NOTUSED
