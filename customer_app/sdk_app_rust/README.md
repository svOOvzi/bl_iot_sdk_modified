# BL602 Rust Firmware

This BL602 firmware executes Rust code by injecting the compiled Rust code into the `rust_app` library...

- [`rust-app`: BL602 Stub Library for Rust Application](../../components/3rdparty/rust-app)

Rust source code for the BL602 firmware is here...

- [`rust`: Rust source code](rust)

Build the BL602 firmware with this Rust build script...

- [`run.sh`: Rust build script](run.sh)

This script uses a Custom Rust Target `riscv32imacf-unknown-none-elf` that sets `llvm-abiname` to `ilp32f` for Single-Precision Hardware Floating-Point...

- [`riscv32imacf-unknown-none-elf.json`: Rust Target for BL602](riscv32imacf-unknown-none-elf.json)

We can't use the standard target `riscv32imac-unknown-none-elf` because...

1. BL602 IoT SDK was compiled with `gcc -march=rv32imfc -mabi=ilp32f`

   (Single-Precision Hardware Floating-Point)

1. Linker fails with error `can't link soft-float modules with single-float modules`

Read the Twitter Thread...

https://twitter.com/MisterTechBlog/status/1383219945308184578
