#!/usr/bin/env bash
#  macOS script to build, flash and run BL602 Firmware

set -e  #  Exit when any command fails
set -x  #  Echo commands

#  Name of app
export APP_NAME=pinedio_blinky

#  Build for BL602
export CONFIG_CHIP_NAME=BL602

#  Where BL602 IoT SDK is located
export BL60X_SDK_PATH=$PWD/../..

#  Where blflash is located
export BLFLASH_PATH=$PWD/../../../blflash

#  Where GCC is located
export GCC_PATH=$PWD/../../../xpack-riscv-none-embed-gcc

#  Remove the firmware file
if [ -f build_out/$APP_NAME.bin ]
then
    rm build_out/$APP_NAME.bin
fi

#  Build the firmware
make -j || echo "Checking build for error..."

#  Fail if the firmware file doesn't exist
if [ -f build_out/$APP_NAME.bin ]
then
    echo "Build OK"
else 
    echo "Build failed"
    exit 1
fi

#  Generate the disassembly
if [ -f $GCC_PATH/bin/riscv-none-embed-objdump ]
then
    $GCC_PATH/bin/riscv-none-embed-objdump \
        -t -S --demangle --line-numbers --wide \
        build_out/$APP_NAME.elf \
        >build_out/$APP_NAME.S \
        2>&1
fi

#  Copy firmware to blflash
cp build_out/$APP_NAME.bin $BLFLASH_PATH

#  Flash the firmware
pushd $BLFLASH_PATH
cargo run flash $APP_NAME.bin \
    --port /dev/tty.usbserial-14* \
    --initial-baud-rate 230400 \
    --baud-rate 230400
sleep 5
popd

#  Run the firmware
open -a CoolTerm
