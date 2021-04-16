# BL602 LoRa Driver for Semtech SX1262 / HopeRF RFM90 (Pine64 RFM90 LoRa Module)

Ported from Semtech's Reference Implementation of SX1262 Driver...

https://github.com/Lora-net/LoRaMac-node/tree/master/src/radio/sx126x

The porting of the driver to BL602 is explained in this Twitter Thread...

https://twitter.com/MisterTechBlog/status/1381870711124369413

The design of the SX1262 Driver is similar to the SX1276 Driver, which is explained in these articles...

- ["Connect PineCone BL602 to LoRa Transceiver"](https://lupyuen.github.io/articles/lora)

- ["PineCone BL602 RISC-V Board Receives LoRa Packets"](https://lupyuen.github.io/articles/lora2)

# Demo Firmware

To transmit and receive LoRa packets with the driver, run the `sdk_app_lora` BL602 Demo Firmware...

- [`sdk_app_lora`: BL602 Demo Firmware for LoRa SX1262 / SX1276 ](../../../customer_app/README.md)

Here's a sample log...

```text
# create_task

# init_driver
SX126xReset
SX126xIoInit
SX126X interrupt init
SX126X register handler: GPIO 11
SX126xWakeup
SX126xGetDeviceId: SX1262
SX126xSetRfTxPower
SX126xGetDeviceId: SX1262

# send_message

# RadioOnDioIrq
RadioIrqProcess
SX126xReadCommand
IRQ_TX_DONE
Tx done

# send_message
SX126xWakeup

# RadioOnDioIrq
RadioIrqProcess
SX126xReadCommand
IRQ_TX_DONE
Tx done

# send_message
SX126xWakeup

# RadioOnDioIrq
RadioIrqProcess
SX126xReadCommand
IRQ_TX_DONE
Tx done

# 
# receive_message
SX126xWakeup

# RadioOnDioIrq
RadioIrqProcess
SX126xReadCommand
IRQ_PREAMBLE_DETECTED
RadioOnDioIrq
RadioIrqProcess
SX126xReadCommand
IRQ_HEADER_VALID
RadioOnDioIrq
RadioIrqProcess
SX126xReadCommand
IRQ_RX_DONE
SX126xReadCommand
SX126xReadCommand
Rx done: 
48 65 6c 6c 6f 00 01 02 03 04 05 06 07 08 09 0a 0b 0c 0d 0e 0f 10 11 12 13 14 15 16 17 18 19 1a 1b 1c 1d 1e 1f 20 21 22 23 24 25 26 27 28 29 2a 2b 2c 2d 2e 2f 30 31 32 33 34 35 36 37 38 39 3a 

# receive_message
SX126xWakeup

# RadioOnDioIrq
RadioIrqProcess
SX126xReadCommand
IRQ_PREAMBLE_DETECTED
RadioOnDioIrq
RadioIrqProcess
SX126xReadCommand
IRQ_HEADER_VALID
RadioOnDioIrq
RadioIrqProcess
SX126xReadCommand
IRQ_RX_DONE
SX126xReadCommand
SX126xReadCommand
Rx done: 
48 65 6c 6c 6f 00 01 02 03 04 05 06 07 08 09 0a 0b 0c 0d 0e 0f 10 11 12 13 14 15 16 17 18 19 1a 1b 1c 1d 1e 1f 20 21 22 23 24 25 26 27 28 29 2a 2b 2c 2d 2e 2f 30 31 32 33 34 35 36 37 38 39 3a 

# receive_message
SX126xWakeup

# RadioOnDioIrq
RadioIrqProcess
SX126xReadCommand
IRQ_PREAMBLE_DETECTED
RadioOnDioIrq
RadioIrqProcess
SX126xReadCommand
IRQ_HEADER_VALID
RadioOnDioIrq
RadioIrqProcess
SX126xReadCommand
IRQ_RX_DONE
SX126xReadCommand
SX126xReadCommand
Rx done: 
48 65 6c 6c 6f 00 01 02 03 04 05 06 07 08 09 0a 0b 0c 0d 0e 0f 10 11 12 13 14 15 16 17 18 19 1a 1b 1c 1d 1e 1f 20 21 22 23 24 25 26 27 28 29 2a 2b 2c 2d 2e 2f 30 31 32 33 34 35 36 37 38 39 3a 

# 
```