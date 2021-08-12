//!  Blink the LED connected to a GPIO Pin

//  TODO: For BL602:
#![no_std]  //  Use the Rust Core Library instead of the Rust Standard Library, which is not compatible with embedded systems
#![feature(alloc_error_handler, start, core_intrinsics, lang_items, link_cfg)]

//  TODO: For WebAssembly:
//  #![feature(libc)]  //  Allow C Standard Library, which will be mapped by emscripten to JavaScript

extern crate alloc;
extern crate wee_alloc;

//  Use `wee_alloc` as the global allocator
#[global_allocator]
static ALLOC: wee_alloc::WeeAlloc = wee_alloc::WeeAlloc::INIT;

//  Import Libraries
use core::{            //  Rust Core Library
    fmt::Write,        //  String Formatting    
};
use rhai::{            //  Rhai Scripting Engine
    Engine, 
    INT
};
use bl602_sdk::{       //  Rust Wrapper for BL602 IoT SDK
    gpio,              //  GPIO HAL
    puts,              //  Console Output
    time_delay,        //  NimBLE Time Functions
    time_ms_to_ticks32,
    String,            //  Strings (limited to 64 chars)
};

/// This function will be called by the BL602 command-line interface
#[no_mangle]              //  Don't mangle the function name
extern "C" fn rust_main(  //  Declare `extern "C"` because it will be called by BL602 firmware
    _result: *mut u8,        //  Result to be returned to command-line interface (char *)
    _len:  i32,              //  Size of result buffer (int)
    _argc: i32,              //  Number of command line args (int)
    _argv: *const *const u8  //  Array of command line args (char **)
) {
    //  Show a message on the serial console
    puts("Hello from Rust!\r\n");

    //  Notice that this is a _raw_ engine.
    //  To do anything useful, load a few packages from `rhai::packages`.
    let engine = Engine::new_raw();

    //  Evaluate a simple Rhai Script: 40 + 2
    let result = engine.eval::<INT>(
        //  Rhai Script to be evaluated
        r#" 
            let a = 40; 
            let b = 2;
            a + b 
        "#
    ).unwrap() as isize;

    //  Format the output and display it
    let mut buf = String::new();
    write!(buf, "Result of Rhai Script: {}", result)
        .expect("buf overflow");
    puts(&buf);

    //  PineCone Blue LED is connected on BL602 GPIO 11
    const LED_GPIO: u8 = 11;  //  `u8` is 8-bit unsigned integer

    //  Configure the LED GPIO for output (instead of input)
    gpio::enable_output(LED_GPIO, 0, 0)        //  No pullup, no pulldown
        .expect("GPIO enable output failed");  //  Halt on error

    //  Blink the LED 5 times
    for i in 0..10 {  //  Iterates 10 times from 0 to 9 (`..` excludes 10)

        //  Toggle the LED GPIO between 0 (on) and 1 (off)
        gpio::output_set(  //  Set the GPIO output (from BL602 GPIO HAL)
            LED_GPIO,      //  GPIO pin number
            i % 2          //  0 for low, 1 for high
        ).expect("GPIO output failed");  //  Halt on error

        //  Sleep 1 second
        time_delay(                   //  Sleep by number of ticks (from NimBLE Porting Layer)
            time_ms_to_ticks32(1000)  //  Convert 1,000 milliseconds to ticks (from NimBLE Porting Layer)
        );
    }

    //  Return to the BL602 command-line interface
}

/// This function is called on panic, like an assertion failure
#[panic_handler]
#[cfg(not(target_arch = "wasm32"))]              //  For WebAssembly: Use the default panic handler
fn panic(_info: &core::panic::PanicInfo) -> ! {  //  `!` means that panic handler will never return
    //  TODO: Implement the complete panic handler like this:
    //  https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/rust/app/src/lib.rs#L115-L146

    //  For now we display a message
    puts("TODO: Rust panic"); 

	//  Loop forever, do not pass go, do not collect $200
    loop {}
}

/// This function is called when the Global Allocator fails
#[alloc_error_handler]
#[cfg(not(target_arch = "wasm32"))]              //  For WebAssembly: Use the default alloc error handler
fn foo(_: core::alloc::Layout) -> ! {
    core::intrinsics::abort();
}

/* Output Log
*/