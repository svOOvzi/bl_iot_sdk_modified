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

#  Location of the Stub Library.  We will replace this stub by the Rust Library
#  rust_app_dest will be set to build_out/rust-app/librust-app.a
rust_app_dir=build_out/rust-app
rust_app_dest=$rust_app_dir/librust-app.a

#  Location of the compiled Rust Library
#  rust_app_build will be set to rust/target/riscv32imacf-unknown-none-elf/debug/libapp.a
rust_build_dir=$PWD/rust/target/$rust_build_target_folder/$rust_build_profile
rust_app_build=$rust_build_dir/libapp.a

#  Remove the Stub Library if it exists:
#  build_out/rust-app/librust-app.a
if [ -e $rust_app_dest ]; then
    rm $rust_app_dest
fi

#  Remove the Rust Library if it exists:
#  rust/target/riscv32imacf-unknown-none-elf/debug/libapp.a
if [ -e $rust_app_build ]; then
    rm $rust_app_build
fi

#  Build the firmware with the Stub Library
make

#  Build the Rust Library
pushd rust
rustup default nightly
cargo build -v $rust_build_options
popd

#  Replace the Stub Library by the compiled Rust Library
#  Stub Library: build_out/rust-app/librust-app.a
#  Rust Library: rust/target/riscv32imacf-unknown-none-elf/debug/libapp.a
ls -l $rust_app_build
cp $rust_app_build $rust_app_dest

#  Link the Rust Library to the firmware
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
   Compiling core v0.0.0 (/Users/Luppy/.rustup/toolchains/nightly-x86_64-apple-darwin/lib/rustlib/src/rust/library/core)
   Compiling compiler_builtins v0.1.39
     Running `rustc --crate-name core --edition=2018 /Users/Luppy/.rustup/toolchains/nightly-x86_64-apple-darwin/lib/rustlib/src/rust/library/core/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts --crate-type lib --emit=dep-info,metadata,link -C embed-bitcode=no -C debuginfo=2 -C metadata=9edda56de6439919 -C extra-filename=-9edda56de6439919 --out-dir /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/rust/target/riscv32imacf-unknown-none-elf/debug/deps --target /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/riscv32imacf-unknown-none-elf.json -Z force-unstable-if-unmarked -L dependency=/Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/rust/target/riscv32imacf-unknown-none-elf/debug/deps -L dependency=/Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/rust/target/debug/deps --cap-lints allow`
     Running `rustc --crate-name build_script_build /Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/compiler_builtins-0.1.39/build.rs --error-format=json --json=diagnostic-rendered-ansi --crate-type bin --emit=dep-info,link -C embed-bitcode=no -C split-debuginfo=unpacked -C debuginfo=2 --cfg 'feature="compiler-builtins"' --cfg 'feature="core"' --cfg 'feature="default"' --cfg 'feature="rustc-dep-of-std"' -C metadata=691870a7e1a269a9 -C extra-filename=-691870a7e1a269a9 --out-dir /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/rust/target/debug/build/compiler_builtins-691870a7e1a269a9 -Z force-unstable-if-unmarked -L dependency=/Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/rust/target/debug/deps --cap-lints allow`
     Running `/Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/rust/target/debug/build/compiler_builtins-691870a7e1a269a9/build-script-build`
   Compiling rustc-std-workspace-core v1.99.0 (/Users/Luppy/.rustup/toolchains/nightly-x86_64-apple-darwin/lib/rustlib/src/rust/library/rustc-std-workspace-core)
     Running `rustc --crate-name rustc_std_workspace_core --edition=2018 /Users/Luppy/.rustup/toolchains/nightly-x86_64-apple-darwin/lib/rustlib/src/rust/library/rustc-std-workspace-core/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts --crate-type lib --emit=dep-info,metadata,link -C embed-bitcode=no -C debuginfo=2 -C metadata=9bd4312ef6ed2715 -C extra-filename=-9bd4312ef6ed2715 --out-dir /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/rust/target/riscv32imacf-unknown-none-elf/debug/deps --target /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/riscv32imacf-unknown-none-elf.json -Z force-unstable-if-unmarked -L dependency=/Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/rust/target/riscv32imacf-unknown-none-elf/debug/deps -L dependency=/Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/rust/target/debug/deps --extern core=/Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/rust/target/riscv32imacf-unknown-none-elf/debug/deps/libcore-9edda56de6439919.rmeta --cap-lints allow`
     Running `rustc --crate-name compiler_builtins /Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/compiler_builtins-0.1.39/src/lib.rs --error-format=json --json=diagnostic-rendered-ansi --crate-type lib --emit=dep-info,metadata,link -C embed-bitcode=no -C debuginfo=2 --cfg 'feature="compiler-builtins"' --cfg 'feature="core"' --cfg 'feature="default"' --cfg 'feature="rustc-dep-of-std"' -C metadata=1fb19bfc5f340e89 -C extra-filename=-1fb19bfc5f340e89 --out-dir /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/rust/target/riscv32imacf-unknown-none-elf/debug/deps --target /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/riscv32imacf-unknown-none-elf.json -Z force-unstable-if-unmarked -L dependency=/Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/rust/target/riscv32imacf-unknown-none-elf/debug/deps -L dependency=/Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/rust/target/debug/deps --extern core=/Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/rust/target/riscv32imacf-unknown-none-elf/debug/deps/librustc_std_workspace_core-9bd4312ef6ed2715.rmeta --cap-lints allow --cfg 'feature="unstable"' --cfg 'feature="mem"'`
   Compiling app v0.0.1 (/Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/rust)
     Running `rustc --crate-name app --edition=2018 src/lib.rs --error-format=json --json=diagnostic-rendered-ansi --crate-type staticlib --emit=dep-info,link -C embed-bitcode=no -C debuginfo=2 --cfg 'feature="default"' -C metadata=f850a6e7fbc8f08b -C extra-filename=-f850a6e7fbc8f08b --out-dir /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/rust/target/riscv32imacf-unknown-none-elf/debug/deps --target /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/riscv32imacf-unknown-none-elf.json -C incremental=/Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/rust/target/riscv32imacf-unknown-none-elf/debug/incremental -L dependency=/Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/rust/target/riscv32imacf-unknown-none-elf/debug/deps -L dependency=/Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/rust/target/debug/deps --extern 'noprelude:compiler_builtins=/Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/rust/target/riscv32imacf-unknown-none-elf/debug/deps/libcompiler_builtins-1fb19bfc5f340e89.rlib' --extern 'noprelude:core=/Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/rust/target/riscv32imacf-unknown-none-elf/debug/deps/libcore-9edda56de6439919.rlib' -Z unstable-options`
    Finished dev [unoptimized + debuginfo] target(s) in 20.04s
+ popd
~/pinecone/bl_iot_sdk/customer_app/sdk_app_rust
+ ls -l /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/rust/target/riscv32imacf-unknown-none-elf/debug/libapp.a
-rw-r--r--  2 Luppy  staff  4955264 Apr 17 12:10 /Users/Luppy/pinecone/bl_iot_sdk/customer_app/sdk_app_rust/rust/target/riscv32imacf-unknown-none-elf/debug/libapp.a
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
+ cargo run flash sdk_app_rust.bin --port '/dev/tty.usbserial-14*' --initial-baud-rate 230400 --baud-rate 230400
    Finished dev [unoptimized + debuginfo] target(s) in 0.45s
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

Rust Build:

cargo build -v \
    --target riscv32imacf-unknown-none-elf.json \
    -Z build-std=core
