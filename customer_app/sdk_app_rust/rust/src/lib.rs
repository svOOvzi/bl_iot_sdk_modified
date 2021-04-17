//!  Main Rust Application for BL602 Firmware
#![no_std]  //  Use the Rust Core Library instead of the Rust Standard Library, which is not compatible with embedded systems

//  Declare the system modules
use core::panic::PanicInfo;  //  Import `PanicInfo` type which is used by `panic()` below

/// `rust_main` will be called by the BL602 command-line interface
#[no_mangle]              //  Don't mangle the name `rust_main`
extern "C" fn rust_main(  //  Declare `extern "C"` because it will be called by BL602 firmware
    _buf:  *const u8,         //  char *
    _len:  i32,               //  int
    _argc: i32,               //  int
    _argv: *const *const u8   //  char **
) {
    //  Display a message
    unsafe {   //  Flag this code as unsafe because we're calling a C function
        puts(  //  Call the C function to display a message
            b"Hello from Rust!\r\n\0"  //  Byte string to be printed, terminated by null
            .as_ptr()                  //  Converted to a pointer
        ); 
    }
}

/// This function is called on panic, like an assertion failure
#[panic_handler]
fn panic(_info: &PanicInfo) -> ! {  //  `!` means that panic handler will never return
    //  TODO: Implement the complete panic handler like this:
    //  https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/rust/app/src/lib.rs#L115-L146

    //  For now we display a message
    unsafe {   //  Flag this code as unsafe because we're calling a C function
        puts(  //  Call the C function to display a message
            b"TODO: Rust panic\r\n\0"  //  Byte string to be printed, terminated by null
            .as_ptr()                  //  Converted to a pointer
        ); 
    }

	//  Loop forever, do not pass go, do not collect $200
    loop {}
}

/// Import C Functions
extern "C" {
    /// Print a message to the serial console (from C stdio library)
    fn puts(s: *const u8) -> i32;
}

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