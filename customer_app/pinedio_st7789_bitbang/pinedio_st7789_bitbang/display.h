/*
 * Copyright (c) 2020 Bouffalolab.
 *
 * This file is part of
 *     *** Bouffalolab Software Dev Kit ***
 *      (see www.bouffalolab.com).
 *
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 *   1. Redistributions of source code must retain the above copyright notice,
 *      this list of conditions and the following disclaimer.
 *   2. Redistributions in binary form must reproduce the above copyright notice,
 *      this list of conditions and the following disclaimer in the documentation
 *      and/or other materials provided with the distribution.
 *   3. Neither the name of Bouffalo Lab nor the names of its contributors
 *      may be used to endorse or promote products derived from this software
 *      without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
#ifndef __DISPLAY_H__
#define __DISPLAY_H__

/* Connect PineDio Stack to ST7789 SPI Display
| BL602 Pin     | ST7789 SPI
|:--------------|:--------------------
| __`GPIO 21`__ | Backlight
| __`GPIO 20`__ | `CS`
| __`GPIO 11`__ | `SCK`
| __`GPIO 0`__  | `MISO`
| __`GPIO 17`__ | `MOSI`
| __`3V3`__     | `3.3V`
| __`GND`__     | `GND`
*/

/// GPIO for Backlight
#define DISPLAY_BLK_PIN  21

/// GPIO for ST7789 SPI Chip Select Pin. We control Chip Select ourselves via GPIO, not SPI.
#define DISPLAY_CS_PIN   20

/// GPIO for ST7789 SPI SCK Pin
#define DISPLAY_SCK_PIN  11

/// GPIO for ST7789 SPI MISO Pin
#define DISPLAY_MISO_PIN  0

/// GPIO for ST7789 SPI MOSI Pin
#define DISPLAY_MOSI_PIN 17

/// GPIO for unused SPI Chip Select Pin. Unused because we control Chip Select ourselves via GPIO, not SPI.
#define DISPLAY_UNUSED_CS_PIN 8

/// For Debug Only: GPIO for SPI Chip Select Pin that is exposed on GPIO Connector and can be connected to Logic Analyser
#define DISPLAY_DEBUG_CS_PIN 5

/// GPIO for SPI Flash Chip Select Pin. We must set this to High to deselect SPI Flash.
#define FLASH_CS_PIN 14

/// GPIO for SX1262 SPI Chip Select Pin. We must set this to High to deselect SX1262.
#define SX1262_CS_PIN 15

/// Maximal horizontal and vertical resolution
////#define LV_HOR_RES_MAX          (240)
#define LV_HOR_RES_MAX          5 ////
////#define LV_VER_RES_MAX          (240)
#define LV_VER_RES_MAX          10 ////

/// Color depth:
/// 1:  1 byte per pixel
/// 8:  RGB332
/// 16: RGB565
/// 32: ARGB8888
#define LV_COLOR_DEPTH     16

/// Number of rows in SPI Transmit and Receive Buffers. Used by display.c and lv_port_disp.c
////#define BUFFER_ROWS             (10)
#define BUFFER_ROWS             (1) ////

/// SPI Buffer for unpacked 8-bit data. We always copy pixels from Flash ROM to RAM
/// before transmitting, because Flash ROM may be too slow for DMA at 4 MHz.
/// Contains 10 rows of 240 pixels of 2 bytes each (16-bit colour).
extern uint8_t spi_unpacked_buf[];

/// Initialise the ST7789 display controller and switch on backlight.
/// Assumes that SPI port 0 has been initialised.
/// Assumes that DISPLAY_CS_PIN, DISPLAY_BLK_PIN, DISPLAY_DEBUG_CS_PIN have been configured for GPIO Output.
int init_display(void);

/// Display image on ST7789 display controller
int display_image(void);

/// Set the ST7789 display window to the coordinates (left, top), (right, bottom)
int set_window(uint8_t left, uint8_t top, uint8_t right, uint8_t bottom);

/// Write unpacked 8-bit ST7789 command and parameters to SPI Buffer. `params` is the array of parameter bytes, `len` is the number of parameters.
int write_command(uint8_t command, const uint8_t *params, uint16_t len);

/// Write unpacked 8-bit ST7789 data to SPI Buffer. `data` is the array of bytes to be transmitted, `len` is the number of bytes.
int write_data(const uint8_t *data, uint16_t len);

/// Transmit the packed SPI Buffer to ST7789
int flush_display(void);

/// Switch on backlight
int backlight_on(void);

/// Switch off backlight
int backlight_off(void);

#endif
