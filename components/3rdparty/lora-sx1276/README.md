# BL602 LoRa Driver for Semtech SX1276 / HopeRF RF96

Ported from Apache Mynewt OS to BL602...

https://github.com/apache/mynewt-core/tree/master/hw/drivers/lora/sx1276

Read the articles...

- ["Connect PineCone BL602 to LoRa Transceiver"](https://lupyuen.github.io/articles/lora)

- ["PineCone BL602 RISC-V Board Receives LoRa Packets"](https://lupyuen.github.io/articles/lora2)

# Demo Firmware

To transmit and receive LoRa packets with the driver, run the `sdk_app_lora` BL602 Demo Firmware...

- [`sdk_app_lora`: BL602 Demo Firmware for LoRa SX1262 / SX1276 ](../../../customer_app/sdk_app_lora)

Here's a sample log...

```text
# create_task

# init_driver
SX1276 init
SX1276 interrupt init
SX1276 register handler: GPIO 11
SX1276 register handler: GPIO 0
SX126 register handler: GPIO 5
SX1276 register handler: GPIO 12
TODO: os_cputime_delay_usecs 1000
TODO: os_cputime_delay_usecs 6000

# 
SX1276 DIO3: Channel activity detection

# receive_message

# 
SX1276 DIO0: Packet received
Rx done: RadioEvents.RxDone=0x23000ca6
Rx done: 
48 65 6c 6c 6f 

# spi_result
DIO0 Interrupts: 1
DIO1 Interrupts: 0
DIO2 Interrupts: 0
DIO3 Interrupts: 1
DIO4 Interrupts: 0
DIO5 Interrupts: 0
Unknown Int:     0
Tx Interrupts:   302
Tx Status:       0x0
Tx Term Count:   0x0
Tx Error:        0x0
Rx Interrupts:   302
Rx Status:       0x0
Rx Term Count:   0x0
Rx Error:        0x0

# receive_message

# 
SX1276 DIO0: Packet received
Rx done: RadioEvents.RxDone=0x23000ca6
Rx done: 
48 65 6c 6c 6f 

# spi_result
DIO0 Interrupts: 2
DIO1 Interrupts: 0
DIO2 Interrupts: 0
DIO3 Interrupts: 1
DIO4 Interrupts: 0
DIO5 Interrupts: 0
Unknown Int:     0
Tx Interrupts:   354
Tx Status:       0x0
Tx Term Count:   0x0
Tx Error:        0x0
Rx Interrupts:   354
Rx Status:       0x0
Rx Term Count:   0x0
Rx Error:        0x0

# receive_message

# 
SX1276 DIO0: Packet received
Rx done: RadioEvents.RxDone=0x23000ca6
Rx done: 
48 65 6c 6c 6f 

# spi_result
DIO0 Interrupts: 3
DIO1 Interrupts: 0
DIO2 Interrupts: 0
DIO3 Interrupts: 1
DIO4 Interrupts: 0
DIO5 Interrupts: 0
Unknown Int:     0
Tx Interrupts:   406
Tx Status:       0x0
Tx Term Count:   0x0
Tx Error:        0x0
Rx Interrupts:   406
Rx Status:       0x0
Rx Term Count:   0x0
Rx Error:        0x0

# receive_message

# 
SX1276 DIO0: Packet received
Rx done: RadioEvents.RxDone=0x23000ca6
Rx done: 
48 65 6c 6c 6f 

# spi_result
DIO0 Interrupts: 4
DIO1 Interrupts: 0
DIO2 Interrupts: 0
DIO3 Interrupts: 1
DIO4 Interrupts: 0
DIO5 Interrupts: 0
Unknown Int:     0
Tx Interrupts:   458
Tx Status:       0x0
Tx Term Count:   0x0
Tx Error:        0x0
Rx Interrupts:   458
Rx Status:       0x0
Rx Term Count:   0x0
Rx Error:        0x0

# receive_message

# 
SX1276 receive timeout
Rx timeout

# 
# receive_message

# 
SX1276 DIO0: Packet received
Rx done: RadioEvents.RxDone=0x23000ca8
Rx done: 
48 65 6c 6c 6f 

# 
# receive_message

# 
SX1276 DIO0: Packet received
Rx done: RadioEvents.RxDone=0x23000ca8
Rx done: 
48 65 6c 6c 6f 

# 
# receive_message

# 
SX1276 receive timeout
Rx timeout

# receive_message

# 
SX1276 DIO0: Packet received
Rx done: RadioEvents.RxDone=0x23000ca8
Rx done: 
48 65 6c 6c 6f 
```
