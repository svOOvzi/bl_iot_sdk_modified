#!/usr/bin/env bash
#  Test the GFX Driver on Linux

set -e  #  Exit when any command fails
set -x  #  Echo commands

gcc \
    -o test \
    -I . \
    -I ../pinedio_st7789_bitbang \
    test.c \
    ../pinedio_st7789_bitbang/Arduino_ST7789.c \
    ../pinedio_st7789_bitbang/Arduino_SWSPI.c \
    ../pinedio_st7789_bitbang/Arduino_TFT_18bit.c \

./test
