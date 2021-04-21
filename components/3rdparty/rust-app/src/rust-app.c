//  This is a stub library (that contains no code), used for injecting Rust compiled code in the BL602 build.
//  The compiled library will be replaced by the Rust application.
#include <stdio.h>

/// Main function in Rust.
/// TODO: Sync with customer_app/sdk_app_rust/sdk_app_rust/demo.c
void rust_main(char *buf, int len, int argc, char **argv) {
    printf("Build Error: components/3rdparty/rust-app not replaced by Rust compiled code\r\n");
}