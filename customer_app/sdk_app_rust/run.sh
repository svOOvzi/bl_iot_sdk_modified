#!/usr/bin/env bash
#  macOS script to build, flash and run BL602 Rust Firmware.
#  We use a custom Rust target `riscv32imacf-unknown-none-elf` that sets `llvm-abiname` to `ilp32f` for Single-Precision Hardware Floating-Point.
#  (Because BL602 IoT SDK was compiled with "gcc -march=rv32imfc -mabi=ilp32f")
#  TODO: BL602 is actually RV32-ACFIMX

set -e  #  Exit when any command fails
set -x  #  Echo commands

#  Name of app
export APP_NAME=sdk_app_rust

#  Build for BL602
export CONFIG_CHIP_NAME=BL602

#  Where BL602 IoT SDK is located
export BL60X_SDK_PATH=$PWD/../..

#  Where blflash is located
export BLFLASH_PATH=$PWD/../../../blflash

#  Where GCC is located
export GCC_PATH=$PWD/../../../xpack-riscv-none-embed-gcc

#  Rust build profile: debug or release
rust_build_profile=debug
#  rust_build_profile=release

#  Rust target: Custom target for llvm-abiname=ilp32f
#  https://docs.rust-embedded.org/embedonomicon/compiler-support.html#built-in-target
#  https://docs.rust-embedded.org/embedonomicon/custom-target.html
rust_build_target=$PWD/riscv32imacf-unknown-none-elf.json
rust_build_target_folder=riscv32imacf-unknown-none-elf

#  Rust target: Standard target
#  rust_build_target=riscv32imac-unknown-none-elf
#  rust_build_target_folder=riscv32imac-unknown-none-elf

#  Rust build options: Build the Rust Core Library for our custom target
rust_build_options="--target $rust_build_target -Z build-std=core"
if [ "$rust_build_profile" == 'release' ]; then
    # Build for release
    rust_build_options="--release $rust_build_options"
#  else 
    # Build for debug: No change in options
fi

#  Location of the Rust Stub Library.  We will replace this stub by the Rust Static Library
rust_app_dir=build_out/rust-app
rust_app_dest=$rust_app_dir/librust-app.a

#  Location of the compiled Rust Static Library
rust_build_dir=$PWD/rust/target/$rust_build_target_folder/$rust_build_profile
rust_app_build=$rust_build_dir/libapp.a

#  Remove the Rust Stub Library if it exists
if [ -e $rust_app_dest ]; then
    rm $rust_app_dest
fi

#  Remove the Rust Static Library if it exists
if [ -e $rust_app_build ]; then
    rm $rust_app_build
fi

#  Build the firmware with the Rust Stub Library
make

#  Build the Rust Static Library
pushd rust
rustup default nightly
cargo build -v $rust_build_options
popd

#  Replace the Rust Stub Library by the Rust Static Library
ls -l $rust_app_build
cp $rust_app_build $rust_app_dest

#  Link the Rust Compiled Library to the firmware
make

#  Generate the disassembly
$GCC_PATH/bin/riscv-none-embed-objdump \
    -t -S --demangle --line-numbers --wide \
    build_out/$APP_NAME.elf \
    >build_out/$APP_NAME.S \
    2>&1

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

exit

