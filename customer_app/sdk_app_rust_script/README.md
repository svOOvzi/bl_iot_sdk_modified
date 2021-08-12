# Rust Scripting Firmware for BL602 IoT SDK and WebAssembly

Based on Rhai Scripting Engine.

Sorry it doesn't work on BL602, seems to run out of stack space...

```text
# rust_main
Hello from Rust!
Exception Entry--->>>
mcause 38000002, mepc 23035e68, mtval 00000000
Exception code: 2
  msg: Illegal instruction
=== backtrace start ===
backtrace: 0x23009466
backtrace: 0x23008252
backtrace: 0x23035e6c   <--- TRAP
backtrace: 0x231e7000
Exception Entry--->>>
mcause 30000005, mepc 2305955c, mtval fffffffd
Exception code: 5
  msg: Load access fault
backtrace nested...
```

To build, flash and run the firmware...

```bash
# Build, flash and run the firmware
./run.sh

# To build the Rust Project for BL602:
cd rust
cargo build --target ../riscv32imacf-unknown-none-elf.json -Z build-std=core,alloc

# To build the Rust Project for WebAssembly:
cd rust
cargo build --target wasm32-unknown-emscripten
```
