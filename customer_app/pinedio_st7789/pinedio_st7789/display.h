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

/// Initialise the ST7789 display controller
int init_display(void);

/// Display image on ST7789 display controller
int display_image(void);

/// Switch on backlight
int backlight_on(void);

/// Switch off backlight
int backlight_off(void);

#endif
