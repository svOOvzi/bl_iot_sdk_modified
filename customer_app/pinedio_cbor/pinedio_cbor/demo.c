#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <assert.h>
#include <cli.h>
#include "cbor.h"     //  For Tiny CBOR Library
#include "demo.h"

/// Test CBOR Encoding for { "t": 1234 }
static void test_cbor(char *buf, int len, int argc, char **argv) {
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

    //  How many bytes were encoded
    size_t output_len = cbor_encoder_get_buffer_size(
        &encoder,  //  CBOR Encoder
        output     //  Output Buffer
    );
    printf("CBOR Output: %d bytes\r\n", output_len);

    //  Dump the encoded CBOR output
    for (int i = 0; i < output_len; i++) {
        printf("  0x%02x\r\n", output[i]);
    }
}

/// Test CBOR Encoding for { "t": 1234, "l": 2345 }
static void test_cbor2(char *buf, int len, int argc, char **argv) {
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
        2             //  Number of Key-Value Pairs
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

    //  Second Key-Value Pair: Map the Key
    res = cbor_encode_text_stringz(
        &mapEncoder,  //  Map Encoder
        "l"           //  Key
    );    
    assert(res == CborNoError);

    //  Second Key-Value Pair: Map the Value
    res = cbor_encode_int(
        &mapEncoder,  //  Map Encoder 
        2345          //  Value
    );
    assert(res == CborNoError);

    //  Close the Map Encoder
    res = cbor_encoder_close_container(
        &encoder,    //  CBOR Encoder
        &mapEncoder  //  Map Encoder
    );
    assert(res == CborNoError);

    //  How many bytes were encoded
    size_t output_len = cbor_encoder_get_buffer_size(
        &encoder,  //  CBOR Encoder
        output     //  Output Buffer
    );
    printf("CBOR Output: %d bytes\r\n", output_len);

    //  Dump the encoded CBOR output
    for (int i = 0; i < output_len; i++) {
        printf("  0x%02x\r\n", output[i]);
    }
}

///////////////////////////////////////////////////////////////////////////////
//  Command Line Interface

/// List of commands. STATIC_CLI_CMD_ATTRIBUTE makes this(these) command(s) static
const static struct cli_command cmds_user[] STATIC_CLI_CMD_ATTRIBUTE = {
    {"test_cbor",        "Test CBOR Encoding",          test_cbor},
    {"test_cbor2",       "Test CBOR Encoding",          test_cbor2},
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

# test_cbor
CBOR Output: 6 bytes
  0xa1
  0x61
  0x74
  0x19
  0x04
  0xd2

# test_cbor2
CBOR Output: 11 bytes
  0xa2
  0x61
  0x74
  0x19
  0x04
  0xd2
  0x61
  0x6c
  0x19
  0x09
  0x29

*/