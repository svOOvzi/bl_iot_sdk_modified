# Rust Scripting Firmware for BL602 IoT SDK and WebAssembly

Based on Rhai Scripting Engine.

Sorry it doesn't work on BL602, seems to run out of stack space.

```bash
# For BL602
cargo build --target ../riscv32imacf-unknown-none-elf.json -Z build-std=core,alloc

# For WebAssembly
cargo build --target wasm32-unknown-emscripten
```
