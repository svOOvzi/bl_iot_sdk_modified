#include <stdio.h>
#include <string.h>
#include <assert.h>
#include <stdbool.h>
#include <cli.h>
#include "ulisp.h"       //  For uLisp Library
#include "demo.h"

/// Command-Line Buffer that will be passed to uLisp
static char cmd_buf[1024] = { 0 };

/// Run a uLisp command
void run_ulisp(char *buf, int len, int argc, char **argv) {
    assert(argc > 0);
    assert(argv[argc - 1] != NULL);

    //  If the last command line arg is `\`, we expect a continuation
    bool to_continue = false;
    if (strcmp(argv[argc - 1], "\\") == 0) {
        to_continue = true;
        argc--;   //  Skip the `\`
    }

    //  Concatenate the command line, separated by spaces
    for (int i = 0; i < argc; i++) {
        assert(argv[i] != NULL);
        strncat(cmd_buf, argv[i], sizeof(cmd_buf) - strlen(cmd_buf) - 1);
        strncat(cmd_buf, " ",     sizeof(cmd_buf) - strlen(cmd_buf) - 1);
    }
    cmd_buf[sizeof(cmd_buf) - 1] = 0;

    //  If this the end of the command line...
    if (!to_continue) {
        //  Execute the command line
        execute_ulisp(cmd_buf);

        //  Erase the buffer
        cmd_buf[0] = 0;
    }
}

///////////////////////////////////////////////////////////////////////////////
//  Command Line Interface

/// List of commands. STATIC_CLI_CMD_ATTRIBUTE makes this(these) command(s) static
const static struct cli_command cmds_user[] STATIC_CLI_CMD_ATTRIBUTE = {
    {"(",        "Run the uLisp command",          run_ulisp},
};                                                                                   

/// Init the command-line interface
int cli_init(void)
{
    setup_ulisp();
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
blinky                   : Blink the LED
blogset                  : blog pri set level
blogdump                 : blog info dump
bl_sys_time_now          : sys time now

# blinky
Hello from Blinky!
# blinky
Hello from Blinky!
# blinky
Hello from Blinky!

*/