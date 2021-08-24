# PineDio Stack BL604 Firmware for ST7789 Display

Demo Firmware for PineDio Stack BL604 with ST7789 SPI Display Controller in 3-Wire (9-bit) Mode.

Normally we connect to ST7789 in 4-Wire (8-bit) Mode: https://lupyuen.github.io/images/st7789-4wire.jpg

But for PineDio Stack we use 3-Wire (9-bit) Mode: https://lupyuen.github.io/images/st7789-3wire.jpg

This means we will pack 9-bit data into bytes for transmitting over 8-bit SPI.

We will send in multiples of 9 bytes (9 bits x 8), padded with the NOP Command (code 0x00).

TODO: LVGL Graphics Library

See ["PineCone BL602 Blasting Pixels to ST7789 Display with LVGL Library"](https://lupyuen.github.io/articles/display)

At the BL604 Command Prompt, enter...

```text
display_init
display_image
```

Enter `help` to see all commands.
