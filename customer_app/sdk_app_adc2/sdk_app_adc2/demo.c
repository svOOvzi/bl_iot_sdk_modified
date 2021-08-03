//! Measure the ambient brightness with an LED configured as ADC Input.
//! This version calls the BL602 ADC Low Level HAL.
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <assert.h>
#include <cli.h>
#include <bl602_adc.h>  //  For BL602 ADC Standard Driver
#include <bl_adc.h>     //  For BL602 ADC Hardware Abstraction Layer
#include <bl_dma.h>     //  For BL602 DMA Hardware Abstraction Layer
#include "demo.h"

/// GPIO Pin Number that will be configured as ADC Input.
/// PineCone Blue LED is connected on BL602 GPIO 11.
/// PineCone Green LED is connected on BL602 GPIO 14.
/// Only these GPIOs are supported: 4, 5, 6, 9, 10, 11, 12, 13, 14, 15
/// TODO: Change the GPIO Pin Number for your BL602 board
#define ADC_GPIO 11

/// We set the ADC Frequency to 10 kHz according to <https://wiki.analog.com/university/courses/electronics/electronics-lab-led-sensor?rev=1551786227>
/// This is 10,000 samples per second.
#define ADC_FREQUENCY 10000  //  Hz

/// We shall read 1,000 ADC samples, which will take 0.1 seconds
#define ADC_SAMPLES 1000

/// Set ADC Gain to Level 1 to increase the ADC sensitivity.
/// To disable ADC Gain, set `ADC_GAIN1` and `ADC_GAIN2` to `ADC_PGA_GAIN_NONE`.
/// See <https://github.com/lupyuen/bl_iot_sdk/blob/master/components/bl602/bl602_std/bl602_std/StdDriver/Inc/bl602_adc.h#L133-L144>
#define ADC_GAIN1 ADC_PGA_GAIN_1
#define ADC_GAIN2 ADC_PGA_GAIN_1

/// Enable ADC Gain to increase the ADC sensitivity
static int set_adc_gain(uint32_t gain1, uint32_t gain2);

/// Command to init the ADC Channel and start reading the ADC Samples.
/// Based on `hal_adc_init` in <https://github.com/lupyuen/bl_iot_sdk/blob/master/components/hal_drv/bl602_hal/hal_adc.c#L50-L102>
void init_adc(char *buf, int len, int argc, char **argv) {
    //  Only these GPIOs are supported: 4, 5, 6, 9, 10, 11, 12, 13, 14, 15
    assert(ADC_GPIO==4 || ADC_GPIO==5 || ADC_GPIO==6 || ADC_GPIO==9 || ADC_GPIO==10 || ADC_GPIO==11 || ADC_GPIO==12 || ADC_GPIO==13 || ADC_GPIO==14 || ADC_GPIO==15);

    //  For Single-Channel Conversion Mode, frequency must be between 500 and 16,000 Hz
    assert(ADC_FREQUENCY >= 500 && ADC_FREQUENCY <= 16000);

    //  Init the ADC Frequency for Single-Channel Conversion Mode
    int rc = bl_adc_freq_init(1, ADC_FREQUENCY);
    assert(rc == 0);

    //  Init the ADC GPIO for Single-Channel Conversion Mode
    rc = bl_adc_init(1, ADC_GPIO);
    assert(rc == 0);

    //  Enable ADC Gain to increase the ADC sensitivity
    rc = set_adc_gain(ADC_GAIN1, ADC_GAIN2);
    assert(rc == 0);

    //  Init DMA for the ADC Channel for Single-Channel Conversion Mode
    rc = bl_adc_dma_init(1, ADC_SAMPLES);
    assert(rc == 0);

    //  Configure the GPIO Pin as ADC Input, no pullup, no pulldown
    rc = bl_adc_gpio_init(ADC_GPIO);
    assert(rc == 0);

    //  Get the ADC Channel Number for the GPIO Pin
    int channel = bl_adc_get_channel_by_gpio(ADC_GPIO);

    //  Get the DMA Context for the ADC Channel
    adc_ctx_t *ctx = bl_dma_find_ctx_by_channel(ADC_DMA_CHANNEL);
    assert(ctx != NULL);

    //  Indicate that the GPIO has been configured for ADC
    ctx->chan_init_table |= (1 << channel);

    //  Start reading the ADC via DMA
    bl_adc_start();
}

/// Command to compute the average value of the ADC Samples that have just been read.
/// Based on `hal_adc_get_data` in <https://github.com/lupyuen/bl_iot_sdk/blob/master/components/hal_drv/bl602_hal/hal_adc.c#L142-L179>
void read_adc(char *buf, int len, int argc, char **argv) {
    //  Static array that will store 1,000 ADC Samples
    static uint32_t adc_data[ADC_SAMPLES];

    //  Get the ADC Channel Number for the GPIO Pin
    int channel = bl_adc_get_channel_by_gpio(ADC_GPIO);
    
    //  Get the DMA Context for the ADC Channel
    adc_ctx_t *ctx = bl_dma_find_ctx_by_channel(ADC_DMA_CHANNEL);
    assert(ctx != NULL);

    //  Verify that the GPIO has been configured for ADC
    assert(((1 << channel) & ctx->chan_init_table) != 0);

    //  If ADC Sampling is not finished, try again later    
    if (ctx->channel_data == NULL) {
        printf("ADC Sampling not finished\r\n");
        return;
    }

    //  Copy the read ADC Samples to the static array
    memcpy(
        (uint8_t*) adc_data,             //  Destination
        (uint8_t*) (ctx->channel_data),  //  Source
        sizeof(adc_data)                 //  Size
    );  

    //  Compute the average value of the ADC Samples
    uint32_t sum = 0;
    for (int i = 0; i < ADC_SAMPLES; i++) {
        //  Scale up the ADC Sample to the range 0 to 3199
        uint32_t scaled = ((adc_data[i] & 0xffff) * 3200) >> 16;
        sum += scaled;
    }
    printf("Average: %lu\r\n", (sum / ADC_SAMPLES));
}

/// Enable ADC Gain to increase the ADC sensitivity.
/// Based on ADC_Init in <https://github.com/lupyuen/bl_iot_sdk/blob/master/components/bl602/bl602_std/bl602_std/StdDriver/Src/bl602_adc.c#L152-L230>
static int set_adc_gain(uint32_t gain1, uint32_t gain2) {
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
# init_adc

[In darkness]

# read_adc
Average: 1416

# read_adc
Average: 1416

# read_adc
Average: 1416

[In sunlight]

# read_adc
Average: 1408

# read_adc
Average: 1408

# read_adc
Average: 1408

[In darkness]

# read_adc
Average: 1417

# read_adc
Average: 1416

# read_adc
Average: 1416
*/