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

#  Join network
las_join 1

#  Open port
las_app_port open 1

#  Send data to port 1, 5 bytes, unconfirmed (0)
las_app_tx 1 5 0
```
