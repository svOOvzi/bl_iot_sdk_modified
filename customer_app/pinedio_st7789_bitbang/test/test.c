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
    printf("  d:%04x\r\n", color);
    Arduino_SWSPI_write16(color);
    Arduino_SWSPI_endWrite();  ////
}

/// Command to init the display
static void test_display_init(char *buf, int len, int argc, char **argv)
{
    int rc;
    printf("SPI MOSI GPIO:  %d\r\n", DISPLAY_MOSI_PIN);
    printf("SPI MISO GPIO:  %d\r\n", DISPLAY_MISO_PIN);
    printf("SPI SCK GPIO:   %d\r\n", DISPLAY_SCK_PIN);
    printf("SPI CS GPIO:    %d\r\n", DISPLAY_CS_PIN);
    printf("Debug CS GPIO:  %d\r\n", DISPLAY_DEBUG_CS_PIN);
    printf("Unused CS GPIO: %d\r\n", DISPLAY_UNUSED_CS_PIN);
    printf("Flash CS GPIO:  %d\r\n", FLASH_CS_PIN);
    printf("SX1262 CS GPIO: %d\r\n", SX1262_CS_PIN);
    printf("Backlight GPIO: %d\r\n", DISPLAY_BLK_PIN);
    printf("Resolution:     %d x %d\r\n", LV_VER_RES_MAX, LV_HOR_RES_MAX);

    //  Configure SPI pins as GPIO Output Pins (instead of GPIO Input)
    rc = bl_gpio_enable_output(DISPLAY_MOSI_PIN,  0, 0);  assert(rc == 0);
    rc = bl_gpio_enable_output(DISPLAY_MISO_PIN,  0, 0);  assert(rc == 0);
    rc = bl_gpio_enable_output(DISPLAY_SCK_PIN,  0, 0);  assert(rc == 0);

    //  Configure Chip Select, Backlight pins as GPIO Output Pins (instead of GPIO Input)
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
        -1,                //  dc
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
int bl_gpio_output_set(uint8_t pin, uint8_t value) { return 0; }

void main() {
    printf("*** test_display_init\r\n");
    test_display_init("", 0, 0, &"");

    printf("\r\n*** test_display_image\r\n");
    test_display_image("", 0, 0, &"");
}

/* Output Log

+ gcc -o test -D DEBUG_ST7789 -I . -I ../pinedio_st7789_bitbang test.c ../pinedio_st7789_bitbang/Arduino_ST7789.c ../pinedio_st7789_bitbang/Arduino_SWSPI.c
test.c: In function ‘main’:
test.c:113:33: warning: passing argument 4 of ‘test_display_init’ from incompatible pointer type [-Wincompatible-pointer-types]
  113 |     test_display_init("", 0, 0, &"");
      |                                 ^~~
      |                                 |
      |                                 char (*)[1]       
test.c:23:68: note: expected ‘char **’ but argument is of type ‘char (*)[1]’
   23 | t(char *buf, int len, int argc, char **argv)      
      |                                 ~~~~~~~^~~~       

test.c:116:34: warning: passing argument 4 of ‘test_display_image’ from incompatible pointer type [-Wincompatible-pointer-types]
  116 |     test_display_image("", 0, 0, &"");
      |                                  ^~~
      |                                  |
      |                                  char (*)[1]      
test.c:87:69: note: expected ‘char **’ but argument is of type ‘char (*)[1]’
   87 | e(char *buf, int len, int argc, char **argv)      
      |                                 ~~~~~~~^~~~       

In file included from ../pinedio_st7789_bitbang/Arduino_SWSPI.c:12:
../pinedio_st7789_bitbang/Arduino_SWSPI.c: In function ‘Arduino_SWSPI_batchOperation’:
../pinedio_st7789_bitbang/Arduino_SWSPI.c:143:20: warning: format ‘%d’ expects argument of type ‘int’, but argument 2 has type ‘size_t’ {aka ‘long unsigned int’} [-Wformat=] 
  143 |       debug_st7789("Unknown operation id at %d: %d", i, batch[i]);
      |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  ~
      |                                                      |
      |                                                      size_t {aka long unsigned int}
../pinedio_st7789_bitbang/Arduino_ST7789.h:105:34: note: in definition of macro ‘debug_st7789’
  105 | #define debug_st7789(...) printf(__VA_ARGS__)     
      |                                  ^~~~~~~~~~~      
../pinedio_st7789_bitbang/Arduino_SWSPI.c:143:46: note: format string is defined here
  143 | debug_st7789("Unknown operation id at %d: %d", i, batch[i]);
      |                                       ~^
      |                                        |
      |                                        int        
      |                                       %ld
+ ./test
*** test_display_init
SPI MOSI GPIO:  17
SPI MISO GPIO:  0
SPI SCK GPIO:   11
SPI CS GPIO:    20
Debug CS GPIO:  5
Unused CS GPIO: 8
Flash CS GPIO:  14
SX1262 CS GPIO: 15
Backlight GPIO: 21
Resolution:     10 x 5
Set Flash CS pin 14 to high
Set SX1262 CS pin 15 to high
Set CS pin 20 to high
Set Debug CS pin 5 to high
c:01
+ cs 20 enable
+ cs2 5 enable
- cs 20 disable
- cs2 5 disable
Sleep 120 ms
+ cs 20 enable
+ cs2 5 enable
c:11
- cs 20 disable
- cs2 5 disable
Sleep 120 ms
+ cs 20 enable
+ cs2 5 enable
c:3a
  d:55
c:36
  d:00
c:b2
  d:0c
  d:0c
  d:00
  d:33
  d:33
c:b7
  d:35
c:bb
  d:19
c:c0
  d:2c
c:c2
  d:01
c:c3
  d:12
c:c4
  d:20
c:c6
  d:0f
c:d0
  d:a4
  d:a1
c:e0
  d:f0
  d:09
  d:13
  d:12
  d:12
  d:2b
  d:3c
  d:44
  d:4b
  d:1b
  d:18
  d:17
  d:1d
  d:21
c:e1
  d:f0
  d:09
  d:13
  d:0c
  d:0d
  d:27
  d:3b
  d:44
  d:4d
  d:0b
  d:17
  d:17
  d:1d
  d:21
c:13
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ cs 20 enable
+ cs2 5 enable
c:29
- cs 20 disable
- cs2 5 disable
MADCTL
c:36
+ cs 20 enable
+ cs2 5 enable
- cs 20 disable
- cs2 5 disable

*** test_display_image
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0000 0000
RASET
c:2b d:0000 0000
RAMWR
c:2c
  d:aaaa
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0001 0001
RAMWR
c:2c
  d:aaaa
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0002 0002
RAMWR
c:2c
  d:aaaa
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0003 0003
RAMWR
c:2c
  d:aaaa
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0004 0004
RAMWR
c:2c
  d:aaaa
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0000 0000
RASET
c:2b d:0001 0001
RAMWR
c:2c
  d:aaaa
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0001 0001
RAMWR
c:2c
  d:aaaa
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0002 0002
RAMWR
c:2c
  d:aaaa
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0003 0003
RAMWR
c:2c
  d:aaaa
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0004 0004
RAMWR
c:2c
  d:aaaa
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0000 0000
RASET
c:2b d:0002 0002
RAMWR
c:2c
  d:aaaa
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0001 0001
RAMWR
c:2c
  d:aaaa
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0002 0002
RAMWR
c:2c
  d:aaaa
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0003 0003
RAMWR
c:2c
  d:aaaa
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0004 0004
RAMWR
c:2c
  d:aaaa
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0000 0000
RASET
c:2b d:0003 0003
RAMWR
c:2c
  d:aaaa
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0001 0001
RAMWR
c:2c
  d:aaaa
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0002 0002
RAMWR
c:2c
  d:aaaa
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0003 0003
RAMWR
c:2c
  d:aaaa
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0004 0004
RAMWR
c:2c
  d:aaaa
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0000 0000
RASET
c:2b d:0004 0004
RAMWR
c:2c
  d:aaaa
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0001 0001
RAMWR
c:2c
  d:aaaa
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0002 0002
RAMWR
c:2c
  d:aaaa
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0003 0003
RAMWR
c:2c
  d:aaaa
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0004 0004
RAMWR
c:2c
  d:aaaa
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0000 0000
RASET
c:2b d:0005 0005
RAMWR
c:2c
  d:aaaa
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0001 0001
RAMWR
c:2c
  d:aaaa
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0002 0002
RAMWR
c:2c
  d:aaaa
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0003 0003
RAMWR
c:2c
  d:aaaa
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0004 0004
RAMWR
c:2c
  d:aaaa
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0000 0000
RASET
c:2b d:0006 0006
RAMWR
c:2c
  d:aaaa
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0001 0001
RAMWR
c:2c
  d:aaaa
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0002 0002
RAMWR
c:2c
  d:aaaa
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0003 0003
RAMWR
c:2c
  d:aaaa
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0004 0004
RAMWR
c:2c
  d:aaaa
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0000 0000
RASET
c:2b d:0007 0007
RAMWR
c:2c
  d:aaaa
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0001 0001
RAMWR
c:2c
  d:aaaa
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0002 0002
RAMWR
c:2c
  d:aaaa
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0003 0003
RAMWR
c:2c
  d:aaaa
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0004 0004
RAMWR
c:2c
  d:aaaa
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0000 0000
RASET
c:2b d:0008 0008
RAMWR
c:2c
  d:aaaa
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0001 0001
RAMWR
c:2c
  d:aaaa
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0002 0002
RAMWR
c:2c
  d:aaaa
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0003 0003
RAMWR
c:2c
  d:aaaa
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0004 0004
RAMWR
c:2c
  d:aaaa
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0000 0000
RASET
c:2b d:0009 0009
RAMWR
c:2c
  d:aaaa
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0001 0001
RAMWR
c:2c
  d:aaaa
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0002 0002
RAMWR
c:2c
  d:aaaa
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0003 0003
RAMWR
c:2c
  d:aaaa
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
+ cs 20 enable
+ cs2 5 enable
CASET
c:2a d:0004 0004
RAMWR
c:2c
  d:aaaa
- cs 20 disable
- cs2 5 disable
Sleep 10 ms
*/