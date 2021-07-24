//! Measure the ambient brightness with an LED configured as ADC Input.
//! Calls the Rust functions implemented in customer_app/sdk_app_rust_adc/rust/src/lib.rs
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <assert.h>
#include <cli.h>        //  For BL602 Command-Line Interface
#include <bl602_adc.h>  //  For BL602 ADC Standard Driver
#include "demo.h"

///////////////////////////////////////////////////////////////////////////////
//  Helper Functions Called By Rust

/// Enable ADC Gain to increase the ADC sensitivity.
/// Based on ADC_Init in <https://github.com/lupyuen/bl_iot_sdk/blob/master/components/bl602/bl602_std/bl602_std/StdDriver/Src/bl602_adc.c#L152-L230>
int set_adc_gain(uint32_t gain1, uint32_t gain2) {
    //  Read the ADC Configuration Hardware Register
    uint32_t reg = BL_RD_REG(AON_BASE, AON_GPADC_REG_CONFIG2);

    //  Set the ADC Gain
    reg = BL_SET_REG_BITS_VAL(reg, AON_GPADC_PGA1_GAIN, gain1);
    reg = BL_SET_REG_BITS_VAL(reg, AON_GPADC_PGA2_GAIN, gain2);

    //  Set the ADC Chop Mode
    if (gain1 != ADC_PGA_GAIN_NONE || gain2 != ADC_PGA_GAIN_NONE) {
        reg = BL_SET_REG_BITS_VAL(reg, AON_GPADC_CHOP_MODE, 2);
    } else {
        reg = BL_SET_REG_BITS_VAL(reg, AON_GPADC_CHOP_MODE, 1);        
    }

    //  Enable the ADC PGA
    reg = BL_CLR_REG_BIT(reg, AON_GPADC_PGA_VCMI_EN);
    if (gain1 != ADC_PGA_GAIN_NONE || gain2 != ADC_PGA_GAIN_NONE) {
        reg = BL_SET_REG_BIT(reg, AON_GPADC_PGA_EN);
    } else {
        reg = BL_CLR_REG_BIT(reg, AON_GPADC_PGA_EN);
    }

    //  Update the ADC Configuration Hardware Register
    BL_WR_REG(AON_BASE, AON_GPADC_REG_CONFIG2, reg);
    return 0;
}

///////////////////////////////////////////////////////////////////////////////
//  Command Line Interface

/// Import Rust functions from customer_app/sdk_app_rust_adc/rust/src/lib.rs
void init_adc(char *buf, int len, int argc, char **argv);
void read_adc(char *buf, int len, int argc, char **argv);

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
