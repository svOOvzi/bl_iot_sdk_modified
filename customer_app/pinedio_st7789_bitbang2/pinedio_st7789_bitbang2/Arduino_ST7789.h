#include <inttypes.h>
#include <stdbool.h>

#define ST7789_TFTWIDTH 240
#define ST7789_TFTHEIGHT 240 //// 320

#define ST7789_RST_DELAY 120    ///< delay ms wait for reset finish
#define ST7789_SLPIN_DELAY 120  ///< delay ms wait for sleep in finish
#define ST7789_SLPOUT_DELAY 120 ///< delay ms wait for sleep out finish

#define ST7789_NOP 0x00
#define ST7789_SWRESET 0x01
#define ST7789_RDDID 0x04
#define ST7789_RDDST 0x09

#define ST7789_SLPIN 0x10
#define ST7789_SLPOUT 0x11
#define ST7789_PTLON 0x12
#define ST7789_NORON 0x13

#define ST7789_INVOFF 0x20
#define ST7789_INVON 0x21
#define ST7789_DISPOFF 0x28
#define ST7789_DISPON 0x29

#define ST7789_CASET 0x2A
#define ST7789_RASET 0x2B
#define ST7789_RAMWR 0x2C
#define ST7789_RAMRD 0x2E

#define ST7789_PTLAR 0x30
#define ST7789_COLMOD 0x3A
#define ST7789_MADCTL 0x36

#define ST7789_MADCTL_MY 0x80
#define ST7789_MADCTL_MX 0x40
#define ST7789_MADCTL_MV 0x20
#define ST7789_MADCTL_ML 0x10
#define ST7789_MADCTL_RGB 0x00

#define ST7789_RDID1 0xDA
#define ST7789_RDID2 0xDB
#define ST7789_RDID3 0xDC
#define ST7789_RDID4 0xDD

typedef enum
{
    BEGIN_WRITE,
    WRITE_COMMAND_8,
    WRITE_COMMAND_16,
    WRITE_DATA_8,
    WRITE_DATA_16,
    WRITE_BYTES,
    WRITE_C8_D8,
    WRITE_C8_D16,
    WRITE_C16_D16,
    END_WRITE,
    DELAY,
} spi_operation_type_t;

union
{
    uint16_t value;
    struct
    {
        uint8_t lsb;
        uint8_t msb;
    };
} _data16;

void Arduino_ST7789_Arduino_ST7789(
    int8_t rst, uint8_t r,
    bool ips, int16_t w, int16_t h,
    uint8_t col_offset1, uint8_t row_offset1, uint8_t col_offset2, uint8_t row_offset2
);
void Arduino_ST7789_writeAddrWindow(int16_t x, int16_t y, uint16_t w, uint16_t h);
void Arduino_ST7789_begin(int32_t speed);

void Arduino_SWSPI_Arduino_SWSPI(
    int8_t dc, int8_t cs, int8_t sck, int8_t mosi, int8_t miso /* = -1 */, 
    int8_t cs2
);

void Arduino_SWSPI_begin(int32_t speed, int8_t dataMode);
void Arduino_SWSPI_beginWrite();
void Arduino_SWSPI_endWrite();
void Arduino_SWSPI_writeCommand(uint8_t c);
void Arduino_SWSPI_write(uint8_t d);
void Arduino_SWSPI_write16(uint16_t d);
void Arduino_SWSPI_batchOperation(uint8_t batch[], size_t len);
void Arduino_SWSPI_writeC8D16D16(uint8_t c, uint16_t d1, uint16_t d2);
void Arduino_SWSPI_sendCommand(uint8_t c);
void Arduino_SWSPI_delay(uint32_t millisec);

#ifdef NOTUSED
void Arduino_TFT_18bit_Arduino_TFT_18bit(
    int8_t rst, uint8_t r,
    bool ips, int16_t w, int16_t h,
    uint8_t col_offset1, uint8_t row_offset1, uint8_t col_offset2, uint8_t row_offset2
);
void Arduino_TFT_18bit_writePixelPreclipped(int16_t x, int16_t y, uint16_t color);
#endif  //  NOTUSED

#ifdef DEBUG_ST7789
#define debug_st7789(...) printf(__VA_ARGS__)
#else
#define debug_st7789(...) {}
#endif  //  DEBUG_ST7789
