#include <inttypes.h>
#include <stdio.h>
#include <assert.h>
#include <bl_gpio.h>
#include "Arduino_ST7789.h"
#include "display.h"

///////////////////////////////////////////////////////////////////////////////
//  Begin Common Code

/// Write a pixel to the display.
/// From https://github.com/moononournation/Arduino_GFX/blob/master/src/Arduino_TFT.cpp#L49-L53
static void Arduino_TFT_writePixelPreclipped(int16_t x, int16_t y, uint16_t color)
{
    Arduino_SWSPI_beginWrite();  ////
    Arduino_ST7789_writeAddrWindow(x, y, 1, 1);
    debug_st7789("  d:%04x\r\n", color);
    Arduino_SWSPI_write16(color);
    Arduino_SWSPI_endWrite();  ////
}

/// Command to init the display
static void test_display_init(char *buf, int len, int argc, char **argv)
{
    int rc;
    printf("Display DC GPIO: %d\r\n", DISPLAY_DC_PIN);
    printf("SPI MOSI GPIO:   %d\r\n", DISPLAY_MOSI_PIN);
    printf("SPI MISO GPIO:   %d\r\n", DISPLAY_MISO_PIN);
    printf("SPI SCK GPIO:    %d\r\n", DISPLAY_SCK_PIN);
    printf("SPI CS GPIO:     %d\r\n", DISPLAY_CS_PIN);
    printf("Debug CS GPIO:   %d\r\n", DISPLAY_DEBUG_CS_PIN);
    printf("Unused CS GPIO:  %d\r\n", DISPLAY_UNUSED_CS_PIN);
    printf("Flash CS GPIO:   %d\r\n", FLASH_CS_PIN);
    printf("SX1262 CS GPIO:  %d\r\n", SX1262_CS_PIN);
    printf("Backlight GPIO:  %d\r\n", DISPLAY_BLK_PIN);
    printf("Resolution:     %d x %d\r\n", LV_VER_RES_MAX, LV_HOR_RES_MAX);

    //  Configure Chip Select, Data/Command, MOSI, SCK pins as GPIO Pins
    GLB_GPIO_Type pins[] = {
        DISPLAY_DC_PIN,
        DISPLAY_MOSI_PIN,
        DISPLAY_MISO_PIN,
        DISPLAY_SCK_PIN,
        DISPLAY_CS_PIN,
        DISPLAY_DEBUG_CS_PIN,
        DISPLAY_UNUSED_CS_PIN,
        FLASH_CS_PIN,
        SX1262_CS_PIN,
        DISPLAY_BLK_PIN
    };
    BL_Err_Type rc2 = GLB_GPIO_Func_Init(
        GPIO_FUN_SWGPIO, 
        pins, 
        sizeof(pins) / sizeof(pins[0])
    );
    assert(rc2 == SUCCESS);

    //  Configure MISO as GPIO Input Pin (instead of GPIO Output)
    rc = bl_gpio_enable_input(DISPLAY_MISO_PIN,  0, 0);  assert(rc == 0);

    //  Configure MOSI and SCK pins as GPIO Output Pins (instead of GPIO Input)
    rc = bl_gpio_enable_output(DISPLAY_MOSI_PIN, 0, 0);  assert(rc == 0);
    rc = bl_gpio_enable_output(DISPLAY_SCK_PIN,  0, 0);  assert(rc == 0);

    //  Configure DC, Chip Select, Backlight pins as GPIO Output Pins (instead of GPIO Input)
    rc = bl_gpio_enable_output(DISPLAY_DC_PIN,  0, 0);  assert(rc == 0);
    rc = bl_gpio_enable_output(DISPLAY_CS_PIN,  0, 0);  assert(rc == 0);
    rc = bl_gpio_enable_output(DISPLAY_BLK_PIN, 0, 0);  assert(rc == 0);
    rc = bl_gpio_enable_output(DISPLAY_DEBUG_CS_PIN,  0, 0);  assert(rc == 0);  //  TODO: Remove in production
    rc = bl_gpio_enable_output(FLASH_CS_PIN,  0, 0);  assert(rc == 0);
    rc = bl_gpio_enable_output(SX1262_CS_PIN, 0, 0);  assert(rc == 0);

    //  Set Chip Select pin to High, to deactivate SPI Flash and SX1262
    printf("Set Flash CS pin %d to high\r\n", FLASH_CS_PIN);
    rc = bl_gpio_output_set(FLASH_CS_PIN, 1);  assert(rc == 0);
    printf("Set SX1262 CS pin %d to high\r\n", SX1262_CS_PIN);
    rc = bl_gpio_output_set(SX1262_CS_PIN, 1);  assert(rc == 0);

    //  Set Chip Select pin to High, to deactivate ST7789
    printf("Set CS pin %d to high\r\n", DISPLAY_CS_PIN);
    rc = bl_gpio_output_set(DISPLAY_CS_PIN, 1);  assert(rc == 0);

    //  TODO: Remove Debug CS pin in production
    printf("Set Debug CS pin %d to high\r\n", DISPLAY_DEBUG_CS_PIN);
    rc = bl_gpio_output_set(DISPLAY_DEBUG_CS_PIN, 1);  assert(rc == 0);

    //  Init GFX Driver for Bit-Banging 9-bit data
    Arduino_SWSPI_Arduino_SWSPI(
        DISPLAY_DC_PIN,    //  dc
        DISPLAY_CS_PIN,    //  cs
        DISPLAY_SCK_PIN,   //  sck
        DISPLAY_MOSI_PIN,  //  mosi
        DISPLAY_MISO_PIN,  //  miso
        DISPLAY_DEBUG_CS_PIN  //  cs2
    );
    Arduino_ST7789_Arduino_ST7789(
        -1,     //  rst, 
        0,      //  r
        false,  //  ips
        LV_HOR_RES_MAX,  //  w
        LV_VER_RES_MAX,  //  h
        0, //  col_offset1
        0, //  row_offset1
        0, //  col_offset2
        0  //  row_offset2
    );
    Arduino_ST7789_begin(1000000);
}

