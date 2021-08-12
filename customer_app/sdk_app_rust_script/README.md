# Rust Scripting Firmware for BL602 IoT SDK and WebAssembly

Based on Rhai Scripting Engine.

```bash
# For BL602
cargo build --target ../riscv32imacf-unknown-none-elf.json -Z build-std=core,alloc

# For WebAssembly
cargo build --target wasm32-unknown-emscripten
```
