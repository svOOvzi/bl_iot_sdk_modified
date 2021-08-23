#!/usr/bin/env bash
#  macOS script to build, flash and run BL602 Firmware

set -e  #  Exit when any command fails
set -x  #  Echo commands

#  Build for BL602
export CONFIG_CHIP_NAME=BL602

#  Where BL602 IoT SDK is located
export BL60X_SDK_PATH=$PWD/../..

#  Where blflash is located
export BLFLASH_PATH=$PWD/../../../blflash

#  Build the firmware
make

#  Copy firmware to blflash
cp build_out/pinedio_st7789.bin $BLFLASH_PATH

#  Flash the firmware
pushd $BLFLASH_PATH
cargo run flash pinedio_st7789.bin \
    --port /dev/tty.usbserial-1420 \
    --initial-baud-rate 230400 \
    --baud-rate 230400
sleep 5
popd

#  Run the firmware
open -a CoolTerm
