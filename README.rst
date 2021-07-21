Pine64 BL602 SDK modded for the articles...

- `"Reverse Engineering WiFi on RISC-V BL602" <https://lupyuen.github.io/articles/wifi>`_

- `"Machine Learning on RISC-V BL602 with TensorFlow Lite" <https://lupyuen.github.io/articles/tflite>`_

- `"BL602 Bootloader" <https://lupyuen.github.io/articles/boot>`_

- `"Simulate RISC-V BL602 with WebAssembly, uLisp and Blockly" <https://lupyuen.github.io/articles/wasm>`_

- `"uLisp and Blockly on PineCone BL602 RISC-V Board" <https://lupyuen.github.io/articles/lisp>`_

- `"Run Rust RISC-V Firmware with BL602 IoT SDK" <https://lupyuen.github.io/articles/rust>`_

- `"PineCone BL602 RISC-V Board Receives LoRa Packets" <https://lupyuen.github.io/articles/lora2>`_

- `"RAKwireless WisBlock talks LoRa with PineCone BL602 RISC-V Board" <https://lupyuen.github.io/articles/wisblock>`_

- `"Connect PineCone BL602 to LoRa Transceiver" <https://lupyuen.github.io/articles/lora>`_

- `"The RISC-V BL602 Book" <https://lupyuen.github.io/articles/book>`_

- `"PineCone BL602 Talks UART to Grove E-Ink Display" <https://lupyuen.github.io/articles/uart>`_

- `"PineCone BL602 Blasting Pixels to ST7789 Display with LVGL Library" <https://lupyuen.github.io/articles/display>`_

- `"PineCone BL602 talks SPI too!" <https://lupyuen.github.io/articles/spi>`_

- `"PineCone BL602 talks to I2C Sensors" <https://lupyuen.github.io/articles/i2c>`_

- `"Mynewt GPIO ported to PineCone BL602 RISC-V Board" <https://lupyuen.github.io/articles/gpio>`_

- `"Control PineCone BL602 RGB LED with GPIO and PWM" <https://lupyuen.github.io/articles/led>`_

- `"Flashing Firmware to PineCone BL602" <https://lupyuen.github.io/articles/flash>`_

- `"Debug Rust on PineCone BL602 with VSCode and GDB" <https://lupyuen.github.io/articles/debug>`_

- `"Porting Mynewt to PineCone BL602" <https://lupyuen.github.io/articles/mynewt>`_

- `"Connect PineCone BL602 to OpenOCD" <https://lupyuen.github.io/articles/openocd>`_

- `"Quick Peek of PineCone BL602 RISC-V Evaluation Board" <https://lupyuen.github.io/articles/pinecone>`_

Changes
=======

- Capture built firmware from GitHub Actions Workflow as Artifacts

- "jtag" branch contains a modified Hello World app that remaps the JTAG port: https://github.com/lupyuen/bl_iot_sdk/tree/jtag/customer_app/sdk_app_helloworld

- "master" branch contains a modified PWM Demo Firmware that runs without Device Tree: https://github.com/lupyuen/bl_iot_sdk/pull/1

- "i2c" branch contains a modified I2C Demo Firmware that uses the Low Level I2C HAL: https://github.com/lupyuen/bl_iot_sdk/blob/i2c/customer_app/sdk_app_i2c/

- "master" branch contains a new SPI Demo Firmware that uses the SPI HAL: https://github.com/lupyuen/bl_iot_sdk/blob/master/customer_app/sdk_app_spi/

- "master" branch contains a new Demo Firmware for ST7789 SPI Display + LVGL Graphics Library: https://github.com/lupyuen/bl_iot_sdk/blob/master/customer_app/sdk_app_st7789/

- "master" branch contains a new Demo Firmware for Grove E-Ink Display with UART Interface: https://github.com/lupyuen/bl_iot_sdk/blob/master/customer_app/sdk_app_uart_eink/

- "master" branch contains a new Demo Firmware that transmits and receives LoRa packets: https://github.com/lupyuen/bl_iot_sdk/blob/master/customer_app/sdk_app_lora/

- "master" branch contains a new Demo Firmware for LoRa Ping: https://github.com/lupyuen/bl_iot_sdk/blob/master/customer_app/sdk_app_loraping/

- "master" branch contains reorganised library source files for NimBLE and SX1276: https://github.com/lupyuen/bl_iot_sdk/tree/master/components/3rdparty/nimble-porting-layer and https://github.com/lupyuen/bl_iot_sdk/tree/master/components/3rdparty/lora-sx1276

