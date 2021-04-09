//  Lightweight IP Stack pbuf test. Based on https://github.com/willemwouters/ESP8266/wiki/UDP-Client---LWIP-Stack

/*
	lwip_init();
	struct udp_pcb * pUdpConnection = udp_new();
	char data[3] = { 0x00, 0x00, 0x00 };
	struct pbuf* b = pbuf_alloc(PBUF_TRANSPORT, 3, PBUF_RAM);
	os_memcpy (b->payload, data, 3);
	udp_sendto(pcb, b, IP_ADDR_BROADCAST, 9090);
	pbuf_free(b);
*/

//  Based on https://github.com/willemwouters/ESP8266/wiki/UDP-Server---LWIP-Stack

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