Output Log:
+ export APP_NAME=sdk_app_rust
+ APP_NAME=sdk_app_rust
+ export CONFIG_CHIP_NAME=BL602
+ CONFIG_CHIP_NAME=BL602
+ export BL60X_SDK_PATH=/Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/../..
+ BL60X_SDK_PATH=/Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/../..
+ export BLFLASH_PATH=/Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/../../../blflash
+ BLFLASH_PATH=/Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/../../../blflash
+ export GCC_PATH=/Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/../../../xpack-riscv-none-embed-gcc
+ GCC_PATH=/Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/../../../xpack-riscv-none-embed-gcc
+ rust_build_profile=debug
+ rust_build_target=/Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/riscv32imacf-unknown-none-elf.json
+ rust_build_target_folder=riscv32imacf-unknown-none-elf
+ rust_build_options='--target /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/riscv32imacf-unknown-none-elf.json -Z build-std=core'
+ '[' debug == release ']'
+ rust_app_dir=build_out/rust-app
+ rust_app_dest=build_out/rust-app/librust-app.a
+ rust_build_dir=/Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/rust/target/riscv32imacf-unknown-none-elf/debug
+ rust_app_build=/Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/rust/target/riscv32imacf-unknown-none-elf/debug/libapp.a
+ '[' -e build_out/rust-app/librust-app.a ']'
+ rm build_out/rust-app/librust-app.a
+ '[' -e /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/rust/target/riscv32imacf-unknown-none-elf/debug/libapp.a ']'
+ rm /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/rust/target/riscv32imacf-unknown-none-elf/debug/libapp.a
+ make
use existing version.txt file
AR build_out/rust-app/librust-app.a
LD build_out/sdk_app_rust.elf
Generating BIN File to /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/build_out/sdk_app_rust.bin
Requirement already satisfied: fdt>=0.2.0 in /Library/Frameworks/Python.framework/Versions/3.6/lib/python3.6/site-packages (from -r requirements.txt (line 2)) (0.2.0)
Requirement already satisfied: pycryptodomex>=3.9.8 in /Library/Frameworks/Python.framework/Versions/3.6/lib/python3.6/site-packages (from -r requirements.txt (line 3)) (3.9.9)
Requirement already satisfied: toml>=0.10.2 in /Library/Frameworks/Python.framework/Versions/3.6/lib/python3.6/site-packages (from -r requirements.txt (line 4)) (0.10.2)
Requirement already satisfied: configobj>=5.0.6 in /Library/Frameworks/Python.framework/Versions/3.6/lib/python3.6/site-packages (from -r requirements.txt (line 5)) (5.0.6)
Requirement already satisfied: six in /Users/Luppy/Library/Python/3.6/lib/python/site-packages (from configobj>=5.0.6->-r requirements.txt (line 5)) (1.15.0)
You are using pip version 18.1, however version 21.0.1 is available.
You should consider upgrading via the 'pip install --upgrade pip' command.
========= chip flash id: c84015 =========
/Users/Luppy/pinecone/bl_iot_sdk/image_conf/bl602/flash_select/GD25Q16E_c84015.conf
Generating BIN File to /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/build_out/ota/dts40M_pt2M_boot2release_c84015/FW_OTA.bin
Generating BIN File to /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/build_out/ota/dts40M_pt2M_boot2release_c84015/FW_OTA.bin.ota
Generating BIN File to /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/build_out/ota/dts40M_pt2M_boot2release_c84015/FW_OTA.bin.xz
Generating BIN File to /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/build_out/ota/dts40M_pt2M_boot2release_c84015/FW_OTA.bin.xz.ota
Generating BIN File to /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/build_out/whole_dts40M_pt2M_boot2release_c84015.bin
========= chip flash id: ef6015 =========
/Users/Luppy/pinecone/bl_iot_sdk/image_conf/bl602/flash_select/W25Q16FW_ef6015.conf
Generating BIN File to /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/build_out/ota/dts40M_pt2M_boot2release_ef6015/FW_OTA.bin
Generating BIN File to /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/build_out/ota/dts40M_pt2M_boot2release_ef6015/FW_OTA.bin.ota
Generating BIN File to /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/build_out/ota/dts40M_pt2M_boot2release_ef6015/FW_OTA.bin.xz
Generating BIN File to /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/build_out/ota/dts40M_pt2M_boot2release_ef6015/FW_OTA.bin.xz.ota
Generating BIN File to /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/build_out/whole_dts40M_pt2M_boot2release_ef6015.bin
========= chip flash id: ef4015 =========
/Users/Luppy/pinecone/bl_iot_sdk/image_conf/bl602/flash_select/W25Q16JV_ef4015.conf
Generating BIN File to /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/build_out/ota/dts40M_pt2M_boot2release_ef4015/FW_OTA.bin
Generating BIN File to /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/build_out/ota/dts40M_pt2M_boot2release_ef4015/FW_OTA.bin.ota
Generating BIN File to /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/build_out/ota/dts40M_pt2M_boot2release_ef4015/FW_OTA.bin.xz
Generating BIN File to /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/build_out/ota/dts40M_pt2M_boot2release_ef4015/FW_OTA.bin.xz.ota
Generating BIN File to /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/build_out/whole_dts40M_pt2M_boot2release_ef4015.bin
========= chip flash id: ef7015 =========
/Users/Luppy/pinecone/bl_iot_sdk/image_conf/bl602/flash_select/W25Q16JV_ef7015.conf
Generating BIN File to /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/build_out/ota/dts40M_pt2M_boot2release_ef7015/FW_OTA.bin
Generating BIN File to /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/build_out/ota/dts40M_pt2M_boot2release_ef7015/FW_OTA.bin.ota
Generating BIN File to /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/build_out/ota/dts40M_pt2M_boot2release_ef7015/FW_OTA.bin.xz
Generating BIN File to /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/build_out/ota/dts40M_pt2M_boot2release_ef7015/FW_OTA.bin.xz.ota
Generating BIN File to /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/build_out/whole_dts40M_pt2M_boot2release_ef7015.bin
Building Finish. To flash build output.
+ pushd rust
~/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/rust ~/pinecone/bl_iot_sdk/customer_app/sdk_app_rust
+ rustup default nightly
info: using existing install for 'nightly-x86_64-apple-darwin'
info: default toolchain set to 'nightly-x86_64-apple-darwin'

  nightly-x86_64-apple-darwin unchanged - rustc 1.53.0-nightly (7af1f55ae 2021-04-15)

