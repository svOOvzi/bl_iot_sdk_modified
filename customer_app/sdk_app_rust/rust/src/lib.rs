//!  Main Rust Application for BL602 Firmware
#![no_std]  //  Use the Rust Core Library instead of the Rust Standard Library, which is not compatible with embedded systems

//  Import the Rust Core Library
use core::{
    panic::PanicInfo,  //  Import `PanicInfo` type which is used by `panic()` below
    str::FromStr,      //  For converting `str` to `String`
};

/// `rust_main` will be called by the BL602 command-line interface
#[no_mangle]              //  Don't mangle the name `rust_main`
extern "C" fn rust_main(  //  Declare `extern "C"` because it will be called by BL602 firmware
    _buf:  *const u8,         //  char *
    _len:  i32,               //  int
    _argc: i32,               //  int
    _argv: *const *const u8   //  char **
) {
    //  Display a message
    puts("Hello from Rust!");
}

/// This function is called on panic, like an assertion failure
#[panic_handler]
fn panic(_info: &PanicInfo) -> ! {  //  `!` means that panic handler will never return
    //  TODO: Implement the complete panic handler like this:
    //  https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/rust/app/src/lib.rs#L115-L146

    //  For now we display a message
    puts("TODO: Rust panic"); 

	//  Loop forever, do not pass go, do not collect $200
    loop {}
}

/// Print a message to the serial console
fn puts(s: &str) -> i32 {  //  `&str` is a reference to a string slice, similar to `char *` in C
    extern "C" {  //  Import C Function
        /// Print a message to the serial console (from C stdio library)
        fn puts(s: *const u8) -> i32;
    }

    //  Convert `str` to `String`, which similar to `char [64]` in C
    let mut s_with_null = String::from_str(s)  //  `mut` because we will modify it
        .expect("puts conversion failed");     //  If it exceeds 64 chars, halt with an error
    
    //  Terminate the string with null, since we will be passing to C
    s_with_null.push('\0')
        .expect("puts overflow");  //  If we exceed 64 chars, halt with an error

    //  Convert the null-terminated string to a pointer
    let p = s_with_null.as_str().as_ptr();

    unsafe {     //  Flag this code as unsafe because we're calling a C function
        puts(p)  //  Call the C function to print the message
    }

    //  No semicolon `;` here, so the value returned by the C function will be passed to our caller
}

/// Limit Strings to 64 chars, similar to `char[64]` in C
type String = heapless::String::<heapless::consts::U64>;

/* Output Log

# help
====Build-in Commands====
====Support 4 cmds once, seperate by ; ====
help                     : print this
p                        : print memory
m                        : modify memory
echo                     : echo for command
exit                     : close CLI
devname                  : print device name
sysver                   : system version
reboot                   : reboot system
poweroff                 : poweroff system
reset                    : system reset
time                     : system time
ota                      : system ota
ps                       : thread dump
ls                       : file list
hexdump                  : dump file
cat                      : cat file

====User Commands====
rust_main                : Run Rust code
blogset                  : blog pri set level
blogdump                 : blog info dump
bl_sys_time_now          : sys time now

# rust_main
Hello from Rust!

# rust_main
Hello from Rust!

# rust_main
Hello from Rust!

*/