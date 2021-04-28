# LoRaWAN Firmware for BL602

LoRaWAN Firmware with command-line interface, ported from to BL602 from Apache Mynewt OS...

https://mynewt.apache.org/latest/tutorials/lora/lorawanapp.html

https://github.com/apache/mynewt-core/tree/master/apps/lora_app_shell

This firmware calls the LoRaWAN Driver...

- [`lorawan`: BL602 LoRaWAN Driver](../../components/3rdparty/lorawan)

And the Semtech SX1262 Driver...

- [`lora-sx1262`: Semtech SX1262 Driver](../../components/3rdparty/lora-sx1262)

Follow the updates in this Twitter Thread...

https://twitter.com/MisterTechBlog/status/1379926160377851910

Read the (upcoming) article...

https://lupyuen.github.io/articles/lorawan

What is LoRaWAN? See this...

https://lupyuen.github.io/articles/lora2

# LoRaWAN Commands

```text
#  Start LoRa background task
create_task

#  Init LoRaWAN driver
init_lorawan

#  Device EUI: Copy from ChirpStack: Applications -> app -> Device EUI
las_wr_dev_eui 0x4b:0xc1:0x5e:0xe7:0x37:0x7b:0xb1:0x5b

#  App EUI: Not needed for ChirpStack, set to default 0000000000000000
las_wr_app_eui 0x00:0x00:0x00:0x00:0x00:0x00:0x00:0x00

#  App Key: Copy from ChirpStack: Applications -> app -> Devices -> device_otaa_class_a -> Keys (OTAA) -> Application Key
las_wr_app_key 0xaa:0xff:0xad:0x5c:0x7e:0x87:0xf6:0x4d:0xe3:0xf0:0x87:0x32:0xfc:0x1d:0xd2:0x5d

#  Join LoRaWAN network, try 10 times
las_join 10

#  Open LoRaWAN port 1
las_app_port open 1

#  Send data to LoRaWAN port 1, 5 bytes, unconfirmed (0)
las_app_tx 1 5 0
```

# Output Log