+ cargo build -v --target /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/riscv32imacf-unknown-none-elf.json -Z build-std=core
    Updating crates.io index
       Fresh core v0.0.0 (/Users/Luppy/.rustup/toolchains/nightly-x86_64-apple-darwin/lib/rustlib/src/rust/library/core)
Hard-float 'f' ABI can't be used for a target that doesn't support the F instruction set extension (ignoring target-abi)
Hard-float 'f' ABI can't be used for a target that doesn't support the F instruction set extension (ignoring target-abi)
Hard-float 'f' ABI can't be used for a target that doesn't support the F instruction set extension (ignoring target-abi)
Hard-float 'f' ABI can't be used for a target that doesn't support the F instruction set extension (ignoring target-abi)
Hard-float 'f' ABI can't be used for a target that doesn't support the F instruction set extension (ignoring target-abi)
Hard-float 'f' ABI can't be used for a target that doesn't support the F instruction set extension (ignoring target-abi)
Hard-float 'f' ABI can't be used for a target that doesn't support the F instruction set extension (ignoring target-abi)
Hard-float 'f' ABI can't be used for a target that doesn't support the F instruction set extension (ignoring target-abi)
Hard-float 'f' ABI can't be used for a target that doesn't support the F instruction set extension (ignoring target-abi)
Hard-float 'f' ABI can't be used for a target that doesn't support the F instruction set extension (ignoring target-abi)
Hard-float 'f' ABI can't be used for a target that doesn't support the F instruction set extension (ignoring target-abi)
Hard-float 'f' ABI can't be used for a target that doesn't support the F instruction set extension (ignoring target-abi)
Hard-float 'f' ABI can't be used for a target that doesn't support the F instruction set extension (ignoring target-abi)
Hard-float 'f' ABI can't be used for a target that doesn't support the F instruction set extension (ignoring target-abi)
Hard-float 'f' ABI can't be used for a target that doesn't support the F instruction set extension (ignoring target-abi)
Hard-float 'f' ABI can't be used for a target that doesn't support the F instruction set extension (ignoring target-abi)
       Fresh rustc-std-workspace-core v1.99.0 (/Users/Luppy/.rustup/toolchains/nightly-x86_64-apple-darwin/lib/rustlib/src/rust/library/rustc-std-workspace-core)
       Fresh compiler_builtins v0.1.39
