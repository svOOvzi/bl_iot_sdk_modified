# LoRaWAN Firmware for PineDio Stack BL604

Based on [`sdk_app_lorawan`](../sdk_app_lorawan)

LoRaWAN Firmware with command-line interface, ported to BL602 from Apache Mynewt OS...

https://mynewt.apache.org/latest/tutorials/lora/lorawanapp.html

https://github.com/apache/mynewt-core/tree/master/apps/lora_app_shell

This firmware calls the LoRaWAN Driver...

- [`lorawan`: BL602 LoRaWAN Driver](../../components/3rdparty/lorawan)

And the Semtech SX1262 Driver...

- [`lora-sx1262`: Semtech SX1262 Driver](../../components/3rdparty/lora-sx1262)

Read the article...

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

#  Join LoRaWAN network, try 3 times
las_join 3

#  Open LoRaWAN port 2 (App Port)
las_app_port open 2

#  Send data to LoRaWAN port 2, 5 bytes, unconfirmed (0)
las_app_tx 2 5 0
```

# Message Integrity Code Errors

To search for Message Integrity Code errors in LoRaWAN Packets received by WisGate, SSH to WisGate and search for...

```bash
# grep MIC /var/log/syslog

Apr 28 04:02:05 rak-gateway 
chirpstack-application-server[568]: 
time="2021-04-28T04:02:05+01:00" 
level=error 
msg="invalid MIC" 
dev_eui=4bc15ee7377bb15b 
type=DATA_UP_MIC

Apr 28 04:02:05 rak-gateway 
chirpstack-network-server[1378]: 
time="2021-04-28T04:02:05+01:00" 
level=error 
msg="uplink: processing uplink frame error"
ctx_id=0ccd1478-3b79-4ded-9e26-a28e4c143edc 
error="get device-session error: invalid MIC"
```

The error above occurs when we replay a repeated Join Network Request to our LoRaWAN Gateway (with same Nonce, same Message Integrity Code).

This replay also logs a Nonce Error in WisGate...

```bash
# grep nonce /var/log/syslog

Apr 28 04:02:41 rak-gateway chirpstack-application-server[568]:
time="2021-04-28T04:02:41+01:00" 
level=error 
msg="validate dev-nonce error" 
dev_eui=4bc15ee7377bb15b 
type=OTAA

Apr 28 04:02:41 rak-gateway chirpstack-network-server[1378]:
time="2021-04-28T04:02:41+01:00" 
level=error 
msg="uplink: processing uplink frame error" ctx_id=01ae296e-8ce1-449a-83cc-fb0771059d89 
error="validate dev-nonce error: object already exists"
```

Because the Nonce should not be reused.

# LoRa Packet Forwarder for WisGate

Config file is at...

```text
/opt/ttn-gateway/packet_forwarder/lora_pkt_fwd/global_conf.json
```

Restart packet forwarder...

```bash
sudo bash
cd /opt/ttn-gateway/packet_forwarder/lora_pkt_fwd
pkill -9 lora_pkt_fwd
./lora_pkt_fwd
```

# Output Log

Captured on PineDio Stack BL604, talking to WisGate D4H LoRaWAN Gateway with ChirpStack...

```text
▒Starting bl602 now....
Booting BL602 Chip...
██████╗ ██╗      ██████╗  ██████╗ ██████╗
██╔══██╗██║     ██╔════╝ ██╔═████╗╚════██╗
██████╔╝██║     ███████╗ ██║██╔██║ █████╔╝
██╔══██╗██║     ██╔═══██╗████╔╝██║██╔═══╝
██████╔╝███████╗╚██████╔╝╚██████╔╝███████╗
╚═════╝ ╚══════╝ ╚═════╝  ╚═════╝ ╚══════╝


------------------------------------------------------------
RISC-V Core Feature:RV32-ACFIMX
Build Version: release_bl_iot_sdk_1.6.11-1-g66bb28da-dirty
Build Date: Sep 10 2021
Build Time: 11:57:34
-----------------------------------------------------------

