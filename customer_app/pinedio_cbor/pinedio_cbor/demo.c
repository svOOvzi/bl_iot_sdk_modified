#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <assert.h>
#include <cli.h>
#include "cbor.h"     //  For Tiny CBOR Library
#include "demo.h"

/// Test CBOR Encoding
void test_cbor(char *buf, int len, int argc, char **argv) {
    //  Encode with CBOR: { "t": 1234 }
    //  Max output size is 50 bytes (which fits in a LoRa packet)
    uint8_t output[50];

    //  Our CBOR Encoder and Map Encoder
    CborEncoder encoder, mapEncoder;

    //  Init our CBOR Encoder
    cbor_encoder_init(
        &encoder,        //  CBOR Encoder
        output,          //  Output Buffer
        sizeof(output),  //  Output Buffer Size
        0                //  Options
    );

    //  Create a Map Encoder that maps keys to values
    CborError res = cbor_encoder_create_map(
        &encoder,     //  CBOR Encoder
        &mapEncoder,  //  Map Encoder
        1             //  Number of Key-Value Pairs
    );    
    assert(res == CborNoError);

    //  First Key-Value Pair: Map the Key
    res = cbor_encode_text_stringz(
        &mapEncoder,  //  Map Encoder
        "t"           //  Key
    );    
    assert(res == CborNoError);

    //  First Key-Value Pair: Map the Value
    res = cbor_encode_int(
        &mapEncoder,  //  Map Encoder 
        1234          //  Value
    );
    assert(res == CborNoError);

    //  Close the Map Encoder
    res = cbor_encoder_close_container(
        &encoder,    //  CBOR Encoder
        &mapEncoder  //  Map Encoder
    );
    assert(res == CborNoError);

    //  Dump the encoded CBOR output
    for (int i = 0; i < sizeof(output); i++) {
        printf("  0x%02x\r\n", output[i]);
    }
}

///////////////////////////////////////////////////////////////////////////////
//  Command Line Interface

/// List of commands. STATIC_CLI_CMD_ATTRIBUTE makes this(these) command(s) static
const static struct cli_command cmds_user[] STATIC_CLI_CMD_ATTRIBUTE = {
    {"test_cbor",        "Test CBOR Encoding",          test_cbor},
};                                                                                   

/// Init the command-line interface
int cli_init(void)
{
   //  To run a command at startup, do this...
   //  command_name("", 0, 0, NULL);
   return 0;
}

/// TODO: We now show assertion failures in development.
/// For production, comment out this function to use the system default,
/// which loops forever without messages.
void __assert_func(const char *file, int line, const char *func, const char *failedexpr)
{
    //  Show the assertion failure, file, line, function name
	printf("Assertion Failed \"%s\": file \"%s\", line %d%s%s\r\n",
        failedexpr, file, line, func ? ", function: " : "",
        func ? func : "");
	//  Loop forever, do not pass go, do not collect $200
	for (;;) {}
}

///////////////////////////////////////////////////////////////////////////////
//  Dump Stack

/// Dump the current stack
void dump_stack(void)
{
    //  For getting the Stack Frame Pointer. Must be first line of function.
    uintptr_t *fp;

    //  Fetch the Stack Frame Pointer. Based on backtrace_riscv from
    //  https://github.com/bouffalolab/bl_iot_sdk/blob/master/components/bl602/freertos_riscv_ram/panic/panic_c.c#L76-L99
    __asm__("add %0, x0, fp" : "=r"(fp));
    printf("dump_stack: frame pointer=%p\r\n", fp);

    //  Dump the stack, starting at Stack Frame Pointer - 1
    printf("=== stack start ===\r\n");
    for (int i = 0; i < 128; i++) {
        uintptr_t *ra = (uintptr_t *)*(unsigned long *)(fp - 1);
        printf("@ %p: %p\r\n", fp - 1, ra);
        fp++;
    }
    printf("=== stack end ===\r\n\r\n");
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
test_cbor                   : Blink the LED
blogset                  : blog pri set level
blogdump                 : blog info dump
bl_sys_time_now          : sys time now

# test_cbor
Hello from test_cbor!
# test_cbor
Hello from test_cbor!
# test_cbor
Hello from test_cbor!

*/