#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <assert.h>
#include <cli.h>
#include <bl_adc.h>     //  For BL602 Internal Temperature Sensor
#include <bl602_adc.h>  //  For BL602 ADC Standard Driver
#include <bl602_glb.h>  //  For BL602 Global Register Standard Driver
#include "demo.h"

static int get_tsen_adc(float *temp, uint8_t log_flag);

/// Read BL602 / BL604's Internal Temperature Sensor as Integer
void read_tsen(char *buf, int len, int argc, char **argv) {
    //  Temperature in Celsius
    int16_t temp = 0;

    //  Read the Internal Temperature Sensor as Integer
    int rc = bl_tsen_adc_get(
        &temp,  //  Temperature in Celsius
        1       //  0 to disable logging, 1 to enable logging
    );
    assert(rc == 0);

    //  Show the temperature
    printf("Returned Temperature = %d Celsius\r\n", temp);
}

/// Read BL602 / BL604's Internal Temperature Sensor as Float
void read_tsen2(char *buf, int len, int argc, char **argv) {
    //  Temperature in Celsius
    float temp = 0;

    //  Read the Internal Temperature Sensor as Float
    int rc = get_tsen_adc(
        &temp,  //  Temperature in Celsius
        1       //  0 to disable logging, 1 to enable logging
    );
    assert(rc == 0);

    //  Show the temperature
    printf("Returned Temperature = %f Celsius\r\n", temp);
}

/// Read the Internal Temperature Sensor as Float. Returns 0 if successful.
/// Based on bl_tsen_adc_get in https://github.com/lupyuen/bl_iot_sdk/blob/tsen/components/hal_drv/bl602_hal/bl_adc.c#L224-L282
static int get_tsen_adc(
    float *temp,      //  Pointer to float to store the temperature
    uint8_t log_flag  //  0 to disable logging, 1 to enable logging
) {
    assert(temp != NULL);
    static uint16_t tsen_offset = 0xFFFF;
    float val = 0.0;

    if (0xFFFF == tsen_offset) {
        tsen_offset = 0;
        ADC_CFG_Type adcCfg = {
            .v18Sel=ADC_V18_SEL_1P82V,                /*!< ADC 1.8V select */
            .v11Sel=ADC_V11_SEL_1P1V,                 /*!< ADC 1.1V select */
            .clkDiv=ADC_CLK_DIV_32,                   /*!< Clock divider */
            .gain1=ADC_PGA_GAIN_1,                    /*!< PGA gain 1 */
            .gain2=ADC_PGA_GAIN_1,                    /*!< PGA gain 2 */
            .chopMode=ADC_CHOP_MOD_AZ_PGA_ON,         /*!< ADC chop mode select */
            .biasSel=ADC_BIAS_SEL_MAIN_BANDGAP,       /*!< ADC current form main bandgap or aon bandgap */
            .vcm=ADC_PGA_VCM_1V,                      /*!< ADC VCM value */
            .vref=ADC_VREF_2V,                        /*!< ADC voltage reference */
            .inputMode=ADC_INPUT_SINGLE_END,          /*!< ADC input signal type */
            .resWidth=ADC_DATA_WIDTH_16_WITH_256_AVERAGE,  /*!< ADC resolution and oversample rate */
            .offsetCalibEn=0,                         /*!< Offset calibration enable */
            .offsetCalibVal=0,                        /*!< Offset calibration value */
        };


        ADC_FIFO_Cfg_Type adcFifoCfg = {
            .fifoThreshold = ADC_FIFO_THRESHOLD_1,
            .dmaEn = DISABLE,
        };

        GLB_Set_ADC_CLK(ENABLE,GLB_ADC_CLK_96M, 7);

        ADC_Disable();
        ADC_Enable();

        ADC_Reset();

        ADC_Init(&adcCfg);
        ADC_Channel_Config(ADC_CHAN_TSEN_P, ADC_CHAN_GND, 0);
        ADC_Tsen_Init(ADC_TSEN_MOD_INTERNAL_DIODE);

        ADC_FIFO_Cfg(&adcFifoCfg);

        if (ADC_Trim_TSEN(&tsen_offset) == ERROR) {
            printf("read efuse data failed\r\n");
        }
        assert(ADC_Trim_TSEN(&tsen_offset) != ERROR);
    }
    val = TSEN_Get_Temp(tsen_offset);
    if (log_flag) {
        printf("offset = %d\r\n", tsen_offset);
        printf("temperature = %f Celsius\r\n", val);
    }

    if (temp) {
        *temp = val;
    }

    return 0;
}

///////////////////////////////////////////////////////////////////////////////
//  Command Line Interface

/// List of commands. STATIC_CLI_CMD_ATTRIBUTE makes this(these) command(s) static
const static struct cli_command cmds_user[] STATIC_CLI_CMD_ATTRIBUTE = {
    {"read_tsen",        "Read internal temperature sensor (integer)",          read_tsen},
    {"read_tsen2",       "Read internal temperature sensor (float)",            read_tsen2},
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


# read_tsen
[     11706][[32mINFO  [0m: bl_adc.c: 269] offset = 2175
temperature = 41.790276 Celsius
Returned Temperature = 41 Celsius

# read_tsen2
offset = 2175
temperature = -54.043594 Celsius
Returned Temperature = -54.043594 Celsius

# read_tsen
temperature = 44.756866 Celsius
Returned Temperature = 44 Celsius

# read_tsen2
offset = 2175
temperature = 42.951115 Celsius
Returned Temperature = 42.951115 Celsius

# read_tsen2
offset = 2175
temperature = 42.048241 Celsius
Returned Temperature = 42.048241 Celsius

# read_tsen2
offset = 2175
temperature = 44.369923 Celsius
Returned Temperature = 44.369923 Celsius

# read_tsen2
offset = 2175
temperature = 42.048241 Celsius
Returned Temperature = 42.048241 Celsius

# read_tsen2
offset = 2175
temperature = 43.209080 Celsius
Returned Temperature = 43.209080 Celsius
*/