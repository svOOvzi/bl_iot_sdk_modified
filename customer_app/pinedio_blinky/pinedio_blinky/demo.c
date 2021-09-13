#include <stdio.h>
#include <string.h>
#include <assert.h>
#include <cli.h>
#include <bl_gpio.h>     //  For BL602 GPIO Hardware Abstraction Layer
#include "nimble_npl.h"  //  For NimBLE Porting Layer (mulitasking functions)
#include "demo.h"

/// PineDio Stack: LCD Backlight is connected on GPIO 21
/// PineCone: Blue LED is connected on GPIO 11
/// TODO: Change the LED GPIO Pin Number for your BL602 / BL604 board
#define LED_GPIO 21

/// Blink the LED
void blinky(char *buf, int len, int argc, char **argv) {
    //  Show a message on the serial console
    puts("Hello from Blinky!");

    //  Configure the LED GPIO for output (instead of input)
    int rc = bl_gpio_enable_output(
        LED_GPIO,  //  GPIO pin number
        0,         //  No GPIO pullup
        0          //  No GPIO pulldown
    );
    assert(rc == 0);  //  Halt on error

    //  Blink the LED 5 times
    for (int i = 0; i < 10; i++) {

        //  Toggle the LED GPIO between 0 (on) and 1 (off)
        rc = bl_gpio_output_set(  //  Set the GPIO output (from BL602 GPIO HAL)
            LED_GPIO,             //  GPIO pin number
            i % 2                 //  0 for low, 1 for high
        );
        assert(rc == 0);  //  Halt on error

        //  Sleep 1 second
        time_delay(                   //  Sleep by number of ticks (from NimBLE Porting Layer)
            time_ms_to_ticks32(1000)  //  Convert 1,000 milliseconds to ticks (from NimBLE Porting Layer)
        );
    }

    //  Return to the command-line interface
}

///////////////////////////////////////////////////////////////////////////////
//  Command Line Interface

/// List of commands. STATIC_CLI_CMD_ATTRIBUTE makes this(these) command(s) static
const static struct cli_command cmds_user[] STATIC_CLI_CMD_ATTRIBUTE = {
    {"blinky",        "Blink the LED",          blinky},
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