- "master" branch contains LoRaWAN Driver and LoRaWAN Firmware: https://github.com/lupyuen/bl_iot_sdk/tree/master/components/3rdparty/lorawan and https://github.com/lupyuen/bl_iot_sdk/blob/master/customer_app/sdk_app_lorawan/

- "master" branch contains the driver for LoRa SX1262: https://github.com/lupyuen/bl_iot_sdk/tree/master/components/3rdparty/lora-sx1262

- "master" branch contains Rust Library and Rust Firmware: https://github.com/lupyuen/bl_iot_sdk/tree/master/components/3rdparty/rust-app and https://github.com/lupyuen/bl_iot_sdk/tree/master/customer_app/sdk_app_rust/

- "master" branch contains Blinky Firmware: https://github.com/lupyuen/bl_iot_sdk/tree/master/customer_app/sdk_app_blinky

- "master" branch contains uLisp Library and uLisp Firmware: https://github.com/lupyuen/bl_iot_sdk/tree/master/components/3rdparty/ (ulisp-bl602) and https://github.com/lupyuen/bl_iot_sdk/tree/master/customer_app/sdk_app_ulisp/

- "master" branch contains TensorFlow Lite Library and Firmware: https://github.com/lupyuen/bl_iot_sdk/tree/master/components/3rdparty/ (tflite-bl602) and https://github.com/lupyuen/bl_iot_sdk/tree/master/customer_app/sdk_app_tflite/

- "adc" branch contains ADC Firmware: https://github.com/lupyuen/bl_iot_sdk/tree/master/customer_app/sdk_app_adc

BL602 SDK (Pine64 version)
==========================

Join us on `Discord <https://discord.gg/89VWQVH>`_, `Telegram <https://t.me/joinchat/Kmi2S0nOsT240emHk-aO6g>`_, `Matrix <https://matrix.to/#/#pine64-nutcracker:matrix.org>`_

This repository contains the Pine64 fork of Bouffalo Lab's SDK for their BL602
Wi-Fi/BLE Combo RISC-V SoC. Documentation, including upstream documentation,
translations, mirrored technical documentation, and original reverse engineered
documentation is at `bl602-docs <https://github.com/pine64/bl602-docs>`_, which
is cloned as a submodule of this repository at ``docs``. Use `git submodule update --init` to initialize the submodule. 

This repository is the central focus of Pine64's
`Nutcracker Challenge <https://www.pine64.org/2020/10/28/nutcracker-challenge-blob-free-wifi-ble/>`_. The main task is to reverse engineer the following files:

    - `components/bl602/bl602_wifi/lib/libbl602_wifi.a <https://github.com/pine64/bl_iot_sdk/blob/master/components/bl602/bl602_wifi/lib/libbl602_wifi.a>`_
    - `components/network/ble/blecontroller/lib/libblecontroller.a <https://github.com/pine64/bl_iot_sdk/blob/master/components/network/ble/blecontroller/lib/libblecontroller.a>`_
    - `components/stage/atcmd/lib/libatcmd.a <https://github.com/pine64/bl_iot_sdk/blob/master/components/stage/atcmd/lib/libatcmd.a>`_

This is being done at `bl602-re <https://github.com/pine64/bl602-re>`_.


Documentation
------------
You can find a lot of documentation on `PINE64 Documentation Website <https://pine64.github.io/bl602-docs/>`_ and `PINE64 Documentation Repository <https://github.com/pine64/bl602-docs>`_, where you can find Datasheets, Reference Manuals and various other documentation materials.

Quick Start
-----------
In order to build sample apps, you need to set a few environment variables::

    export BL60X_SDK_PATH=/path/to/this/repo
    export CONFIG_CHIP_NAME=BL602

In order to build all sample apps simply call `make`, for example::

    make

To only build the sample app of interest, go to the directory of the app,
then call `make`, for example::

    cd customer_app/bl602_boot2
    make

Call
====

::

    make CONFIG_TOOLPREFIX=riscv64-linux-gnu-

if you wish to bypass the bundled cross-compiler and using your distribution's own
cross-compiler.

There is a linker script (written in python) at `image_conf/flash_build.py`.
To run this, you need to specify the application and the target, for example::

    python3 flash_build.py bl602_boot2 bl602

**Note:** If you decide to copy any project outside of the `customer_app` folder,
you will need to define a few variables in order to compile it::

   export BL60X_SDK_PATH=/path/to/this/repo
   export CONFIG_CHIP_NAME=bl602 

