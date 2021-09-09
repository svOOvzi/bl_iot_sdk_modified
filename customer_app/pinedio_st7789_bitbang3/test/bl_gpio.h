#include <stdint.h>

int bl_gpio_enable_output(uint8_t pin, uint8_t pullup, uint8_t pulldown);
int bl_gpio_enable_input(uint8_t pin, uint8_t pullup, uint8_t pulldown);
int bl_gpio_output_set(uint8_t pin, uint8_t value);

typedef int BL_Err_Type;
typedef uint8_t GLB_GPIO_Type;
typedef uint8_t GLB_GPIO_FUNC_Type;
BL_Err_Type GLB_GPIO_Func_Init(GLB_GPIO_FUNC_Type gpioFun,GLB_GPIO_Type *pinList,uint8_t cnt);

#define SUCCESS 0
#define GPIO_FUN_SWGPIO 0