/// Command to display image. Should be done after `display_init`
static void test_display_image(char *buf, int len, int argc, char **argv)
{
    //  Call GFX Library to render a box of color 0xAAAA, by Bit-Banging 9-bit data
    for (int16_t y = 0; y < LV_VER_RES_MAX; y++) {
        for (int16_t x = 0; x < LV_HOR_RES_MAX; x++) {
            Arduino_TFT_writePixelPreclipped(x, y, 0xAAAA);
            Arduino_SWSPI_delay(10);
        }
    }
}

//  End Common Code
///////////////////////////////////////////////////////////////////////////////

//  Testing: For Linux only

/// Sleep for the specified milliseconds
void Arduino_SWSPI_delay(uint32_t millisec) {
    printf("Sleep %d ms\r\n", millisec);
}

int bl_gpio_enable_output(uint8_t pin, uint8_t pullup, uint8_t pulldown) { return 0; }
int bl_gpio_enable_input(uint8_t pin, uint8_t pullup, uint8_t pulldown) { return 0; }
int bl_gpio_output_set(uint8_t pin, uint8_t value) { 
  if (pin == 0) { printf("%d\r\n", value); }
  return 0; 
}
BL_Err_Type GLB_GPIO_Func_Init(GLB_GPIO_FUNC_Type gpioFun,GLB_GPIO_Type *pinList,uint8_t cnt) {
    for (int i = 0; i < cnt; i++) { printf("GLB_GPIO_Func_Init %d\r\n", pinList[i]); }
    return SUCCESS;
}

void main() {
    printf("*** test_display_init\r\n");
    test_display_init("", 0, 0, &"");

    printf("\r\n*** test_display_image\r\n");
    test_display_image("", 0, 0, &"");
}

