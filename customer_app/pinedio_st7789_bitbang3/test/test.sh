#!/usr/bin/env bash
#  Test the GFX Driver on Linux

set -e  #  Exit when any command fails
set -x  #  Echo commands

gcc \
    -o test \
    -D DEBUG_ST7789 \
    -I . \
    -I ../pinedio_st7789_bitbang3 \
    test.c \
    ../pinedio_st7789_bitbang3/Arduino_ST7789.c \
    ../pinedio_st7789_bitbang3/Arduino_SWSPI.c \

./test
rm test