blog init set power on level 2, 2, 2.
[IRQ] Clearing and Disable all the pending IRQ...
[OS] Starting aos_loop_proc task...
[OS] Starting OS Scheduler...
=== 32 task inited
====== bloop dump ======
  bitmap_evt 0
  bitmap_msg 0
--->>> timer list:
  32 task:
    task[31] : SYS [built-in]
      evt handler 0x2301c07c, msg handler 0x2301c046, trigged cnt 0, bitmap asyn c 0 sync 0, time consumed 0us acc 0ms, max 0us
    task[30] : empty
    task[29] : empty
    task[28] : empty
    task[27] : empty
    task[26] : empty
    task[25] : empty
    task[24] : empty
    task[23] : empty
    task[22] : empty
    task[21] : empty
    task[20] : empty
    task[19] : empty
    task[18] : empty
    task[17] : empty
    task[16] : empty
    task[15] : empty
    task[14] : empty
    task[13] : empty
    task[12] : empty
    task[11] : empty
    task[10] : empty
    task[09] : empty
    task[08] : empty
    task[07] : empty
    task[06] : empty
    task[05] : empty
    task[04] : empty
    task[03] : empty
    task[02] : empty
    task[01] : empty
    task[00] : empty
Init CLI with event Driven

# create_task

# init_lorawan
Set Flash CS pin 14 to high
Set ST7789 CS pin 20 to high
Set SX1262 CS pin 15 to high
Set Debug CS pin 5 to high
lora_node_init
pbuf_queue_init
pbuf_queue_init
pbuf_queue_init
SX126xReset
SX126xIoInit
Swap MISO and MOSI
SX126X interrupt init
SX126X register handler: GPIO 19
SX126xWakeup
SX126xSetTxParams: power=22, rampTime=7
SX126xGetDeviceId: SX1262
SX126xSetPaConfig: paDutyCycle=4, hpMax=7, deviceSel=0, paLut=1
RadioSetModem
RadioSetPublicNetwork: public syncword=3444
RadioSleep

# las_wr_dev_eui 0x4b:0xc1:0x5e:0xe7:0x37:0x7b:0xb1:0x5b

# las_wr_app_eui 0x00:0x00:0x00:0x00:0x00:0x00:0x00:0x00

# las_wr_app_key 0xaa:0xff:0xad:0x5c:0x7e:0x87:0xf6:0x4d:0xe3:0xf0:0x87:0x32:0xf c:0x1d:0xd2:0x5d

# las_join 1
lora_node_join: joined=8
lora_node_join: joining network
Attempting to join...

# lora_mac_join_event
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
RadioSetTxConfig: modem=1, power=13, fdev=0, bandwidth=0, datarate=10, coderate= 1, preambleLen=8, fixLen=0, crcOn=1, freqHopOn=0, hopPeriod=0, iqInverted=0, tim eout=3000
RadioSetTxConfig: SpreadingFactor=10, Bandwidth=4, CodingRate=1, LowDatarateOpti mize=0, PreambleLength=8, HeaderType=0, PayloadLength=255, CrcMode=1, InvertIQ=0
RadioStandby
RadioSetModem
SX126xSetRfTxPower
SX126xSetTxParams: power=13, rampTime=7
SX126xGetDeviceId: SX1262
SX126xSetPaConfig: paDutyCycle=4, hpMax=7, deviceSel=0, paLut=1
SendFrameOnChannel: channel=1, datarate=2, txpower=0, maxeirp=16, antennagain=2
SendFrameOnChannel: txi is null, skipping log
RadioSend: size=23
00 00 00 00 00 00 00 00 00 5b b1 7b 37 e7 5e c1 4b 8b 22 2e 53 d4 79
RadioSend: PreambleLength=8, HeaderType=0, PayloadLength=23, CrcMode=1, InvertIQ =0
lora_mac_join_event: OK
RadioOnDioIrq
RadioIrqProcess
SX126xReadCommand
IRQ_TX_DONE
OnRadioTxDone
RadioSleep

