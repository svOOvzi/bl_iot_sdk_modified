# BL602 Demo Firmware for LoRa SX1262 / SX1276 

This BL602 demo firmware transmits and receives LoRa packets by calling the SX1262 / SX1276 drivers...

- [`lora-sx1262`: BL602 LoRa Driver for Semtech SX1262](../../../components/3rdparty/lora-sx1262)

- [`lora-sx1276`: BL602 LoRa Driver for Semtech SX1276](../../../components/3rdparty/lora-sx1276)

Refer to...

- ["Porting SX1262 Driver to BL602"](https://twitter.com/MisterTechBlog/status/1381870711124369413)

- ["Connect PineCone BL602 to SX1276"](https://lupyuen.github.io/articles/lora)

- ["PineCone BL602 RISC-V Board Receives LoRa Packets with SX1276"](https://lupyuen.github.io/articles/lora2)

# Select Frequency

TODO

# Select Transceiver

TODO

# SX1262

TODO

## Transmit LoRa Packet

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

## Receive LoRa Packet

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

# receive_message

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
48 65 6c 6c 6f 

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
48 65 6c 6c 6f 

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

# receive_message
SX126xWakeup

# RadioOnRxTimeoutIrq
Rx timeout

# 
```

# SX1276

TODO

```text
# help
====Build-in Commands====
====Support 4 cmds once, seperate by ; ====
help                     : print this
p                        : print memory
m                        : modify memory
echo                     : echo for command
exit                     : close CLI
devname                  : print device name
sysver                   : system version
reboot                   : reboot system
poweroff                 : poweroff system
reset                    : system reset
time                     : system time
ota                      : system ota
ps                       : thread dump
ls                       : file list
hexdump                  : dump file
cat                      : cat file

====User Commands====
create_task              : Create a task
put_event                : Add an event
init_driver              : Init LoRa driver
send_message             : Send LoRa message
receive_message          : Receive LoRa message
read_registers           : Read registers
spi_result               : Show SPI counters
blogset                  : blog pri set level
blogdump                 : blog info dump
bl_sys_time_now          : sys time now

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

With Timer:

# reboot
reboot
ˇStarting bl602 now....
Booting BL602 Chip...
‚ñà‚ñà‚ñà‚ñà‚ñà‚ñà‚ïó ‚ñà‚ñà‚ïó      ‚ñà‚ñà‚ñà‚ñà‚ñà‚ñà‚ïó  ‚ñà‚ñà‚ñà‚ñà‚ñà‚ñà‚ïó ‚ñà‚ñà‚ñà‚ñà‚ñà‚ñà‚ïó

‚ñà‚ñà‚ïî‚ïê‚ïê‚ñà‚ñà‚ïó‚ñà‚ñà‚ïë     ‚ñà‚ñà‚ïî‚ïê‚ïê‚ïê‚ïê‚ïù ‚ñà‚ñà‚ïî‚ïê‚ñà‚ñà‚ñà‚ñà‚ïó‚ïö‚ïê‚ïê‚ïê‚ïê‚ñà‚ñà‚ïó

‚ñà‚ñà‚ñà‚ñà‚ñà‚ñà‚ïî‚ïù‚ñà‚ñà‚ïë     ‚ñà‚ñà‚ñà‚ñà‚ñà‚ñà‚ñà‚ïó ‚ñà‚ñà‚ïë‚ñà‚ñà‚ïî‚ñà‚ñà‚ïë ‚ñà‚ñà‚ñà‚ñà‚ñà‚ïî‚ïù

‚ñà‚ñà‚ïî‚ïê‚ïê‚ñà‚ñà‚ïó‚ñà‚ñà‚ïë     ‚ñà‚ñà‚ïî‚ïê‚ïê‚ïê‚ñà‚ñà‚ïó‚ñà‚ñà‚ñà‚ñà‚ïî‚ïù‚ñà‚ñà‚ïë‚ñà‚ñà‚ïî‚ïê‚ïê‚ïê‚ïù

‚ñà‚ñà‚ñà‚ñà‚ñà‚ñà‚ïî‚ïù‚ñà‚ñà‚ñà‚ñà‚ñà‚ñà‚ñà‚ïó‚ïö‚ñà‚ñà‚ñà‚ñà‚ñà‚ñà‚ïî‚ïù‚ïö‚ñà‚ñà‚ñà‚ñà‚ñà‚ñà‚ïî‚ïù‚ñà‚ñà‚ñà‚ñà‚ñà‚ñà‚ñà‚ïó

‚ïö‚ïê‚ïê‚ïê‚ïê‚ïê‚ïù ‚ïö‚ïê‚ïê‚ïê‚ïê‚ïê‚ïê‚ïù ‚ïö‚ïê‚ïê‚ïê‚ïê‚ïê‚ïù  ‚ïö‚ïê‚ïê‚ïê‚ïê‚ïê‚ïù ‚ïö‚ïê‚ïê‚ïê‚ïê‚ïê‚ïê‚ïù



------------------------------------------------------------
RISC-V Core Feature:RV32-ACFIMX
Build Version: release_bl_iot_sdk_1.6.11-1-g66bb28da-dirty
Build Date: Mar 24 2021
Build Time: 14:27:33
------------------------------------------------------------

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
      evt handler 0x2300e5fe, msg handler 0x2300e5c8, trigged cnt 0, bitmap async 0 sync 0, time consumed 0us acc 0ms, max 0us
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

# 
# create_task

# init_driver
SX1276 init
SX1276 interrupt init
SX1276 register handler: GPIO 11
SX1276 register handler: GPIO 0
SX1276 register handler: GPIO 5
SX1276 register handler: GPIO 12

SX1276 DIO3: Channel a
# ctivity detection

# 
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
