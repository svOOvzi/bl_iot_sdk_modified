//!  Main Rust Application for BL602 Firmware
#![no_std]                              //  Don't link with standard Rust library, which is not compatible with embedded systems
#![feature(trace_macros)]               //  Allow macro tracing: `trace_macros!(true)`
#![feature(concat_idents)]              //  Allow `concat_idents!()` macro used in `coap!()` macro
#![feature(proc_macro_hygiene)]         //  Allow Procedural Macros like `run!()`
#![feature(exclusive_range_pattern)]    //  Allow ranges like `0..128` in `match` statements

//  Declare the system modules
use core::panic::PanicInfo; //  Import `PanicInfo` type which is used by `panic()` below

/// rust_main() will be called by BL602 firmware.
#[no_mangle]              //  Don't mangle the name "main"
extern "C" fn rust_main(  //  Declare extern "C" because it will be called by BL602 firmware
    _buf:  *const u8,         //  char *
    _len:  i32,               //  int
    _argc: i32,               //  int
    _argv: *const *const u8   //  char **
) {
    //  Display a message
    unsafe { puts(b"Hello from Rust!\r\n\0".as_ptr()); }
}

/// This function is called on panic, like an assertion failure. We display the filename and line number and pause in the debugger. From https://os.phil-opp.com/freestanding-rust-binary/
#[panic_handler]
fn panic(_info: &PanicInfo) -> ! {
    unsafe { puts(b"TODO: Rust panic\r\n\0".as_ptr()); }

    /*    
    //  Display the filename and line number.
    console::print("panic ");
    if let Some(location) = info.location() {
        let file = location.file();
        let line = location.line();
        console::print("at ");       console::buffer(&file);
        console::print(" line ");    console::printint(line as i32);
        console::print("\n");        console::flush();
    } else {
        console::print("no loc\n");  console::flush();
    }

    //  Display the payload.
    if unsafe { !IN_PANIC } {  //  Prevent panic loop while displaying the payload
        unsafe { IN_PANIC = true };
        let payload = info.payload().downcast_ref::<&str>().unwrap();
        console::print(payload);  console::print("\n");  console::flush();    
    }

    //  Pause in the debugger.
    bkpt();

    //  Restart the device.
    extern { fn HardFault_Handler(); }  //  Defined in apps/my_sensor_app/src/support.c
    unsafe { HardFault_Handler() };
    */

    //  Will never come here. This is needed to satisfy the return type "!"
    loop {}
}

/// Set to true if we are already in the panic handler
/// static mut IN_PANIC: bool = false;

//  Import C Functions
extern "C" {
    fn puts(s: *const u8) -> i32;
}