# OnRxWindow1TimerEvent
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
OnRadioRxDone
loramac_process_radio_rx
RadioSleep
lora_mac_rx_win2_stop

# las_app_port open 2
Opened app port 2

# las_app_tx 2 5 0
lwip_init
-------------------->>>>>>>> LWIP tcp_port 51766
lora_node_mcps_request
pbuf_queue_put
Packet sent on port 2

# lora_mac_proc_tx_q_event
lora_mac_proc_tx_q_event: send from txq
pbuf_queue_get
Send
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
SX126xWakeup
RadioSetTxConfig: modem=1, power=13, fdev=0, bandwidth=0, datarate=10, coderate= 1, preambleLen=8, fixLen=0, crcOn=1, freqHopOn=0, hopPeriod=0, iqInverted=0, tim eout=3000
RadioSetTxConfig: SpreadingFactor=10, Bandwidth=4, CodingRate=1, LowDatarateOpti mize=0, PreambleLength=8, HeaderType=0, PayloadLength=64, CrcMode=1, InvertIQ=0
RadioStandby
RadioSetModem
SX126xSetRfTxPower
SX126xSetTxParams: power=13, rampTime=7
SX126xGetDeviceId: SX1262
SX126xSetPaConfig: paDutyCycle=4, hpMax=7, deviceSel=0, paLut=1
SendFrameOnChannel: channel=1, datarate=2, txpower=0, maxeirp=16, antennagain=2
RadioSend: size=18
40 53 f4 bd 01 00 00 00 02 19 55 bf ad 10 69 90 ea a3
RadioSend: PreambleLength=8, HeaderType=0, PayloadLength=18, CrcMode=1, InvertIQ =0
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
pbuf_queue_put
lora_node_chk_txq
pbuf_queue_get
Txd on port 2 type=unconf status=0 len=5
        dr:2
        txpower (dbm):0
        tries:1
        ack_rxd:0
        tx_time_on_air:330
        uplink_cntr:0
        uplink_chan:1
pbuf_queue_get
lora_mac_proc_tx_q_event

#
# las_app_tx 2 5 0
lora_node_mcps_request
pbuf_queue_put
Packet sent on port 2

# lora_mac_proc_tx_q_event
lora_mac_proc_tx_q_event: send from txq
pbuf_queue_get
Send
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
SX126xWakeup
RadioSetTxConfig: modem=1, power=13, fdev=0, bandwidth=0, datarate=10, coderate= 1, preambleLen=8, fixLen=0, crcOn=1, freqHopOn=0, hopPeriod=0, iqInverted=0, tim eout=3000
RadioSetTxConfig: SpreadingFactor=10, Bandwidth=4, CodingRate=1, LowDatarateOpti mize=0, PreambleLength=8, HeaderType=0, PayloadLength=64, CrcMode=1, InvertIQ=0
RadioStandby
RadioSetModem
SX126xSetRfTxPower
SX126xSetTxParams: power=13, rampTime=7
SX126xGetDeviceId: SX1262
SX126xSetPaConfig: paDutyCycle=4, hpMax=7, deviceSel=0, paLut=1
SendFrameOnChannel: channel=0, datarae=2, txpower=0, maxeirp=16, antennagain=2
RadioSend: size=18
40 53 f4 bd 01 00 01 00 02 f4 d9 81 d4 03 02 03 83 af
RadioSend: PreambleLength=8, HeaderType=0, PayloadLength=18, CrcMode=1, InvertIQ =0
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
pbuf_queue_put
lora_node_chk_txq
pbuf_queue_get
Txd on port 2 type=unconf status=0 len=5
        dr:2
        tpower (dbm):0
        tries:1
        ack_rxd:0
        tx_time_on_air:330
        uplink_cntr:1
        uplink_chan:0
pbuf_queue_get
lora_mac_proc_tx_q_event

#
```