```text
# create_task

# init_lorawan
lora_node_init
pbuf_queue_init
pbuf_queue_init
pbuf_queue_init
SX126xReset
SX126xIoInit
SX126X interrupt init
SX126X register handler: GPIO 11
SX126xWakeup
SX126xGetDeviceId: SX1262
RadioSetModem
RadioSleep

# las_wr_dev_eui 0x4b:0xc1:0x5e:0xe7:0x37:0x7b:0xb1:0x5b

# las_wr_app_eui 0x00:0x00:0x00:0x00:0x00:0x00:0x00:0x00

# las_wr_app_key 0xaa:0xff:0xad:0x5c:0x7e:0x87:0xf6:0x4d:0xe3:0xf0:0x87:0x32:0xfc:0x1d:0xd2:0x5d

# las_join 1
lora_node_join: joined=8
lora_node_join: joining network
Attempting to join...

lora_mac_join_event
LoRaMacMlmeRequest
Send
RadioSetModem
SX126xWakeup
ScheduleTx
CalculateBackOff
RegionNextChannel
RegionAS923NextChannel
RegionAS923NextChannel: channel=1
RegionComputeRxWindowParameters
RegionComputeRxWindowParameters
lora_mac_rx_disable
TODO: Radio.RxDisable
SendFrameOnChannel: channel=1
RegionTxConfig
RegionAS923TxConfig
RadioSetChannel: freq=923400000
RadioStandby
RadioSetModem
SX126xSetRfTxPower
SX126xGetDeviceId: SX1262
SendFrameOnChannel: power=0
SendFrameOnChannel: txi is null, skipping log
RadioSend: size=23
00 00 00 00 00 00 00 00 00 5b b1 7b 37 e7 5e c1 4b 6c 28 39 48 f1 7a 
lora_mac_join_event: OK
RadioOnDioIrq
RadioIrqProcess
SX126xReadCommand
IRQ_TX_DONE
OnRadioTxDone
RadioSleep

OnRxWindow1TimerEvent
RadioSetChannel: freq=923400000
SX126xWakeup
RadioSetRxConfig
RadioStandby
RadioSetModem
RadioSetRxConfig done
RadioRx
RadioOnDioIrq
RadioIrqProcess
SX126xReadCommand
IRQ_RX_TX_TIMEOUT
OnRadioRxTimeout
RadioSleep

OnRxWindow2TimerEvent
RadioSetChannel: freq=923200000
SX126xWakeup
RadioSetRxConfig
RadioStandby
RadioSetModem
RadioSetRxConfig done
RadioRx
RadioOnDioIrq
RadioIrqProcess
SX126xReadCommand
IRQ_RX_TX_TIMEOUT
OnRadioRxTimeout
RadioSleep
lora_node_chk_txq
lora_mac_proc_tx_q_even

# las_join 1
lora_node_join: joined=8
lora_node_join: joining network
Attempting to join...

lora_mac_join_event
LoRaMacMlmeRequest
Send
RadioSetModem
SX126xWakeup
ScheduleTx
CalculateBackOff
RegionNextChannel
RegionAS923NextChannel
RegionAS923NextChannel: channel=1
RegionComputeRxWindowParameters
RegionComputeRxWindowParameters
lora_mac_rx_disable
TODO: Radio.RxDisable
SendFrameOnChannel: channel=1
RegionTxConfig
RegionAS923TxConfig
RadioSetChannel: freq=923400000
RadioStandby
RadioSetModem
SX126xSetRfTxPower
SX126xGetDeviceId: SX1262
SendFrameOnChannel: power=0
SendFrameOnChannel: txi is null, skipping log
RadioSend: size=23
00 00 00 00 00 00 00 00 00 5b b1 7b 37 e7 5e c1 4b d1 42 68 db 79 69 
lora_mac_join_event: OK
RadioOnDioIrq
RadioIrqProcess
SX126xRadCommand
IRQ_TX_DONE
OnRadioTxDone
RadioSleep

OnRxWindow1TimerEvent
RadioSetChannel: freq=923400000
SX126xWakeup
RadioSetRxConfig
RadioStandby
RadioSetModem
RadioSetRxConfig done
RadioRx
RadioOnDioIrq
RadioIrqProcess
SX126xReadCommand
IRQ_RX_TX_TIMEOUT
OnRadioRxTimeout
RadioSleep

OnRxWindow2TimerEvent
RadioSetChannel: freq=923200000
SX126xWakeup
RadioSetRxConfig
RadioStandby
RadioSetModem
RadioSetRxConfig done
RadioRx
RadioOnDioIrq
RadioIrqProcess
SX126xReadCommand
IRQ_RX_TX_TIMEOUT
OnRadioRxTimeout
RadioSleep
lora_node_chk_txq
lora_mac_proc_tx_q_event

# las_join 1
lora_node_join: joined=8
lora_node_join: joining network
Attempting to join...

lora_mac_join_event
LoRaMacMlmeRequest
Send
RadioSetModem
SX126xWakeup
ScheduleTx
CalculateBackOff
RegionNextChannel
RegionAS923NextChannel
RegionAS923NextChannel: channel=0
RegionComputeRxWindowParameters
RegionComputeRxWindowParameters
lora_mac_rx_disable
TODO: Radio.RxDisable
SendFrameOnChannel: channel=0
RegionTxConfig
RegionAS923TxConfig
RadioSetChannel: freq=923200000
RadioStandby
RadioSetModem
SX126xSetRfTxPower
SX126xGetDeviceId: SX1262
SendFrameOnChannel: power=0
SendFrameOnChannel: txi is null, skipping log
RadioSend: size=23
00 00 00 00 00 00 00 00 00 5b b1 7b 37 e7 5e c1 4b e8 8d 36 3c 8e e8 
lora_mac_join_event: OK
RadioOnDioIrq
RadioIrqProcess
SX126xReadCommand
IRQ_TX_DONE
OnRadioTxDone
RadioSleep

OnRxWindow1TimerEvent
RadioSetChannel: freq=923200000
SX126xWakeup
RadioSetRxConfig
RadioStandby
RadioSetModem
RadioSetRxConfig done
RadioRx
RadioOnDioIrq
RadioIrqProcess
SX126xReadCommand
IRQ_RX_TX_TIMEOUT
OnRadioRxTimeout
RadioSleep

OnRxWindow2TimerEvent
RadioSetChannel: freq=923200000
SX126xWakeup
RadioSetRxConfig
RadioStandby
RadioSetModem
RadioSetRxConfig done
RadioRx
RadioOnDioIrq
RadioIrqProcess
SX126xReadCommand
IRQ_RX_TX_TIMEOUT
OnRadioRxTimeout
RadioSleep
lora_node_chk_txq
lora_mac_proc_tx_q_event

```