Hardware
--------
BL602 is a 32-bit RISC-V based combo chipset supporting Wi-Fi and BLE (Bluetooth
Low Energy). The chip is made by `Nanjing-based Bouffalo Lab <https://www.bouffalolab.com/bl602>`_
for ultra-low-power applications. In terms of price range and feature set, the
chip is competing against `Espressif ESP8266 <https://www.espressif.com/en/products/socs/esp8266>`_.
The RISC-V core is based on `SiFive E24 <https://www.sifive.com/cores/e24>`_.

At the moment there are mainly three development boards:

  - `PineCone <https://www.pine64.org/2020/10/28/nutcracker-challenge-blob-free-wifi-ble/>`_: USB-C evaluation board by Pine64 (datasheet `here <https://www.cnx-software.com/pdf/schematics/Pine64%20BL602%20EVB%20Schematic%20ver%201.1.pdf>`_), RGB LED, CH340N USB-to-UART chip
  - `Doi.am DT-BL10 <https://www.cnx-software.com/2020/10/25/bl602-iot-sdk-and-5-dt-bl10-wifi-ble-risc-v-development-board/>`_: micro USB
  - `Official BL EVB <https://twitter.com/nnn112358/status/1321289916249235457>`_ (Sipeed early adopter program): mini USB, FTDI chip?

Comparison with ESP8266
-----------------------
+-------------------+-----------------------------+----------------------------------+
|                   | Bouffalo Lab BL602          | Espressif ESP8266                |
+===================+=============================+==================================+
| Architecture      | 32-bit RISC-V (SiFive E24)  | 32-bit Xtensa                    |
|                   |                             |                                  |
|                   | @192MHz (dynamic @1-192MHz) | @80MHz (and 160MHz)              |
|                   |                             |                                  |
|                   | L1 cache                    |                                  |
|                   |                             |                                  |
|                   | FPU                         |                                  |
+-------------------+-----------------------------+----------------------------------+
| Memory            | 276KB SRAM                  | 32 KiB instruction RAM           |
|                   |                             |                                  |
|                   | 128KB ROM                   | 32 KiB instruction cache RAM     |
|                   |                             |                                  |
|                   | 1 Kb eFuse                  | 80 KiB user-data RAM             |
|                   |                             |                                  |
|                   | optional embdedded flash    | 16 KiB ETS system-data RAM       |
|                   |                             |                                  |
|                   |                             |                                  |
|                   | XIP QSPI flash support      | No programmable ROM              |
|                   |                             |                                  |
|                   |                             | QSPI flash support               |
|                   |                             | (up to 16 MB)                    |
+-------------------+-----------------------------+----------------------------------+
| Wi-Fi             | 802.11 b/g/n @2.4GHz        | 802.11 b/g/n @2.4GHz             |
|                   |                             |                                  |
|                   | WPS/WEP/WPA/WPA2/WPA3       | WEP/WPA/WPA2                     |
+-------------------+-----------------------------+----------------------------------+
| Bluetooth         | LE 5.0                      | NONE                             |
+-------------------+-----------------------------+----------------------------------+
| GPIO              | x16                         | x16                              |
+-------------------+-----------------------------+----------------------------------+
| SDIO              | x1 2.0 slave                | x1 v2.0 slave                    |
+-------------------+-----------------------------+----------------------------------+
| SPI               | x1                          | x2                               |
+-------------------+-----------------------------+----------------------------------+
| UART              | x2                          | x1.5                             |
|                   |                             | (One Tx only)                    |
+-------------------+-----------------------------+----------------------------------+
| I2C               | x1                          | x1 (software implemented)        |
+-------------------+-----------------------------+----------------------------------+
| I2S               | NONE                        | x1 (with DMA)                    |
+-------------------+-----------------------------+----------------------------------+
| PWM channels      | x5                          | x4                               |
+-------------------+-----------------------------+----------------------------------+
| ADC               | 12-bit                      | 10-bit (SAR)                     |
+-------------------+-----------------------------+----------------------------------+
| DAC               | 10-bit                      | NONE                             |
+-------------------+-----------------------------+----------------------------------+
| Analog Comparator | x2                          | NONE                             |
+-------------------+-----------------------------+----------------------------------+
| DMA               | x4                          | with I2S                         |
+-------------------+-----------------------------+----------------------------------+
| Timer             | RTC (up to 1 year)          | x1 hardware                      |
|                   |                             |                                  |
|                   | x2 32-bit general-purpose   | x1 software                      |
|                   |                             |                                  |
|                   |                             | (no interrupt gen. on sw. timer) |
+-------------------+-----------------------------+----------------------------------+
| IR Remote Control | x1                          | x1                               |
+-------------------+-----------------------------+----------------------------------+
| Debug             | JTAG support                | ?                                |
+-------------------+-----------------------------+----------------------------------+