Hard-float 'f' ABI can't be used for a target that doesn't support the F instruction set extension (ignoring target-abi)
Hard-float 'f' ABI can't be used for a target that doesn't support the F instruction set extension (ignoring target-abi)
Hard-float 'f' ABI can't be used for a target that doesn't support the F instruction set extension (ignoring target-abi)
Hard-float 'f' ABI can't be used for a target that doesn't support the F instruction set extension (ignoring target-abi)
Hard-float 'f' ABI can't be used for a target that doesn't support the F instruction set extension (ignoring target-abi)
Hard-float 'f' ABI can't be used for a target that doesn't support the F instruction set extension (ignoring target-abi)
Hard-float 'f' ABI can't be used for a target that doesn't support the F instruction set extension (ignoring target-abi)
Hard-float 'f' ABI can't be used for a target that doesn't support the F instruction set extension (ignoring target-abi)
Hard-float 'f' ABI can't be used for a target that doesn't support the F instruction set extension (ignoring target-abi)
Hard-float 'f' ABI can't be used for a target that doesn't support the F instruction set extension (ignoring target-abi)
Hard-float 'f' ABI can't be used for a target that doesn't support the F instruction set extension (ignoring target-abi)
Hard-float 'f' ABI can't be used for a target that doesn't support the F instruction set extension (ignoring target-abi)
Hard-float 'f' ABI can't be used for a target that doesn't support the F instruction set extension (ignoring target-abi)
Hard-float 'f' ABI can't be used for a target that doesn't support the F instruction set extension (ignoring target-abi)
Hard-float 'f' ABI can't be used for a target that doesn't support the F instruction set extension (ignoring target-abi)
Hard-float 'f' ABI can't be used for a target that doesn't support the F instruction set extension (ignoring target-abi)
       Fresh app v0.0.1 (/Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/rust)
Hard-float 'f' ABI can't be used for a target that doesn't support the F instruction set extension (ignoring target-abi)
    Finished dev [unoptimized + debuginfo] target(s) in 4.33s
