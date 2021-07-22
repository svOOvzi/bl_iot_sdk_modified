#include <stdio.h>
#include <string.h>
#include <assert.h>
#include <cli.h>
#include <hal_adc.h>     //  For BL602 ADC Hardware Abstraction Layer
#include "demo.h"

/// GPIO Pin Number that will be configured as ADC Input.
/// PineCone Blue LED is connected on BL602 GPIO 11.
/// PineCone Green LED is connected on BL602 GPIO 14.
/// Only these GPIOs are supported: 4, 5, 6, 9, 10, 11, 12, 13, 14, 15
/// TODO: Change the GPIO Pin Number for your BL602 board
#define ADC_GPIO 11

/// Init the ADC Channel
void init_adc(char *buf, int len, int argc, char **argv) {
    //  Only these GPIOs are supported: 4, 5, 6, 9, 10, 11, 12, 13, 14, 15
    assert(ADC_GPIO==4 || ADC_GPIO==5 || ADC_GPIO==6 || ADC_GPIO==9 || ADC_GPIO==10 || ADC_GPIO==11 || ADC_GPIO==12 || ADC_GPIO==13 || ADC_GPIO==14 || ADC_GPIO==15);

    //  We set the ADC Frequency to 10 kHz according to https://wiki.analog.com/university/courses/electronics/electronics-lab-led-sensor?rev=1551786227
    //  This is 10,000 samples per second.
    //  We shall read 1000 samples, which will take 0.1 seconds.
    int rc = hal_adc_init(
        1,  //  Single-Channel Conversion Mode
        10000,  //  Frequency
        1000,  //  Number of Samples
        ADC_GPIO  //  GPIO Pin Number
    );
    assert(rc == 0);
}

/// Read the ADC Channel
void read_adc(char *buf, int len, int argc, char **argv) {
    //  Read the ADC Channel via DMA. Returns -1 in case of error.
    int val = hal_adc_get_data(
        ADC_GPIO,  //  GPIO Pin Number
        1  //  Raw Flag
    );
    //  Raw Flag = 0: Returns raw value between 0 to 65535
    //  Raw Flag = 1: Returns scaled value between 0 to 3199
    printf("value=%d\r\n", val);
}

///////////////////////////////////////////////////////////////////////////////
//  Command Line Interface

/// List of commands. STATIC_CLI_CMD_ATTRIBUTE makes this(these) command(s) static
const static struct cli_command cmds_user[] STATIC_CLI_CMD_ATTRIBUTE = {
    {"init_adc",        "Init ADC Channel",          init_adc},
    {"read_adc",        "Read ADC Channel",          read_adc},
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
*/