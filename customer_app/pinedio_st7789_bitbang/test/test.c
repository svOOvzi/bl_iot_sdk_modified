#include <inttypes.h>
#include <stdio.h>
#include <assert.h>
#include <bl_gpio.h>
#include "Arduino_ST7789.h"
#include "display.h"

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

    //  Init GFX Driver
    Arduino_SWSPI_Arduino_SWSPI(
        -1,                //  dc
        DISPLAY_CS_PIN,    //  cs
        DISPLAY_SCK_PIN,   //  sck
        DISPLAY_MISO_PIN,  //  mosi
        DISPLAY_MOSI_PIN,  //  miso
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
    for (int16_t x = 0; x < LV_HOR_RES_MAX; x++) {
        for (int16_t y = 0; x < LV_VER_RES_MAX; x++) {
            Arduino_TFT_18bit_writePixelPreclipped(x, y, 0xA0A0);
        }
    }
}

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