+ popd
~/pinecone/bl_iot_sdk/customer_app/sdk_app_rust
+ ls -l /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/rust/target/riscv32imacf-unknown-none-elf/debug/libapp.a
-rw-r--r--  2 Luppy  staff  4954648 Apr 17 08:25 /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/rust/target/riscv32imacf-unknown-none-elf/debug/libapp.a
+ cp /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/rust/target/riscv32imacf-unknown-none-elf/debug/libapp.a build_out/rust-app/librust-app.a
+ make
use existing version.txt file
LD build_out/sdk_app_rust.elf
Generating BIN File to /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/build_out/sdk_app_rust.bin
Requirement already satisfied: fdt>=0.2.0 in /Library/Frameworks/Python.framework/Versions/3.6/lib/python3.6/site-packages (from -r requirements.txt (line 2)) (0.2.0)
Requirement already satisfied: pycryptodomex>=3.9.8 in /Library/Frameworks/Python.framework/Versions/3.6/lib/python3.6/site-packages (from -r requirements.txt (line 3)) (3.9.9)
Requirement already satisfied: toml>=0.10.2 in /Library/Frameworks/Python.framework/Versions/3.6/lib/python3.6/site-packages (from -r requirements.txt (line 4)) (0.10.2)
Requirement already satisfied: configobj>=5.0.6 in /Library/Frameworks/Python.framework/Versions/3.6/lib/python3.6/site-packages (from -r requirements.txt (line 5)) (5.0.6)
Requirement already satisfied: six in /Users/Luppy/Library/Python/3.6/lib/python/site-packages (from configobj>=5.0.6->-r requirements.txt (line 5)) (1.15.0)
You are using pip version 18.1, however version 21.0.1 is available.
You should consider upgrading via the 'pip install --upgrade pip' command.
========= chip flash id: c84015 =========
/Users/Luppy/pinecone/bl_iot_sdk/image_conf/bl602/flash_select/GD25Q16E_c84015.conf
Generating BIN File to /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/build_out/ota/dts40M_pt2M_boot2release_c84015/FW_OTA.bin
Generating BIN File to /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/build_out/ota/dts40M_pt2M_boot2release_c84015/FW_OTA.bin.ota
Generating BIN File to /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/build_out/ota/dts40M_pt2M_boot2release_c84015/FW_OTA.bin.xz
Generating BIN File to /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/build_out/ota/dts40M_pt2M_boot2release_c84015/FW_OTA.bin.xz.ota
Generating BIN File to /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/build_out/whole_dts40M_pt2M_boot2release_c84015.bin
========= chip flash id: ef6015 =========
/Users/Luppy/pinecone/bl_iot_sdk/image_conf/bl602/flash_select/W25Q16FW_ef6015.conf
Generating BIN File to /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/build_out/ota/dts40M_pt2M_boot2release_ef6015/FW_OTA.bin
Generating BIN File to /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/build_out/ota/dts40M_pt2M_boot2release_ef6015/FW_OTA.bin.ota
Generating BIN File to /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/build_out/ota/dts40M_pt2M_boot2release_ef6015/FW_OTA.bin.xz
Generating BIN File to /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/build_out/ota/dts40M_pt2M_boot2release_ef6015/FW_OTA.bin.xz.ota
Generating BIN File to /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/build_out/whole_dts40M_pt2M_boot2release_ef6015.bin
========= chip flash id: ef4015 =========
/Users/Luppy/pinecone/bl_iot_sdk/image_conf/bl602/flash_select/W25Q16JV_ef4015.conf
Generating BIN File to /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/build_out/ota/dts40M_pt2M_boot2release_ef4015/FW_OTA.bin
Generating BIN File to /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/build_out/ota/dts40M_pt2M_boot2release_ef4015/FW_OTA.bin.ota
Generating BIN File to /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/build_out/ota/dts40M_pt2M_boot2release_ef4015/FW_OTA.bin.xz
Generating BIN File to /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/build_out/ota/dts40M_pt2M_boot2release_ef4015/FW_OTA.bin.xz.ota
Generating BIN File to /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/build_out/whole_dts40M_pt2M_boot2release_ef4015.bin
========= chip flash id: ef7015 =========
/Users/Luppy/pinecone/bl_iot_sdk/image_conf/bl602/flash_select/W25Q16JV_ef7015.conf
Generating BIN File to /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/build_out/ota/dts40M_pt2M_boot2release_ef7015/FW_OTA.bin
Generating BIN File to /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/build_out/ota/dts40M_pt2M_boot2release_ef7015/FW_OTA.bin.ota
Generating BIN File to /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/build_out/ota/dts40M_pt2M_boot2release_ef7015/FW_OTA.bin.xz
Generating BIN File to /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/build_out/ota/dts40M_pt2M_boot2release_ef7015/FW_OTA.bin.xz.ota
Generating BIN File to /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/build_out/whole_dts40M_pt2M_boot2release_ef7015.bin
Building Finish. To flash build output.
+ /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/../../../xpack-riscv-none-embed-gcc/bin/riscv-none-embed-objdump -t -S --demangle --line-numbers --wide build_out/sdk_app_rust.elf
+ cp build_out/sdk_app_rust.bin /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/../../../blflash
+ pushd /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/../../../blflash
~/pinecone/blflash ~/pinecone/bl_iot_sdk/customer_app/sdk_app_rust
+ cargo run flash sdk_app_rust.bin --port /dev/tty.usbserial-1410 --initial-baud-rate 230400 --baud-rate 230400
    Finished dev [unoptimized + debuginfo] target(s) in 0.30s
     Running `target/debug/blflash flash sdk_app_rust.bin --port /dev/tty.usbserial-1410 --initial-baud-rate 230400 --baud-rate 230400`