/* Output Log

+ gcc -o test -D DEBUG_ST7789 -I . -I ../pinedio_st7789_bitbang2 test.c ../pinedio_st7789_bitbang2/Arduino_ST7789.c ../pinedio_st7789_bitbang2/Arduino_SWSPI.c
test.c: In function ‘main’:
test.c:145:33: warning: passing argument 4 of ‘test_display_init’ from incompatible pointer type [-Wincompatible-pointer-types]
  145 |     test_display_init("", 0, 0, &"");
      |                                 ^~~
      |                                 |
      |                                 char (*)[1]       
test.c:23:68: note: expected ‘char **’ but argument is of type ‘char (*)[1]’
   23 | t(char *buf, int len, int argc, char **argv)      
      |                                 ~~~~~~~^~~~       

test.c:148:34: warning: passing argument 4 of ‘test_display_image’ from incompatible pointer type [-Wincompatible-pointer-types]
  148 |     test_display_image("", 0, 0, &"");
      |                                  ^~~
      |                                  |
      |                                  char (*)[1]      
test.c:111:69: note: expected ‘char **’ but argument is of type ‘char (*)[1]’
  111 | e(char *buf, int len, int argc, char **argv)      
      |                                 ~~~~~~~^~~~       

In file included from ../pinedio_st7789_bitbang2/Arduino_SWSPI.c:12:
../pinedio_st7789_bitbang2/Arduino_SWSPI.c: In function ‘Arduino_SWSPI_batchOperation’:
../pinedio_st7789_bitbang2/Arduino_SWSPI.c:143:20: warning: format ‘%d’ expects argument of type ‘int’, but argument 2 has type ‘size_t’ {aka ‘long unsigned int’} [-Wformat=]  143 |       debug_st7789("Unknown operation id at %d: %d", i, batch[i]);
      |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  ~
      |                                                      |
      |                                                      size_t {aka long unsigned int}
../pinedio_st7789_bitbang2/Arduino_ST7789.h:105:34: note: 
in definition of macro ‘debug_st7789’
  105 | #define debug_st7789(...) printf(__VA_ARGS__)     
      |                                  ^~~~~~~~~~~      
../pinedio_st7789_bitbang2/Arduino_SWSPI.c:143:46: note: format string is defined here
  143 | debug_st7789("Unknown operation id at %d: %d", i, batch[i]);
      |                                       ~^
      |                                        |
      |                                        int        
      |                                       %ld
+ ./test
*** test_display_init
Display DC GPIO: 17
SPI MOSI GPIO:   0
SPI MISO GPIO:   8
SPI SCK GPIO:    11
SPI CS GPIO:     20
Debug CS GPIO:   5
Unused CS GPIO:  8
Flash CS GPIO:   14
SX1262 CS GPIO:  15
Backlight GPIO:  21
Resolution:     10 x 5
GLB_GPIO_Func_Init 17
GLB_GPIO_Func_Init 0
GLB_GPIO_Func_Init 8
GLB_GPIO_Func_Init 11
GLB_GPIO_Func_Init 20
GLB_GPIO_Func_Init 5
GLB_GPIO_Func_Init 8
GLB_GPIO_Func_Init 14
GLB_GPIO_Func_Init 15
GLB_GPIO_Func_Init 21
Set Flash CS pin 14 to high
Set SX1262 CS pin 15 to high
Set CS pin 20 to high
Set Debug CS pin 5 to high
0
c:01
+ dc 17 data
+ cs 20 enable
+ cs2 5 enable
- dc 17 command
0
0
0
0
0
0
0
1
+ dc 17 data
- cs 20 disable
- cs2 5 disable
Sleep 120 ms
+ dc 17 data
+ cs 20 enable
+ cs2 5 enable
c:11
- dc 17 command
0
0
0
1
0
0
0
1
+ dc 17 data
- cs 20 disable
- cs2 5 disable
Sleep 120 ms
+ dc 17 data
+ cs 20 enable
+ cs2 5 enable
c:3a
- dc 17 command
0
0
1
1
1
0
1
0
+ dc 17 data
  d:55
0
1
0
1
0
1
0
1
c:36
- dc 17 command
0
0
1
1
0
1
1
0
+ dc 17 data
  d:00
0
0
0
0
0
0
0
0
c:b2
- dc 17 command
1
0
1
1
0
0
1
0
+ dc 17 data
  d:0c
0
0
0
0
1
1
0
0
  d:0c
0
0
0
0
1
1
0
0
  d:00
0
0
0
0
0
0
0
0
  d:33
0
0
1
1
0
0
1
1
  d:33
0
0
1
1
0
0
1
1
c:b7
- dc 17 command
1
0
1
1
0
1
1
1
+ dc 17 data
  d:35
0
0
1
1
0
1
0
1
c:bb
- dc 17 command
1
0
1
1
1
0
1
1
+ dc 17 data
  d:19
0
0
0
1
1
0
0
1
c:c0
- dc 17 command
1
1
0
0
0
0
0
0
+ dc 17 data
  d:2c
0
0
1
0
1
1
0
0
c:c2
- dc 17 command
1
1
0
0
0
0
1
0
+ dc 17 data
  d:01
0
0
0
0
0
0
0
1
c:c3
- dc 17 command
1
1
0
0
0
0
1
1
+ dc 17 data
  d:12
0
0
0
1
0
0
1
0
c:c4
- dc 17 command
1
1
0
0
0
1
0
0
+ dc 17 data
  d:20
0
0
1
0
0
0
0
0
c:c6
- dc 17 command
1
1
0
0
0
1
1
0
+ dc 17 data
  d:0f
0
0
0
0
1
1
1
1
c:d0
- dc 17 command
1
1
0
1
0
0
0
0
+ dc 17 data
  d:a4
1
0
1
0
0
1
0
0
  d:a1
1
0
1
0
0
0
0
1
c:e0
- dc 17 command
1
1
1
0
0
0
0
0
+ dc 17 data
  d:f0
1
1
1
1
0
0
0
0
  d:09
0
0
0
0
1
0
0
1
  d:13
0
0
0
1
0
0
1
1
  d:12
0
0
0
1
0
0
1
0
  d:12
0
0
0
1
0
0
1
0
  d:2b
0
0
1
0
1
0
1
1
  d:3c
0
0
1
1
1
1
0
0
  d:44
0
1
0
0
0
1
0
0
  d:4b
0
1
0
0
1
0
1
1
  d:1b
0
0
0
1
1
0
1
1
  d:18
0
0
0
1
1
0
0
0
  d:17
0
0
0
1
0
1
1
1
  d:1d
0
0
0
1
1
1
0
1
  d:21
0
0
1
0
0
0
0
1
c:e1
- dc 17 command
1
1
1
0
0
0
0
1
+ dc 17 data
  d:f0
1
1
1
1
0
0
0
0
  d:09
0
0
0
0
1
0
0
1
  d:13
0
0
0
1
0
0
1
1
  d:0c
0
0
0
0
1
1
0
0
  d:0d
0
0
0
0
1
1
0
1
  d:27
0
0
1
0
0
1
1
1
  d:3b
0
0
1
1
1
0
1
1
  d:44
0
1
0
0
0
1
0
0
  d:4d
0
1
0
0
1
1
0
1
  d:0b
0
0
0
0
1
0
1
1
  d:17
0
0
0
1
0
1
1
1
  d:17
0
0
0
1
0
1
1
1
  d:1d
0
0
0
1
1
1
0
1
  d:21
0
0
1
0
0
0
0
1
c:13
- dc 17 command
0
0
0
1
0
0
1
1
+ dc 17 data
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ dc 17 data
+ cs 20 enable
+ cs2 5 enable
c:29
- dc 17 command
0
0
1
0
1
0
0
1
+ dc 17 data
- cs 20 disable
- cs2 5 disable
MADCTL
c:36
+ dc 17 data
+ cs 20 enable
+ cs2 5 enable
- dc 17 command
0
0
1
1
0
1
1
0
+ dc 17 data
1
1
0
0
0
0
0
0
- cs 20 disable
- cs2 5 disable

*** test_display_image
+ dc 17 data
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0000 0000
- dc 17 command
0
0
1
0
1
0
1
0
+ dc 17 data
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
RASET
c:2b d:0000 0000
- dc 17 command
0
0
1
0
1
0
1
1
+ dc 17 data
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
RAMWR
c:2c
- dc 17 command
0
0
1
0
1
1
0
0
+ dc 17 data
  d:aaaa
1
0
1
0
1
0
1
0
1
0
1
0
1
0
1
0
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ dc 17 data
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0001 0001
- dc 17 command
0
0
1
0
1
0
1
0
+ dc 17 data
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
1
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
1
RAMWR
c:2c
- dc 17 command
0
0
1
0
1
1
0
0
+ dc 17 data
  d:aaaa
1
0
1
0
1
0
1
0
1
0
1
0
1
0
1
0
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ dc 17 data
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0002 0002
- dc 17 command
0
0
1
0
1
0
1
0
+ dc 17 data
0
0
0
0
0
0
0
0
0
0
0
0
0
0
1
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
1
0
RAMWR
c:2c
- dc 17 command
0
0
1
0
1
1
0
0
+ dc 17 data
  d:aaaa
1
0
1
0
1
0
1
0
1
0
1
0
1
0
1
0
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ dc 17 data
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0003 0003
- dc 17 command
0
0
1
0
1
0
1
0
+ dc 17 data
0
0
0
0
0
0
0
0
0
0
0
0
0
0
1
1
0
0
0
0
0
0
0
0
0
0
0
0
0
0
1
1
RAMWR
c:2c
- dc 17 command
0
0
1
0
1
1
0
0
+ dc 17 data
  d:aaaa
1
0
1
0
1
0
1
0
1
0
1
0
1
0
1
0
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ dc 17 data
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0004 0004
- dc 17 command
0
0
1
0
1
0
1
0
+ dc 17 data
0
0
0
0
0
0
0
0
0
0
0
0
0
1
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
1
0
0
RAMWR
c:2c
- dc 17 command
0
0
1
0
1
1
0
0
+ dc 17 data
  d:aaaa
1
0
1
0
1
0
1
0
1
0
1
0
1
0
1
0
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ dc 17 data
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0000 0000
- dc 17 command
0
0
1
0
1
0
1
0
+ dc 17 data
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
RASET
c:2b d:0001 0001
- dc 17 command
0
0
1
0
1
0
1
1
+ dc 17 data
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
1
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
1
RAMWR
c:2c
- dc 17 command
0
0
1
0
1
1
0
0
+ dc 17 data
  d:aaaa
1
0
1
0
1
0
1
0
1
0
1
0
1
0
1
0
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ dc 17 data
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0001 0001
- dc 17 command
0
0
1
0
1
0
1
0
+ dc 17 data
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
1
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
1
RAMWR
c:2c
- dc 17 command
0
0
1
0
1
1
0
0
+ dc 17 data
  d:aaaa
1
0
1
0
1
0
1
0
1
0
1
0
1
0
1
0
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ dc 17 data
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0002 0002
- dc 17 command
0
0
1
0
1
0
1
0
+ dc 17 data
0
0
0
0
0
0
0
0
0
0
0
0
0
0
1
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
1
0
RAMWR
c:2c
- dc 17 command
0
0
1
0
1
1
0
0
+ dc 17 data
  d:aaaa
1
0
1
0
1
0
1
0
1
0
1
0
1
0
1
0
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ dc 17 data
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0003 0003
- dc 17 command
0
0
1
0
1
0
1
0
+ dc 17 data
0
0
0
0
0
0
0
0
0
0
0
0
0
0
1
1
0
0
0
0
0
0
0
0
0
0
0
0
0
0
1
1
RAMWR
c:2c
- dc 17 command
0
0
1
0
1
1
0
0
+ dc 17 data
  d:aaaa
1
0
1
0
1
0
1
0
1
0
1
0
1
0
1
0
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ dc 17 data
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0004 0004
- dc 17 command
0
0
1
0
1
0
1
0
+ dc 17 data
0
0
0
0
0
0
0
0
0
0
0
0
0
1
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
1
0
0
RAMWR
c:2c
- dc 17 command
0
0
1
0
1
1
0
0
+ dc 17 data
  d:aaaa
1
0
1
0
1
0
1
0
1
0
1
0
1
0
1
0
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ dc 17 data
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0000 0000
- dc 17 command
0
0
1
0
1
0
1
0
+ dc 17 data
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
RASET
c:2b d:0002 0002
- dc 17 command
0
0
1
0
1
0
1
1
+ dc 17 data
0
0
0
0
0
0
0
0
0
0
0
0
0
0
1
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
1
0
RAMWR
c:2c
- dc 17 command
0
0
1
0
1
1
0
0
+ dc 17 data
  d:aaaa
1
0
1
0
1
0
1
0
1
0
1
0
1
0
1
0
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ dc 17 data
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0001 0001
- dc 17 command
0
0
1
0
1
0
1
0
+ dc 17 data
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
1
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
1
RAMWR
c:2c
- dc 17 command
0
0
1
0
1
1
0
0
+ dc 17 data
  d:aaaa
1
0
1
0
1
0
1
0
1
0
1
0
1
0
1
0
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ dc 17 data
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0002 0002
- dc 17 command
0
0
1
0
1
0
1
0
+ dc 17 data
0
0
0
0
0
0
0
0
0
0
0
0
0
0
1
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
1
0
RAMWR
c:2c
- dc 17 command
0
0
1
0
1
1
0
0
+ dc 17 data
  d:aaaa
1
0
1
0
1
0
1
0
1
0
1
0
1
0
1
0
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ dc 17 data
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0003 0003
- dc 17 command
0
0
1
0
1
0
1
0
+ dc 17 data
0
0
0
0
0
0
0
0
0
0
0
0
0
0
1
1
0
0
0
0
0
0
0
0
0
0
0
0
0
0
1
1
RAMWR
c:2c
- dc 17 command
0
0
1
0
1
1
0
0
+ dc 17 data
  d:aaaa
1
0
1
0
1
0
1
0
1
0
1
0
1
0
1
0
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ dc 17 data
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0004 0004
- dc 17 command
0
0
1
0
1
0
1
0
+ dc 17 data
0
0
0
0
0
0
0
0
0
0
0
0
0
1
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
1
0
0
RAMWR
c:2c
- dc 17 command
0
0
1
0
1
1
0
0
+ dc 17 data
  d:aaaa
1
0
1
0
1
0
1
0
1
0
1
0
1
0
1
0
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ dc 17 data
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0000 0000
- dc 17 command
0
0
1
0
1
0
1
0
+ dc 17 data
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
RASET
c:2b d:0003 0003
- dc 17 command
0
0
1
0
1
0
1
1
+ dc 17 data
0
0
0
0
0
0
0
0
0
0
0
0
0
0
1
1
0
0
0
0
0
0
0
0
0
0
0
0
0
0
1
1
RAMWR
c:2c
- dc 17 command
0
0
1
0
1
1
0
0
+ dc 17 data
  d:aaaa
1
0
1
0
1
0
1
0
1
0
1
0
1
0
1
0
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ dc 17 data
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0001 0001
- dc 17 command
0
0
1
0
1
0
1
0
+ dc 17 data
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
1
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
1
RAMWR
c:2c
- dc 17 command
0
0
1
0
1
1
0
0
+ dc 17 data
  d:aaaa
1
0
1
0
1
0
1
0
1
0
1
0
1
0
1
0
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ dc 17 data
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0002 0002
- dc 17 command
0
0
1
0
1
0
1
0
+ dc 17 data
0
0
0
0
0
0
0
0
0
0
0
0
0
0
1
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
1
0
RAMWR
c:2c
- dc 17 command
0
0
1
0
1
1
0
0
+ dc 17 data
  d:aaaa
1
0
1
0
1
0
1
0
1
0
1
0
1
0
1
0
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ dc 17 data
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0003 0003
- dc 17 command
0
0
1
0
1
0
1
0
+ dc 17 data
0
0
0
0
0
0
0
0
0
0
0
0
0
0
1
1
0
0
0
0
0
0
0
0
0
0
0
0
0
0
1
1
RAMWR
c:2c
- dc 17 command
0
0
1
0
1
1
0
0
+ dc 17 data
  d:aaaa
1
0
1
0
1
0
1
0
1
0
1
0
1
0
1
0
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ dc 17 data
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0004 0004
- dc 17 command
0
0
1
0
1
0
1
0
+ dc 17 data
0
0
0
0
0
0
0
0
0
0
0
0
0
1
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
1
0
0
RAMWR
c:2c
- dc 17 command
0
0
1
0
1
1
0
0
+ dc 17 data
  d:aaaa
1
0
1
0
1
0
1
0
1
0
1
0
1
0
1
0
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ dc 17 data
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0000 0000
- dc 17 command
0
0
1
0
1
0
1
0
+ dc 17 data
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
RASET
c:2b d:0004 0004
- dc 17 command
0
0
1
0
1
0
1
1
+ dc 17 data
0
0
0
0
0
0
0
0
0
0
0
0
0
1
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
1
0
0
RAMWR
c:2c
- dc 17 command
0
0
1
0
1
1
0
0
+ dc 17 data
  d:aaaa
1
0
1
0
1
0
1
0
1
0
1
0
1
0
1
0
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ dc 17 data
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0001 0001
- dc 17 command
0
0
1
0
1
0
1
0
+ dc 17 data
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
1
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
1
RAMWR
c:2c
- dc 17 command
0
0
1
0
1
1
0
0
+ dc 17 data
  d:aaaa
1
0
1
0
1
0
1
0
1
0
1
0
1
0
1
0
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ dc 17 data
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0002 0002
- dc 17 command
0
0
1
0
1
0
1
0
+ dc 17 data
0
0
0
0
0
0
0
0
0
0
0
0
0
0
1
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
1
0
RAMWR
c:2c
- dc 17 command
0
0
1
0
1
1
0
0
+ dc 17 data
  d:aaaa
1
0
1
0
1
0
1
0
1
0
1
0
1
0
1
0
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ dc 17 data
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0003 0003
- dc 17 command
0
0
1
0
1
0
1
0
+ dc 17 data
0
0
0
0
0
0
0
0
0
0
0
0
0
0
1
1
0
0
0
0
0
0
0
0
0
0
0
0
0
0
1
1
RAMWR
c:2c
- dc 17 command
0
0
1
0
1
1
0
0
+ dc 17 data
  d:aaaa
1
0
1
0
1
0
1
0
1
0
1
0
1
0
1
0
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ dc 17 data
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0004 0004
- dc 17 command
0
0
1
0
1
0
1
0
+ dc 17 data
0
0
0
0
0
0
0
0
0
0
0
0
0
1
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
1
0
0
RAMWR
c:2c
- dc 17 command
0
0
1
0
1
1
0
0
+ dc 17 data
  d:aaaa
1
0
1
0
1
0
1
0
1
0
1
0
1
0
1
0
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ dc 17 data
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0000 0000
- dc 17 command
0
0
1
0
1
0
1
0
+ dc 17 data
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
RASET
c:2b d:0005 0005
- dc 17 command
0
0
1
0
1
0
1
1
+ dc 17 data
0
0
0
0
0
0
0
0
0
0
0
0
0
1
0
1
0
0
0
0
0
0
0
0
0
0
0
0
0
1
0
1
RAMWR
c:2c
- dc 17 command
0
0
1
0
1
1
0
0
+ dc 17 data
  d:aaaa
1
0
1
0
1
0
1
0
1
0
1
0
1
0
1
0
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ dc 17 data
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0001 0001
- dc 17 command
0
0
1
0
1
0
1
0
+ dc 17 data
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
1
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
1
RAMWR
c:2c
- dc 17 command
0
0
1
0
1
1
0
0
+ dc 17 data
  d:aaaa
1
0
1
0
1
0
1
0
1
0
1
0
1
0
1
0
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ dc 17 data
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0002 0002
- dc 17 command
0
0
1
0
1
0
1
0
+ dc 17 data
0
0
0
0
0
0
0
0
0
0
0
0
0
0
1
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
1
0
RAMWR
c:2c
- dc 17 command
0
0
1
0
1
1
0
0
+ dc 17 data
  d:aaaa
1
0
1
0
1
0
1
0
1
0
1
0
1
0
1
0
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ dc 17 data
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0003 0003
- dc 17 command
0
0
1
0
1
0
1
0
+ dc 17 data
0
0
0
0
0
0
0
0
0
0
0
0
0
0
1
1
0
0
0
0
0
0
0
0
0
0
0
0
0
0
1
1
RAMWR
c:2c
- dc 17 command
0
0
1
0
1
1
0
0
+ dc 17 data
  d:aaaa
1
0
1
0
1
0
1
0
1
0
1
0
1
0
1
0
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ dc 17 data
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0004 0004
- dc 17 command
0
0
1
0
1
0
1
0
+ dc 17 data
0
0
0
0
0
0
0
0
0
0
0
0
0
1
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
1
0
0
RAMWR
c:2c
- dc 17 command
0
0
1
0
1
1
0
0
+ dc 17 data
  d:aaaa
1
0
1
0
1
0
1
0
1
0
1
0
1
0
1
0
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ dc 17 data
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0000 0000
- dc 17 command
0
0
1
0
1
0
1
0
+ dc 17 data
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
RASET
c:2b d:0006 0006
- dc 17 command
0
0
1
0
1
0
1
1
+ dc 17 data
0
0
0
0
0
0
0
0
0
0
0
0
0
1
1
0
0
0
0
0
0
0
0
0
0
0
0
0
0
1
1
0
RAMWR
c:2c
- dc 17 command
0
0
1
0
1
1
0
0
+ dc 17 data
  d:aaaa
1
0
1
0
1
0
1
0
1
0
1
0
1
0
1
0
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ dc 17 data
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0001 0001
- dc 17 command
0
0
1
0
1
0
1
0
+ dc 17 data
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
1
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
1
RAMWR
c:2c
- dc 17 command
0
0
1
0
1
1
0
0
+ dc 17 data
  d:aaaa
1
0
1
0
1
0
1
0
1
0
1
0
1
0
1
0
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ dc 17 data
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0002 0002
- dc 17 command
0
0
1
0
1
0
1
0
+ dc 17 data
0
0
0
0
0
0
0
0
0
0
0
0
0
0
1
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
1
0
RAMWR
c:2c
- dc 17 command
0
0
1
0
1
1
0
0
+ dc 17 data
  d:aaaa
1
0
1
0
1
0
1
0
1
0
1
0
1
0
1
0
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ dc 17 data
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0003 0003
- dc 17 command
0
0
1
0
1
0
1
0
+ dc 17 data
0
0
0
0
0
0
0
0
0
0
0
0
0
0
1
1
0
0
0
0
0
0
0
0
0
0
0
0
0
0
1
1
RAMWR
c:2c
- dc 17 command
0
0
1
0
1
1
0
0
+ dc 17 data
  d:aaaa
1
0
1
0
1
0
1
0
1
0
1
0
1
0
1
0
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ dc 17 data
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0004 0004
- dc 17 command
0
0
1
0
1
0
1
0
+ dc 17 data
0
0
0
0
0
0
0
0
0
0
0
0
0
1
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
1
0
0
RAMWR
c:2c
- dc 17 command
0
0
1
0
1
1
0
0
+ dc 17 data
  d:aaaa
1
0
1
0
1
0
1
0
1
0
1
0
1
0
1
0
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ dc 17 data
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0000 0000
- dc 17 command
0
0
1
0
1
0
1
0
+ dc 17 data
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
RASET
c:2b d:0007 0007
- dc 17 command
0
0
1
0
1
0
1
1
+ dc 17 data
0
0
0
0
0
0
0
0
0
0
0
0
0
1
1
1
0
0
0
0
0
0
0
0
0
0
0
0
0
1
1
1
RAMWR
c:2c
- dc 17 command
0
0
1
0
1
1
0
0
+ dc 17 data
  d:aaaa
1
0
1
0
1
0
1
0
1
0
1
0
1
0
1
0
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ dc 17 data
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0001 0001
- dc 17 command
0
0
1
0
1
0
1
0
+ dc 17 data
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
1
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
1
RAMWR
c:2c
- dc 17 command
0
0
1
0
1
1
0
0
+ dc 17 data
  d:aaaa
1
0
1
0
1
0
1
0
1
0
1
0
1
0
1
0
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ dc 17 data
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0002 0002
- dc 17 command
0
0
1
0
1
0
1
0
+ dc 17 data
0
0
0
0
0
0
0
0
0
0
0
0
0
0
1
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
1
0
RAMWR
c:2c
- dc 17 command
0
0
1
0
1
1
0
0
+ dc 17 data
  d:aaaa
1
0
1
0
1
0
1
0
1
0
1
0
1
0
1
0
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ dc 17 data
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0003 0003
- dc 17 command
0
0
1
0
1
0
1
0
+ dc 17 data
0
0
0
0
0
0
0
0
0
0
0
0
0
0
1
1
0
0
0
0
0
0
0
0
0
0
0
0
0
0
1
1
RAMWR
c:2c
- dc 17 command
0
0
1
0
1
1
0
0
+ dc 17 data
  d:aaaa
1
0
1
0
1
0
1
0
1
0
1
0
1
0
1
0
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ dc 17 data
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0004 0004
- dc 17 command
0
0
1
0
1
0
1
0
+ dc 17 data
0
0
0
0
0
0
0
0
0
0
0
0
0
1
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
1
0
0
RAMWR
c:2c
- dc 17 command
0
0
1
0
1
1
0
0
+ dc 17 data
  d:aaaa
1
0
1
0
1
0
1
0
1
0
1
0
1
0
1
0
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ dc 17 data
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0000 0000
- dc 17 command
0
0
1
0
1
0
1
0
+ dc 17 data
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
RASET
c:2b d:0008 0008
- dc 17 command
0
0
1
0
1
0
1
1
+ dc 17 data
0
0
0
0
0
0
0
0
0
0
0
0
1
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
1
0
0
0
RAMWR
c:2c
- dc 17 command
0
0
1
0
1
1
0
0
+ dc 17 data
  d:aaaa
1
0
1
0
1
0
1
0
1
0
1
0
1
0
1
0
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ dc 17 data
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0001 0001
- dc 17 command
0
0
1
0
1
0
1
0
+ dc 17 data
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
1
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
1
RAMWR
c:2c
- dc 17 command
0
0
1
0
1
1
0
0
+ dc 17 data
  d:aaaa
1
0
1
0
1
0
1
0
1
0
1
0
1
0
1
0
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ dc 17 data
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0002 0002
- dc 17 command
0
0
1
0
1
0
1
0
+ dc 17 data
0
0
0
0
0
0
0
0
0
0
0
0
0
0
1
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
1
0
RAMWR
c:2c
- dc 17 command
0
0
1
0
1
1
0
0
+ dc 17 data
  d:aaaa
1
0
1
0
1
0
1
0
1
0
1
0
1
0
1
0
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ dc 17 data
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0003 0003
- dc 17 command
0
0
1
0
1
0
1
0
+ dc 17 data
0
0
0
0
0
0
0
0
0
0
0
0
0
0
1
1
0
0
0
0
0
0
0
0
0
0
0
0
0
0
1
1
RAMWR
c:2c
- dc 17 command
0
0
1
0
1
1
0
0
+ dc 17 data
  d:aaaa
1
0
1
0
1
0
1
0
1
0
1
0
1
0
1
0
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ dc 17 data
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0004 0004
- dc 17 command
0
0
1
0
1
0
1
0
+ dc 17 data
0
0
0
0
0
0
0
0
0
0
0
0
0
1
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
1
0
0
RAMWR
c:2c
- dc 17 command
0
0
1
0
1
1
0
0
+ dc 17 data
  d:aaaa
1
0
1
0
1
0
1
0
1
0
1
0
1
0
1
0
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ dc 17 data
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0000 0000
- dc 17 command
0
0
1
0
1
0
1
0
+ dc 17 data
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
RASET
c:2b d:0009 0009
- dc 17 command
0
0
1
0
1
0
1
1
+ dc 17 data
0
0
0
0
0
0
0
0
0
0
0
0
1
0
0
1
0
0
0
0
0
0
0
0
0
0
0
0
1
0
0
1
RAMWR
c:2c
- dc 17 command
0
0
1
0
1
1
0
0
+ dc 17 data
  d:aaaa
1
0
1
0
1
0
1
0
1
0
1
0
1
0
1
0
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ dc 17 data
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0001 0001
- dc 17 command
0
0
1
0
1
0
1
0
+ dc 17 data
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
1
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
1
RAMWR
c:2c
- dc 17 command
0
0
1
0
1
1
0
0
+ dc 17 data
  d:aaaa
1
0
1
0
1
0
1
0
1
0
1
0
1
0
1
0
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ dc 17 data
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0002 0002
- dc 17 command
0
0
1
0
1
0
1
0
+ dc 17 data
0
0
0
0
0
0
0
0
0
0
0
0
0
0
1
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
1
0
RAMWR
c:2c
- dc 17 command
0
0
1
0
1
1
0
0
+ dc 17 data
  d:aaaa
1
0
1
0
1
0
1
0
1
0
1
0
1
0
1
0
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ dc 17 data
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0003 0003
- dc 17 command
0
0
1
0
1
0
1
0
+ dc 17 data
0
0
0
0
0
0
0
0
0
0
0
0
0
0
1
1
0
0
0
0
0
0
0
0
0
0
0
0
0
0
1
1
RAMWR
c:2c
- dc 17 command
0
0
1
0
1
1
0
0
+ dc 17 data
  d:aaaa
1
0
1
0
1
0
1
0
1
0
1
0
1
0
1
0
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ dc 17 data
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0004 0004
- dc 17 command
0
0
1
0
1
0
1
0
+ dc 17 data
0
0
0
0
0
0
0
0
0
0
0
0
0
1
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
1
0
0
RAMWR
c:2c
- dc 17 command
0
0
1
0
1
1
0
0
+ dc 17 data
  d:aaaa
1
0
1
0
1
0
1
0
1
0
1
0
1
0
1
0
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
*/