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