[INFO  blflash::flasher] Start connection...
[TRACE blflash::flasher] 5ms send count 115
[TRACE blflash::flasher] handshake sent elapsed 98.915µs
[INFO  blflash::flasher] Connection Succeed
[INFO  blflash] Bootrom version: 1
[TRACE blflash] Boot info: BootInfo { len: 14, bootrom_version: 1, otp_info: [0, 0, 0, 0, 3, 0, 0, 0, 61, 9d, c0, 5, b9, 18, 1d, 0] }
[INFO  blflash::flasher] Sending eflash_loader...
[INFO  blflash::flasher] Finished 1.59294599s 17.95KB/s
[TRACE blflash::flasher] 5ms send count 115
[TRACE blflash::flasher] handshake sent elapsed 84.842µs
[INFO  blflash::flasher] Entered eflash_loader
[INFO  blflash::flasher] Skip segment addr: 0 size: 47504 sha256 matches
[INFO  blflash::flasher] Skip segment addr: e000 size: 272 sha256 matches
[INFO  blflash::flasher] Skip segment addr: f000 size: 272 sha256 matches
[INFO  blflash::flasher] Erase flash addr: 10000 size: 95136
[INFO  blflash::flasher] Program flash... d37fe8b9aa354d5513586e363b2ff4ed67f379d67b5b79f327a99905a9be61c1
[INFO  blflash::flasher] Program done 5.215444046s 17.81KB/s
[INFO  blflash::flasher] Skip segment addr: 1f8000 size: 5671 sha256 matches
[INFO  blflash] Success
+ sleep 5
+ popd
~/pinecone/bl_iot_sdk/customer_app/sdk_app_rust
+ open -a CoolTerm
+ exit

# Luppy at Luppys-MBP in ~/pinecone/bl_iot_sdk/customer_app/sdk_app_rust on git:rust ✖︎ [8:29:16]
→ 

#  Custom Targets: 
#  https://docs.rust-embedded.org/embedonomicon/compiler-support.html#built-in-target
#  https://docs.rust-embedded.org/embedonomicon/custom-target.html
rustup target list 
rustc +nightly -Z unstable-options --print target-spec-json --target riscv32imac-unknown-none-elf >riscv32imac-unknown-none-elf.json

{
  "arch": "riscv32",
  "cpu": "generic-rv32",
  "data-layout": "e-m:e-p:32:32-i64:64-n32-S128",
  "eh-frame-header": false,
  "emit-debug-gdb-scripts": false,
  "executables": true,
  "features": "+m,+a,+c",
  "is-builtin": true,
  "linker": "rust-lld",
  "linker-flavor": "ld.lld",
  "llvm-target": "riscv32",
  "max-atomic-width": 32,
  "panic-strategy": "abort",
  "relocation-model": "static",
  "target-pointer-width": "32",
  "unsupported-abis": [
    "cdecl",
    "stdcall",
    "stdcall-unwind",
    "fastcall",
    "vectorcall",
    "thiscall",
    "thiscall-unwind",
    "aapcs",
    "win64",
    "sysv64",
    "ptx-kernel",
    "msp430-interrupt",
    "x86-interrupt",
    "amdgpu-kernel"
  ]
}

rustc +nightly -Z unstable-options --print target-spec-json --target riscv64gc-unknown-none-elf

{
  "arch": "riscv64",
  "code-model": "medium",
  "cpu": "generic-rv64",
  "data-layout": "e-m:e-p:64:64-i64:64-i128:128-n64-S128",
  "eh-frame-header": false,
  "emit-debug-gdb-scripts": false,
  "executables": true,
  "features": "+m,+a,+f,+d,+c",
  "is-builtin": true,
  "linker": "rust-lld",
  "linker-flavor": "ld.lld",
  "llvm-abiname": "lp64d",
  "llvm-target": "riscv64",
  "max-atomic-width": 64,
  "panic-strategy": "abort",
  "relocation-model": "static",
  "target-pointer-width": "64",
  "unsupported-abis": [
    "cdecl",
    "stdcall",
    "stdcall-unwind",
    "fastcall",
    "vectorcall",
    "thiscall",
    "thiscall-unwind",
    "aapcs",
    "win64",
    "sysv64",
    "ptx-kernel",
    "msp430-interrupt",
    "x86-interrupt",
    "amdgpu-kernel"
  ]
}

Rust Build:

cargo build -v \
    --target riscv32imacf-unknown-none-elf.json \
    -Z build-std=core
