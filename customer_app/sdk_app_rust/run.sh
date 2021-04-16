#!/usr/bin/env bash
#  macOS script to build, flash and run BL602 Firmware
#  Install the Rust toolchain like this...
#    rustup default nightly
#    rustup target add riscv32imac-unknown-none-elf
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

#  Rust build options
rust_build_target=riscv32imac-unknown-none-elf
rust_build_options="--target $rust_build_target"
if [ "$rust_build_profile" == 'release' ]; then
    # Build for release
    rust_build_options="--release $rust_build_options"
#  else 
    # Build for debug: No change in options
fi

#  Location of the compiled Rust Static Library
rust_build_dir=$PWD/rust/target/$rust_build_target/$rust_build_profile
rust_app_build=$rust_build_dir/libapp.a

#  Build the firmware with the Rust Stub Library
####make

#  Build the Rust Static Library
pushd rust
rustup default nightly
cargo build -v $rust_build_options
popd

#  TODO: Replace the Rust Stub Library by the Rust Static Library
#  build_out/rust-app/librust-app.a
ls -l $rust_app_build
cp $rust_app_build build_out/rust-app/librust-app.a

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
+ rust_build_target=riscv32imac-unknown-none-elf
+ rust_build_options='--target riscv32imac-unknown-none-elf'
+ '[' debug == release ']'
+ rust_build_dir=/Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/rust/target/riscv32imac-unknown-none-elf/debug
+ rust_app_build=/Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/rust/target/riscv32imac-unknown-none-elf/debug/libapp.a
+ pushd rust
~/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/rust ~/pinecone/bl_iot_sdk/customer_app/sdk_app_rust
+ rustup default nightly
info: using existing install for 'nightly-x86_64-apple-darwin'
info: default toolchain set to 'nightly-x86_64-apple-darwin'

  nightly-x86_64-apple-darwin unchanged - rustc 1.53.0-nightly (7af1f55ae 2021-04-15)

+ cargo build -v --target riscv32imac-unknown-none-elf
       Fresh app v0.0.1 (/Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/rust)
    Finished dev [unoptimized + debuginfo] target(s) in 0.00s
