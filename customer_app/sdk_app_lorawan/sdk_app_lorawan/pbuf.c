//  Lightweight IP Stack pbuf test. Based on 
//  https://github.com/willemwouters/ESP8266/wiki/UDP-Client---LWIP-Stack
//  https://github.com/willemwouters/ESP8266/wiki/UDP-Server---LWIP-Stack
#include <stdio.h>
#include <string.h>
#include <assert.h>
#include "lwip/init.h"  //  For Lightweight IP Stack Init
#include "lwip/pbuf.h"  //  For Lightweight IP Stack pbuf 
#include "demo.h"

/// Test pbuf Packet Buffer from LWIP
void test_pbuf(char *buf0, int len0, int argc, char **argv)
{
	//  Payload to be set
	uint8_t payload[3] = { 0x01, 0x02, 0x03 };

	//  Init LWIP Buffer Pool
	lwip_init();

	//  Create a pbuf Packet Buffer
	struct pbuf *buf = pbuf_alloc(
		PBUF_TRANSPORT,   //  Buffer will include UDP Transport Header
		sizeof(payload),  //  Payload size
		PBUF_RAM          //  Allocate a single block of RAM
	);                    //  TODO: Switch to pooled memory (PBUF_POOL), which is more efficient
	assert(buf != NULL);

	//  Set header in the pbuf
	uint8_t header[3] = { 0x11, 0x22, 0x33 };

	//  Set payload in the pbuf
	memcpy(buf->payload, payload, sizeof(payload));

	//  Dump the pbuf
	int header_len = ((void *) buf->payload) - ((void *) buf);
	printf("Packet buffer addr=%p, payload=%p, header_len=%d\r\n", buf, buf->payload, header_len);

	//  Dump the header
    printf("Packet buffer header\r\n");
	uint8_t *p = (uint8_t *) buf;
    for (int i = 0; i < header_len; i++) {
        printf("%02x ", p[i]);
    }
    printf("\r\n");

	//  Dump the payload
    printf("Packet buffer payload: \r\n");
	p = buf->payload;
    for (int i = 0; i < buf->len; i++) {
        printf("%02x ", p[i]);
    }
    printf("\r\n");

	//  Free the pbuf
	pbuf_free(buf);
}

/*
	lwip_init();
	struct udp_pcb * pUdpConnection = udp_new();
	char data[3] = { 0x00, 0x00, 0x00 };
	struct pbuf* b = pbuf_alloc(PBUF_TRANSPORT, 3, PBUF_RAM);
	os_memcpy (b->payload, data, 3);
	udp_sendto(pcb, b, IP_ADDR_BROADCAST, 9090);
	pbuf_free(b);
*/

/*
	#include "lwipopts.h"
	#include "lwip/sockets.h"
	#include "lwip/ip_addr.h"
	#include "lwip/init.h"
	#include "lwip/netif.h"
	#include "lwip/igmp.h"
	#include "lwip/udp.h"	

	void ICACHE_FLASH_ATTR handle_udp_recv(void *arg, struct udp_pcb *pcb, struct pbuf *p,  ip_addr_t *addr, u16_t port) {
		int length = p->len;
		char * pusrdata = p->payload;
		os_printf("Received udp data: %s \r\n", pusrdata);
		pbuf_free(p);
	}

	void init_udp() {
		struct ip_addr ipSend;
		lwip_init();
		struct udp_pcb * pUdpConnection = udp_new();
		IP4_ADDR(&ipSend, 255, 255, 255, 255);
		pUdpConnection->multicast_ip = ipSend;
		pUdpConnection->remote_ip = ipSend;
		pUdpConnection->remote_port = 8080;
		if(pUdpConnection == NULL) {
			os_printf("\nCould not create new udp socket... \n");
		}
		err = udp_bind(pUdpConnection, IP_ADDR_ANY, 8080);
		udp_recv(pUdpConnection, handle_udp_recv, pUdpConnection);
	}
*/
