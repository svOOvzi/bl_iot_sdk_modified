#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <cli.h>
#include <bl_gpio.h>     //  For BL602 GPIO Hardware Abstraction Layer
#include "nimble_npl.h"  //  For NimBLE Porting Layer (mulitasking functions)
#include "main_functions.h"  //  For TensorFlow Lite
#include "demo.h"

/// Command to init the TensorFlow Model
static void init(char *buf, int len, int argc, char **argv) {
    load_model();
}

/// Command to infer values with TensorFlow Model
static void infer(char *buf, int len, int argc, char **argv) {
    //  Convert the argument to float
    if (argc != 2) { printf("Usage: infer <float>\r\n"); return; }
    float input = atof(argv[1]);

    //  Run the inference
    float result = run_inference(input);

    //  Show the result
    printf("%f\r\n", result);
}

/// TODO: Handle math overflow.
float __math_oflowf (uint32_t sign) {
    assert(false);  //  For now, we halt when there is a math overflow
    //  Previously: return xflowf (sign, 0x1p97f);
    //  From https://code.woboq.org/userspace/glibc/sysdeps/ieee754/flt-32/math_errf.c.html#__math_oflowf
}

/// Global Destructor for C++, which we're not using.
/// See https://alex-robenko.gitbook.io/bare_metal_cpp/compiler_output/static#custom-destructors
void *__dso_handle = NULL;

///////////////////////////////////////////////////////////////////////////////
//  Command Line Interface

/// List of commands. STATIC_CLI_CMD_ATTRIBUTE makes this(these) command(s) static
const static struct cli_command cmds_user[] STATIC_CLI_CMD_ATTRIBUTE = {
    {"init",        "Init Model",        init},
    {"infer",       "Run Inference",     infer},
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

/* Output Log:

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
init                     : Init Model
infer                    : Run Inference
blogset                  : blog pri set level
blogdump                 : blog info dump
bl_sys_time_now          : sys time now

# init

# infer 0.1
0.160969

# infer 0.2
0.262633

# infer 0.3
0.372770
*/