+ popd
~/pinecone/bl_iot_sdk/customer_app/sdk_app_rust
+ ls -l /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/rust/target/riscv32imac-unknown-none-elf/debug/libapp.a
-rw-r--r--  2 Luppy  staff  4752280 Apr 16 20:50 /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/rust/target/riscv32imac-unknown-none-elf/debug/libapp.a
+ cp /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/rust/target/riscv32imac-unknown-none-elf/debug/libapp.a build_out/rust-app/librust-app.a
+ make
use existing version.txt file
LD build_out/sdk_app_rust.elf
/Users/Luppy/pinecone/bl_iot_sdk/toolchain/riscv/Darwin/bin/../lib/gcc/riscv64-unknown-elf/8.3.0/../../../../riscv64-unknown-elf/bin/ld: /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/build_out/rust-app/librust-app.a(compiler_builtins-7de45186cbbf7313.compiler_builtins.43aj66j3-cgu.4.rcgu.o): can't link soft-float modules with single-float modules
/Users/Luppy/pinecone/bl_iot_sdk/toolchain/riscv/Darwin/bin/../lib/gcc/riscv64-unknown-elf/8.3.0/../../../../riscv64-unknown-elf/bin/ld: failed to merge target specific data of file /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/build_out/rust-app/librust-app.a(compiler_builtins-7de45186cbbf7313.compiler_builtins.43aj66j3-cgu.4.rcgu.o)
/Users/Luppy/pinecone/bl_iot_sdk/toolchain/riscv/Darwin/bin/../lib/gcc/riscv64-unknown-elf/8.3.0/../../../../riscv64-unknown-elf/bin/ld: /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/build_out/rust-app/librust-app.a(app-c14d2fba8256e86c.1ja3yi2u2bc6vni7.rcgu.o): can't link soft-float modules with single-float modules
/Users/Luppy/pinecone/bl_iot_sdk/toolchain/riscv/Darwin/bin/../lib/gcc/riscv64-unknown-elf/8.3.0/../../../../riscv64-unknown-elf/bin/ld: failed to merge target specific data of file /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/build_out/rust-app/librust-app.a(app-c14d2fba8256e86c.1ja3yi2u2bc6vni7.rcgu.o)
/Users/Luppy/pinecone/bl_iot_sdk/toolchain/riscv/Darwin/bin/../lib/gcc/riscv64-unknown-elf/8.3.0/../../../../riscv64-unknown-elf/bin/ld: /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/build_out/rust-app/librust-app.a(app-c14d2fba8256e86c.4bbh6x6lgluf79xk.rcgu.o): can't link soft-float modules with single-float modules
/Users/Luppy/pinecone/bl_iot_sdk/toolchain/riscv/Darwin/bin/../lib/gcc/riscv64-unknown-elf/8.3.0/../../../../riscv64-unknown-elf/bin/ld: failed to merge target specific data of file /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/build_out/rust-app/librust-app.a(app-c14d2fba8256e86c.4bbh6x6lgluf79xk.rcgu.o)
/Users/Luppy/pinecone/bl_iot_sdk/toolchain/riscv/Darwin/bin/../lib/gcc/riscv64-unknown-elf/8.3.0/../../../../riscv64-unknown-elf/bin/ld: /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/build_out/rust-app/librust-app.a(compiler_builtins-7de45186cbbf7313.compiler_builtins.43aj66j3-cgu.101.rcgu.o): can't link soft-float modules with single-float modules
/Users/Luppy/pinecone/bl_iot_sdk/toolchain/riscv/Darwin/bin/../lib/gcc/riscv64-unknown-elf/8.3.0/../../../../riscv64-unknown-elf/bin/ld: failed to merge target specific data of file /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/build_out/rust-app/librust-app.a(compiler_builtins-7de45186cbbf7313.compiler_builtins.43aj66j3-cgu.101.rcgu.o)
/Users/Luppy/pinecone/bl_iot_sdk/toolchain/riscv/Darwin/bin/../lib/gcc/riscv64-unknown-elf/8.3.0/../../../../riscv64-unknown-elf/bin/ld: /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/build_out/rust-app/librust-app.a(compiler_builtins-7de45186cbbf7313.compiler_builtins.43aj66j3-cgu.112.rcgu.o): can't link soft-float modules with single-float modules
/Users/Luppy/pinecone/bl_iot_sdk/toolchain/riscv/Darwin/bin/../lib/gcc/riscv64-unknown-elf/8.3.0/../../../../riscv64-unknown-elf/bin/ld: failed to merge target specific data of file /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/build_out/rust-app/librust-app.a(compiler_builtins-7de45186cbbf7313.compiler_builtins.43aj66j3-cgu.112.rcgu.o)
/Users/Luppy/pinecone/bl_iot_sdk/toolchain/riscv/Darwin/bin/../lib/gcc/riscv64-unknown-elf/8.3.0/../../../../riscv64-unknown-elf/bin/ld: /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/build_out/rust-app/librust-app.a(compiler_builtins-7de45186cbbf7313.compiler_builtins.43aj66j3-cgu.122.rcgu.o): can't link soft-float modules with single-float modules
/Users/Luppy/pinecone/bl_iot_sdk/toolchain/riscv/Darwin/bin/../lib/gcc/riscv64-unknown-elf/8.3.0/../../../../riscv64-unknown-elf/bin/ld: failed to merge target specific data of file /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/build_out/rust-app/librust-app.a(compiler_builtins-7de45186cbbf7313.compiler_builtins.43aj66j3-cgu.122.rcgu.o)
/Users/Luppy/pinecone/bl_iot_sdk/toolchain/riscv/Darwin/bin/../lib/gcc/riscv64-unknown-elf/8.3.0/../../../../riscv64-unknown-elf/bin/ld: /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/build_out/rust-app/librust-app.a(compiler_builtins-7de45186cbbf7313.compiler_builtins.43aj66j3-cgu.126.rcgu.o): can't link soft-float modules with single-float modules
/Users/Luppy/pinecone/bl_iot_sdk/toolchain/riscv/Darwin/bin/../lib/gcc/riscv64-unknown-elf/8.3.0/../../../../riscv64-unknown-elf/bin/ld: failed to merge target specific data of file /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/build_out/rust-app/librust-app.a(compiler_builtins-7de45186cbbf7313.compiler_builtins.43aj66j3-cgu.126.rcgu.o)
/Users/Luppy/pinecone/bl_iot_sdk/toolchain/riscv/Darwin/bin/../lib/gcc/riscv64-unknown-elf/8.3.0/../../../../riscv64-unknown-elf/bin/ld: /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/build_out/rust-app/librust-app.a(compiler_builtins-7de45186cbbf7313.compiler_builtins.43aj66j3-cgu.15.rcgu.o): can't link soft-float modules with single-float modules
/Users/Luppy/pinecone/bl_iot_sdk/toolchain/riscv/Darwin/bin/../lib/gcc/riscv64-unknown-elf/8.3.0/../../../../riscv64-unknown-elf/bin/ld: failed to merge target specific data of file /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/build_out/rust-app/librust-app.a(compiler_builtins-7de45186cbbf7313.compiler_builtins.43aj66j3-cgu.15.rcgu.o)
/Users/Luppy/pinecone/bl_iot_sdk/toolchain/riscv/Darwin/bin/../lib/gcc/riscv64-unknown-elf/8.3.0/../../../../riscv64-unknown-elf/bin/ld: /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/build_out/rust-app/librust-app.a(compiler_builtins-7de45186cbbf7313.compiler_builtins.43aj66j3-cgu.26.rcgu.o): can't link soft-float modules with single-float modules
/Users/Luppy/pinecone/bl_iot_sdk/toolchain/riscv/Darwin/bin/../lib/gcc/riscv64-unknown-elf/8.3.0/../../../../riscv64-unknown-elf/bin/ld: failed to merge target specific data of file /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/build_out/rust-app/librust-app.a(compiler_builtins-7de45186cbbf7313.compiler_builtins.43aj66j3-cgu.26.rcgu.o)
/Users/Luppy/pinecone/bl_iot_sdk/toolchain/riscv/Darwin/bin/../lib/gcc/riscv64-unknown-elf/8.3.0/../../../../riscv64-unknown-elf/bin/ld: /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/build_out/rust-app/librust-app.a(compiler_builtins-7de45186cbbf7313.compiler_builtins.43aj66j3-cgu.30.rcgu.o): can't link soft-float modules with single-float modules
/Users/Luppy/pinecone/bl_iot_sdk/toolchain/riscv/Darwin/bin/../lib/gcc/riscv64-unknown-elf/8.3.0/../../../../riscv64-unknown-elf/bin/ld: failed to merge target specific data of file /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/build_out/rust-app/librust-app.a(compiler_builtins-7de45186cbbf7313.compiler_builtins.43aj66j3-cgu.30.rcgu.o)
/Users/Luppy/pinecone/bl_iot_sdk/toolchain/riscv/Darwin/bin/../lib/gcc/riscv64-unknown-elf/8.3.0/../../../../riscv64-unknown-elf/bin/ld: /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/build_out/rust-app/librust-app.a(compiler_builtins-7de45186cbbf7313.compiler_builtins.43aj66j3-cgu.42.rcgu.o): can't link soft-float modules with single-float modules
/Users/Luppy/pinecone/bl_iot_sdk/toolchain/riscv/Darwin/bin/../lib/gcc/riscv64-unknown-elf/8.3.0/../../../../riscv64-unknown-elf/bin/ld: failed to merge target specific data of file /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/build_out/rust-app/librust-app.a(compiler_builtins-7de45186cbbf7313.compiler_builtins.43aj66j3-cgu.42.rcgu.o)
/Users/Luppy/pinecone/bl_iot_sdk/toolchain/riscv/Darwin/bin/../lib/gcc/riscv64-unknown-elf/8.3.0/../../../../riscv64-unknown-elf/bin/ld: /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/build_out/rust-app/librust-app.a(compiler_builtins-7de45186cbbf7313.compiler_builtins.43aj66j3-cgu.65.rcgu.o): can't link soft-float modules with single-float modules
/Users/Luppy/pinecone/bl_iot_sdk/toolchain/riscv/Darwin/bin/../lib/gcc/riscv64-unknown-elf/8.3.0/../../../../riscv64-unknown-elf/bin/ld: failed to merge target specific data of file /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/build_out/rust-app/librust-app.a(compiler_builtins-7de45186cbbf7313.compiler_builtins.43aj66j3-cgu.65.rcgu.o)
/Users/Luppy/pinecone/bl_iot_sdk/toolchain/riscv/Darwin/bin/../lib/gcc/riscv64-unknown-elf/8.3.0/../../../../riscv64-unknown-elf/bin/ld: /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/build_out/rust-app/librust-app.a(compiler_builtins-7de45186cbbf7313.compiler_builtins.43aj66j3-cgu.68.rcgu.o): can't link soft-float modules with single-float modules
/Users/Luppy/pinecone/bl_iot_sdk/toolchain/riscv/Darwin/bin/../lib/gcc/riscv64-unknown-elf/8.3.0/../../../../riscv64-unknown-elf/bin/ld: failed to merge target specific data of file /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/build_out/rust-app/librust-app.a(compiler_builtins-7de45186cbbf7313.compiler_builtins.43aj66j3-cgu.68.rcgu.o)
/Users/Luppy/pinecone/bl_iot_sdk/toolchain/riscv/Darwin/bin/../lib/gcc/riscv64-unknown-elf/8.3.0/../../../../riscv64-unknown-elf/bin/ld: /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/build_out/rust-app/librust-app.a(compiler_builtins-7de45186cbbf7313.compiler_builtins.43aj66j3-cgu.72.rcgu.o): can't link soft-float modules with single-float modules
/Users/Luppy/pinecone/bl_iot_sdk/toolchain/riscv/Darwin/bin/../lib/gcc/riscv64-unknown-elf/8.3.0/../../../../riscv64-unknown-elf/bin/ld: failed to merge target specific data of file /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/build_out/rust-app/librust-app.a(compiler_builtins-7de45186cbbf7313.compiler_builtins.43aj66j3-cgu.72.rcgu.o)
/Users/Luppy/pinecone/bl_iot_sdk/toolchain/riscv/Darwin/bin/../lib/gcc/riscv64-unknown-elf/8.3.0/../../../../riscv64-unknown-elf/bin/ld: /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/build_out/rust-app/librust-app.a(compiler_builtins-7de45186cbbf7313.compiler_builtins.43aj66j3-cgu.81.rcgu.o): can't link soft-float modules with single-float modules
/Users/Luppy/pinecone/bl_iot_sdk/toolchain/riscv/Darwin/bin/../lib/gcc/riscv64-unknown-elf/8.3.0/../../../../riscv64-unknown-elf/bin/ld: failed to merge target specific data of file /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/build_out/rust-app/librust-app.a(compiler_builtins-7de45186cbbf7313.compiler_builtins.43aj66j3-cgu.81.rcgu.o)
/Users/Luppy/pinecone/bl_iot_sdk/toolchain/riscv/Darwin/bin/../lib/gcc/riscv64-unknown-elf/8.3.0/../../../../riscv64-unknown-elf/bin/ld: /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/build_out/rust-app/librust-app.a(compiler_builtins-7de45186cbbf7313.compiler_builtins.43aj66j3-cgu.82.rcgu.o): can't link soft-float modules with single-float modules
/Users/Luppy/pinecone/bl_iot_sdk/toolchain/riscv/Darwin/bin/../lib/gcc/riscv64-unknown-elf/8.3.0/../../../../riscv64-unknown-elf/bin/ld: failed to merge target specific data of file /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/build_out/rust-app/librust-app.a(compiler_builtins-7de45186cbbf7313.compiler_builtins.43aj66j3-cgu.82.rcgu.o)
/Users/Luppy/pinecone/bl_iot_sdk/toolchain/riscv/Darwin/bin/../lib/gcc/riscv64-unknown-elf/8.3.0/../../../../riscv64-unknown-elf/bin/ld: /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/build_out/rust-app/librust-app.a(compiler_builtins-7de45186cbbf7313.compiler_builtins.43aj66j3-cgu.85.rcgu.o): can't link soft-float modules with single-float modules
/Users/Luppy/pinecone/bl_iot_sdk/toolchain/riscv/Darwin/bin/../lib/gcc/riscv64-unknown-elf/8.3.0/../../../../riscv64-unknown-elf/bin/ld: failed to merge target specific data of file /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/build_out/rust-app/librust-app.a(compiler_builtins-7de45186cbbf7313.compiler_builtins.43aj66j3-cgu.85.rcgu.o)
/Users/Luppy/pinecone/bl_iot_sdk/toolchain/riscv/Darwin/bin/../lib/gcc/riscv64-unknown-elf/8.3.0/../../../../riscv64-unknown-elf/bin/ld: /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/build_out/rust-app/librust-app.a(compiler_builtins-7de45186cbbf7313.compiler_builtins.43aj66j3-cgu.88.rcgu.o): can't link soft-float modules with single-float modules
/Users/Luppy/pinecone/bl_iot_sdk/toolchain/riscv/Darwin/bin/../lib/gcc/riscv64-unknown-elf/8.3.0/../../../../riscv64-unknown-elf/bin/ld: failed to merge target specific data of file /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/build_out/rust-app/librust-app.a(compiler_builtins-7de45186cbbf7313.compiler_builtins.43aj66j3-cgu.88.rcgu.o)
/Users/Luppy/pinecone/bl_iot_sdk/toolchain/riscv/Darwin/bin/../lib/gcc/riscv64-unknown-elf/8.3.0/../../../../riscv64-unknown-elf/bin/ld: /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/build_out/rust-app/librust-app.a(compiler_builtins-7de45186cbbf7313.compiler_builtins.43aj66j3-cgu.89.rcgu.o): can't link soft-float modules with single-float modules
/Users/Luppy/pinecone/bl_iot_sdk/toolchain/riscv/Darwin/bin/../lib/gcc/riscv64-unknown-elf/8.3.0/../../../../riscv64-unknown-elf/bin/ld: failed to merge target specific data of file /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/build_out/rust-app/librust-app.a(compiler_builtins-7de45186cbbf7313.compiler_builtins.43aj66j3-cgu.89.rcgu.o)
/Users/Luppy/pinecone/bl_iot_sdk/toolchain/riscv/Darwin/bin/../lib/gcc/riscv64-unknown-elf/8.3.0/../../../../riscv64-unknown-elf/bin/ld: /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/build_out/rust-app/librust-app.a(compiler_builtins-7de45186cbbf7313.compiler_builtins.43aj66j3-cgu.9.rcgu.o): can't link soft-float modules with single-float modules
/Users/Luppy/pinecone/bl_iot_sdk/toolchain/riscv/Darwin/bin/../lib/gcc/riscv64-unknown-elf/8.3.0/../../../../riscv64-unknown-elf/bin/ld: failed to merge target specific data of file /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/build_out/rust-app/librust-app.a(compiler_builtins-7de45186cbbf7313.compiler_builtins.43aj66j3-cgu.9.rcgu.o)
/Users/Luppy/pinecone/bl_iot_sdk/toolchain/riscv/Darwin/bin/../lib/gcc/riscv64-unknown-elf/8.3.0/../../../../riscv64-unknown-elf/bin/ld: /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/build_out/rust-app/librust-app.a(compiler_builtins-7de45186cbbf7313.compiler_builtins.43aj66j3-cgu.95.rcgu.o): can't link soft-float modules with single-float modules
/Users/Luppy/pinecone/bl_iot_sdk/toolchain/riscv/Darwin/bin/../lib/gcc/riscv64-unknown-elf/8.3.0/../../../../riscv64-unknown-elf/bin/ld: failed to merge target specific data of file /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/build_out/rust-app/librust-app.a(compiler_builtins-7de45186cbbf7313.compiler_builtins.43aj66j3-cgu.95.rcgu.o)
/Users/Luppy/pinecone/bl_iot_sdk/toolchain/riscv/Darwin/bin/../lib/gcc/riscv64-unknown-elf/8.3.0/../../../../riscv64-unknown-elf/bin/ld: /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/build_out/rust-app/librust-app.a(compiler_builtins-7de45186cbbf7313.compiler_builtins.43aj66j3-cgu.117.rcgu.o): can't link soft-float modules with single-float modules
/Users/Luppy/pinecone/bl_iot_sdk/toolchain/riscv/Darwin/bin/../lib/gcc/riscv64-unknown-elf/8.3.0/../../../../riscv64-unknown-elf/bin/ld: failed to merge target specific data of file /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/build_out/rust-app/librust-app.a(compiler_builtins-7de45186cbbf7313.compiler_builtins.43aj66j3-cgu.117.rcgu.o)
/Users/Luppy/pinecone/bl_iot_sdk/toolchain/riscv/Darwin/bin/../lib/gcc/riscv64-unknown-elf/8.3.0/../../../../riscv64-unknown-elf/bin/ld: /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/build_out/rust-app/librust-app.a(compiler_builtins-7de45186cbbf7313.compiler_builtins.43aj66j3-cgu.103.rcgu.o): can't link soft-float modules with single-float modules
/Users/Luppy/pinecone/bl_iot_sdk/toolchain/riscv/Darwin/bin/../lib/gcc/riscv64-unknown-elf/8.3.0/../../../../riscv64-unknown-elf/bin/ld: failed to merge target specific data of file /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/build_out/rust-app/librust-app.a(compiler_builtins-7de45186cbbf7313.compiler_builtins.43aj66j3-cgu.103.rcgu.o)
/Users/Luppy/pinecone/bl_iot_sdk/toolchain/riscv/Darwin/bin/../lib/gcc/riscv64-unknown-elf/8.3.0/../../../../riscv64-unknown-elf/bin/ld: /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/build_out/rust-app/librust-app.a(compiler_builtins-7de45186cbbf7313.compiler_builtins.43aj66j3-cgu.71.rcgu.o): can't link soft-float modules with single-float modules
/Users/Luppy/pinecone/bl_iot_sdk/toolchain/riscv/Darwin/bin/../lib/gcc/riscv64-unknown-elf/8.3.0/../../../../riscv64-unknown-elf/bin/ld: failed to merge target specific data of file /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/build_out/rust-app/librust-app.a(compiler_builtins-7de45186cbbf7313.compiler_builtins.43aj66j3-cgu.71.rcgu.o)
collect2: error: ld returned 1 exit status
make: *** [/Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/../../make_scripts_riscv/project.mk:420: /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/build_out/sdk_app_rust.elf] Error 1

# Luppy at Luppys-MBP in ~/pinecone/bl_iot_sdk/customer_app/sdk_app_rust on git:rust ✖︎ [20:56:05]
→ 