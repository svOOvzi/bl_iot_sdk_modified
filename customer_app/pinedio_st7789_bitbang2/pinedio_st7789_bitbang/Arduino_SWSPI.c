//  Based on https://github.com/moononournation/Arduino_GFX/blob/master/src/databus/Arduino_SWSPI.cpp
/*
 * start rewrite from:
 * https://github.com/adafruit/Adafruit-GFX-Library.git
 */
////#include "Arduino_SWSPI.h"
#include <inttypes.h>
#include <stdbool.h>
#include <stdio.h>
#include <assert.h>
#include <bl_gpio.h>         //  For bl_gpio_output_set
#include "Arduino_ST7789.h"

#define pinMode(x,y) {}
#define HIGH 1
#define LOW  0
#define UNUSED(x)
#define INLINE

void Arduino_SWSPI_writeCommand16(uint16_t c);
void Arduino_SWSPI_WRITE9BITCOMMAND(uint8_t c);
void Arduino_SWSPI_WRITE9BITDATA(uint8_t d);
void Arduino_SWSPI_WRITE(uint8_t d);
void Arduino_SWSPI_WRITE16(uint16_t d);
void Arduino_SWSPI_WRITE9BITREPEAT(uint16_t p, uint32_t len);
void Arduino_SWSPI_WRITEREPEAT(uint16_t p, uint32_t len);
void Arduino_SWSPI_DC_HIGH(void);
void Arduino_SWSPI_DC_LOW(void);
void Arduino_SWSPI_CS_HIGH(void);
void Arduino_SWSPI_CS_LOW(void);
void Arduino_SWSPI_SPI_MOSI_HIGH(void);
void Arduino_SWSPI_SPI_MOSI_LOW(void);
void Arduino_SWSPI_SPI_SCK_HIGH(void);
void Arduino_SWSPI_SPI_SCK_LOW(void);
bool Arduino_SWSPI_SPI_MISO_READ(void);

static void digitalWrite(int8_t pin, int8_t val) {
  if (val == 0) {
    int rc = bl_gpio_output_set(pin, 0);  assert(rc == 0);
  } else {
    int rc = bl_gpio_output_set(pin, 1);  assert(rc == 0);
  }
}

void Arduino_SWSPI_writeC8D8(uint8_t c, uint8_t d)
{
  debug_st7789("c:%02x d:%02x\r\n", c, d);
  Arduino_SWSPI_writeCommand(c);
  Arduino_SWSPI_write(d);
}

void Arduino_SWSPI_writeC8D16(uint8_t c, uint16_t d)
{
  debug_st7789("c:%02x d:%04x\r\n", c, d);
  Arduino_SWSPI_writeCommand(c);
  Arduino_SWSPI_write16(d);
}

void Arduino_SWSPI_writeC8D16D16(uint8_t c, uint16_t d1, uint16_t d2)
{
  debug_st7789("c:%02x d:%04x %04x\r\n", c, d1, d2);
  Arduino_SWSPI_writeCommand(c);
  Arduino_SWSPI_write16(d1);
  Arduino_SWSPI_write16(d2);
}

void Arduino_SWSPI_sendCommand(uint8_t c)
{
  debug_st7789("c:%02x\r\n", c);
  Arduino_SWSPI_beginWrite();
  Arduino_SWSPI_writeCommand(c);
  Arduino_SWSPI_endWrite();
}

void Arduino_SWSPI_sendCommand16(uint16_t c)
{
  assert(false); ////
  Arduino_SWSPI_beginWrite();
  Arduino_SWSPI_writeCommand16(c);
  Arduino_SWSPI_endWrite();
}

void Arduino_SWSPI_sendData(uint8_t d)
{
  debug_st7789("  d:%02x\r\n", d);
  Arduino_SWSPI_beginWrite();
  Arduino_SWSPI_write(d);
  Arduino_SWSPI_endWrite();
}

void Arduino_SWSPI_sendData16(uint16_t d)
{
  assert(false); ////
  Arduino_SWSPI_beginWrite();
  Arduino_SWSPI_write16(d);
  Arduino_SWSPI_endWrite();
}

void Arduino_SWSPI_batchOperation(uint8_t batch[], size_t len)
{
  for (size_t i = 0; i < len; ++i)
  {
    uint8_t l = 0;
    switch (batch[i])
    {
    case BEGIN_WRITE:
      Arduino_SWSPI_beginWrite();
      break;
    case WRITE_C8_D16:
      l++;
      /* fall through */
    case WRITE_C8_D8:
      l++;
      /* fall through */
    case WRITE_COMMAND_8:
      debug_st7789("c:%02x\r\n", batch[i + 1]);
      Arduino_SWSPI_writeCommand(batch[++i]);
      break;
    case WRITE_C16_D16:
      l = 2;
      /* fall through */
    case WRITE_COMMAND_16:
      _data16.msb = batch[++i];
      _data16.lsb = batch[++i];
      Arduino_SWSPI_writeCommand16(_data16.value);
      break;
    case WRITE_DATA_8:
      l = 1;
      break;
    case WRITE_DATA_16:
      l = 2;
      break;
    case WRITE_BYTES:
      l = batch[++i];
      break;
    case END_WRITE:
      Arduino_SWSPI_endWrite();
      break;
    case DELAY:
      Arduino_SWSPI_delay(batch[++i]);
      break;
    default:
      debug_st7789("Unknown operation id at %d: %d", i, batch[i]);
      break;
    }
    while (l--)
    {
      debug_st7789("  d:%02x\r\n", batch[i + 1]);
      Arduino_SWSPI_write(batch[++i]);
    }
  }
}

static int8_t _dc = -1;
static int8_t _cs = -1;
static int8_t _sck = -1;
static int8_t _mosi = -1;
static int8_t _miso = -1;
static int8_t _cs2 = -1;

void ////
Arduino_SWSPI_Arduino_SWSPI(int8_t dc, int8_t cs, int8_t sck, int8_t mosi, int8_t miso /* = -1 */, 
  int8_t cs2)////
    ////: _dc(dc), _cs(cs), _sck(sck), _mosi(mosi), _miso(miso)
{
  _dc = dc;
  _cs = cs;
  _sck = sck;
  _mosi = mosi;
  _miso = miso;
  _cs2 = cs2;
}

void Arduino_SWSPI_begin(int32_t speed, int8_t dataMode)
{
  UNUSED(speed);
  UNUSED(dataMode);

  if (_dc >= 0)
  {
    pinMode(_dc, OUTPUT);
    digitalWrite(_dc, HIGH); // Data mode
  }
  if (_cs >= 0)
  {
    pinMode(_cs, OUTPUT);
    digitalWrite(_cs, HIGH); // Deselect
  }
  if (_cs2 >= 0)
  {
    pinMode(_cs2, OUTPUT);
    digitalWrite(_cs2, HIGH); // Deselect
  }
  pinMode(_mosi, OUTPUT);
  digitalWrite(_mosi, LOW);
  pinMode(_sck, OUTPUT);
  digitalWrite(_sck, LOW);
  if (_miso >= 0)
  {
    pinMode(_miso, INPUT);
  }

#if defined(USE_FAST_PINIO)
#if defined(HAS_PORT_SET_CLR)
#if defined(ARDUINO_ARCH_NRF52840)
  uint32_t pin = digitalPinToPinName((pin_size_t)_sck);
  NRF_GPIO_Type *reg = nrf_gpio_pin_port_decode(&pin);
  _sckPortSet = &reg->OUTSET;
  _sckPortClr = &reg->OUTCLR;
  _sckPinMask = 1UL << pin;
  pin = digitalPinToPinName((pin_size_t)_mosi);
  reg = nrf_gpio_pin_port_decode(&pin);
  nrf_gpio_cfg_output(pin);
  _mosiPortSet = &reg->OUTSET;
  _mosiPortClr = &reg->OUTCLR;
  _mosiPinMask = 1UL << pin;
  if (_dc >= 0)
  {
    pin = digitalPinToPinName((pin_size_t)_dc);
    reg = nrf_gpio_pin_port_decode(&pin);
    nrf_gpio_cfg_output(pin);
    _dcPortSet = &reg->OUTSET;
    _dcPortClr = &reg->OUTCLR;
    _dcPinMask = 1UL << pin;
  }
  if (_cs >= 0)
  {
    pin = digitalPinToPinName((pin_size_t)_cs);
    reg = nrf_gpio_pin_port_decode(&pin);
    nrf_gpio_cfg_output(pin);
    _csPortSet = &reg->OUTSET;
    _csPortClr = &reg->OUTCLR;
    _csPinMask = 1UL << pin;
  }
  if (_miso >= 0)
  {
    pin = digitalPinToPinName((pin_size_t)_cs);
    reg = nrf_gpio_pin_port_decode(&pin);
    _misoPort = &reg->IN;
    _misoPinMask = 1UL << pin;
  }
#elif defined(ARDUINO_RASPBERRY_PI_PICO)
  _sckPinMask = digitalPinToBitMask(_sck);
  _mosiPinMask = digitalPinToBitMask(_mosi);
  _sckPortSet = (PORTreg_t)&sio_hw->gpio_set;
  _sckPortClr = (PORTreg_t)&sio_hw->gpio_clr;
  _mosiPortSet = (PORTreg_t)&sio_hw->gpio_set;
  _mosiPortClr = (PORTreg_t)&sio_hw->gpio_clr;
  _dcPinMask = digitalPinToBitMask(_dc);
  _dcPortSet = (PORTreg_t)&sio_hw->gpio_set;
  _dcPortClr = (PORTreg_t)&sio_hw->gpio_clr;
  if (_cs >= 0)
  {
    _csPinMask = digitalPinToBitMask(_cs);
    _csPortSet = (PORTreg_t)&sio_hw->gpio_set;
    _csPortClr = (PORTreg_t)&sio_hw->gpio_clr;
  }
  else
  {
    // No chip-select line defined; might be permanently tied to GND.
    // Assign a valid GPIO register (though not used for CS), and an
    // empty pin bitmask...the nonsense bit-twiddling might be faster
    // than checking _cs and possibly branching.
    _csPortSet = (PORTreg_t)_dcPortSet;
    _csPortClr = (PORTreg_t)_dcPortClr;
    _csPinMask = 0;
  }
  if (_miso >= 0)
  {
    _misoPort = portInputRegister(_miso);
    _misoPinMask = digitalPinToBitMask(_miso);
  }
  else
  {
    _misoPort = portInputRegister(_miso);
  }
  if (_miso >= 0)
  {
    _misoPinMask = digitalPinToBitMask(_miso);
    _misoPort = (PORTreg_t)portInputRegister(digitalPinToPort(_miso));
  }
  else
  {
    _misoPinMask = 0;
    _misoPort = (PORTreg_t)portInputRegister(digitalPinToPort(_sck));
  }
#elif CONFIG_IDF_TARGET_ESP32C3
  _sckPinMask = digitalPinToBitMask(_sck);
  _sckPortSet = (PORTreg_t)&GPIO.out_w1ts;
  _sckPortClr = (PORTreg_t)&GPIO.out_w1tc;
  _mosiPinMask = digitalPinToBitMask(_mosi);
  _mosiPortSet = (PORTreg_t)&GPIO.out_w1ts;
  _mosiPortClr = (PORTreg_t)&GPIO.out_w1tc;
  _dcPinMask = digitalPinToBitMask(_dc);
  _dcPortSet = (PORTreg_t)&GPIO.out_w1ts;
  _dcPortClr = (PORTreg_t)&GPIO.out_w1tc;
  if (_cs >= 0)
  {
    _csPinMask = digitalPinToBitMask(_cs);
    _csPortSet = (PORTreg_t)&GPIO.out_w1ts;
    _csPortClr = (PORTreg_t)&GPIO.out_w1tc;
  }
  else
  {
    // No chip-select line defined; might be permanently tied to GND.
    // Assign a valid GPIO register (though not used for CS), and an
    // empty pin bitmask...the nonsense bit-twiddling might be faster
    // than checking _cs and possibly branching.
    _csPortSet = _dcPortSet;
    _csPortClr = _dcPortClr;
    _csPinMask = 0;
  }
  if (_miso >= 0)
  {
    _misoPinMask = digitalPinToBitMask(_miso);
    _misoPort = (PORTreg_t)GPIO_IN_REG;
  }
  else
  {
    _misoPinMask = 0;
    _misoPort = (PORTreg_t)GPIO_IN_REG;
  }
#elif defined(ESP32)
  _sckPinMask = digitalPinToBitMask(_sck);
  _mosiPinMask = digitalPinToBitMask(_mosi);
  if (_sck >= 32)
  {
    _sckPortSet = (PORTreg_t)&GPIO.out1_w1ts.val;
    _sckPortClr = (PORTreg_t)&GPIO.out1_w1tc.val;
  }
  else
  {
    _sckPortSet = (PORTreg_t)&GPIO.out_w1ts;
    _sckPortClr = (PORTreg_t)&GPIO.out_w1tc;
  }
  if (_mosi >= 32)
  {
    _mosiPortSet = (PORTreg_t)&GPIO.out1_w1ts.val;
    _mosiPortClr = (PORTreg_t)&GPIO.out1_w1tc.val;
  }
  else
  {
    _mosiPortSet = (PORTreg_t)&GPIO.out_w1ts;
    _mosiPortClr = (PORTreg_t)&GPIO.out_w1tc;
  }
  _dcPinMask = digitalPinToBitMask(_dc);
  if (_dc >= 32)
  {
    _dcPortSet = (PORTreg_t)&GPIO.out1_w1ts.val;
    _dcPortClr = (PORTreg_t)&GPIO.out1_w1tc.val;
  }
  else
  {
    _dcPortSet = (PORTreg_t)&GPIO.out_w1ts;
    _dcPortClr = (PORTreg_t)&GPIO.out_w1tc;
  }
  if (_cs >= 32)
  {
    _csPinMask = digitalPinToBitMask(_cs);
    _csPortSet = (PORTreg_t)&GPIO.out1_w1ts.val;
    _csPortClr = (PORTreg_t)&GPIO.out1_w1tc.val;
  }
  else if (_cs >= 0)
  {
    _csPinMask = digitalPinToBitMask(_cs);
    _csPortSet = (PORTreg_t)&GPIO.out_w1ts;
    _csPortClr = (PORTreg_t)&GPIO.out_w1tc;
  }
  else
  {
    // No chip-select line defined; might be permanently tied to GND.
    // Assign a valid GPIO register (though not used for CS), and an
    // empty pin bitmask...the nonsense bit-twiddling might be faster
    // than checking _cs and possibly branching.
    _csPortSet = (PORTreg_t)_dcPortSet;
    _csPortClr = (PORTreg_t)_dcPortClr;
    _csPinMask = 0;
  }
  if (_miso >= 0)
  {
    _misoPinMask = digitalPinToBitMask(_miso);
    _misoPort = (PORTreg_t)portInputRegister(digitalPinToPort(_miso));
  }
  else
  {
    _misoPinMask = 0;
    _misoPort = (PORTreg_t)portInputRegister(digitalPinToPort(_sck));
  }
#elif defined(CORE_TEENSY)
#if !defined(KINETISK)
  _sckPinMask = digitalPinToBitMask(_sck);
  _mosiPinMask = digitalPinToBitMask(_mosi);
#endif
  _sckPortSet = portSetRegister(_sck);
  _sckPortClr = portClearRegister(_sck);
  _mosiPortSet = portSetRegister(_mosi);
  _mosiPortClr = portClearRegister(_mosi);
  if (_dc >= 0)
  {
#if !defined(KINETISK)
    _dcPinMask = digitalPinToBitMask(_dc);
#endif
    _dcPortSet = portSetRegister(_dc);
    _dcPortClr = portClearRegister(_dc);
  }
  else
  {
#if !defined(KINETISK)
    _dcPinMask = 0;
#endif
    _dcPortSet = _sckPortSet;
    _dcPortClr = _sckPortClr;
  }
  if (_cs >= 0)
  {
#if !defined(KINETISK)
    _csPinMask = digitalPinToBitMask(_cs);
#endif
    _csPortSet = portSetRegister(_cs);
    _csPortClr = portClearRegister(_cs);
  }
  else
  {
#if !defined(KINETISK)
    _csPinMask = 0;
#endif
    _csPortSet = _sckPortSet;
    _csPortClr = _sckPortClr;
  }
#else  // !CORE_TEENSY
  _sckPinMask = digitalPinToBitMask(_sck);
  _mosiPinMask = digitalPinToBitMask(_mosi);
  _sckPortSet = &(PORT->Group[g_APinDescription[_sck].ulPort].OUTSET.reg);
  _sckPortClr = &(PORT->Group[g_APinDescription[_sck].ulPort].OUTCLR.reg);
  _mosiPortSet = &(PORT->Group[g_APinDescription[_mosi].ulPort].OUTSET.reg);
  _mosiPortClr = &(PORT->Group[g_APinDescription[_mosi].ulPort].OUTCLR.reg);
  if (_dc >= 0)
  {
    _dcPinMask = digitalPinToBitMask(_dc);
    _dcPortSet = &(PORT->Group[g_APinDescription[_dc].ulPort].OUTSET.reg);
    _dcPortClr = &(PORT->Group[g_APinDescription[_dc].ulPort].OUTCLR.reg);
  }
  else
  {
    // No D/C line defined; 9-bit SPI.
    // Assign a valid GPIO register (though not used for DC), and an
    // empty pin bitmask...the nonsense bit-twiddling might be faster
    // than checking _dc and possibly branching.
    _dcPortSet = _sckPortSet;
    _dcPortClr = _sckPortClr;
    _dcPinMask = 0;
  }
  if (_cs >= 0)
  {
    _csPinMask = digitalPinToBitMask(_cs);
    _csPortSet = &(PORT->Group[g_APinDescription[_cs].ulPort].OUTSET.reg);
    _csPortClr = &(PORT->Group[g_APinDescription[_cs].ulPort].OUTCLR.reg);
  }
  else
  {
    // No chip-select line defined; might be permanently tied to GND.
    // Assign a valid GPIO register (though not used for CS), and an
    // empty pin bitmask...the nonsense bit-twiddling might be faster
    // than checking _cs and possibly branching.
    _csPortSet = _sckPortSet;
    _csPortClr = _sckPortClr;
    _csPinMask = 0;
  }
  if (_miso >= 0)
  {
    _misoPinMask = digitalPinToBitMask(_miso);
    _misoPort = (PORTreg_t)portInputRegister(digitalPinToPort(_miso));
  }
  else
  {
    _misoPinMask = 0;
    _misoPort = (PORTreg_t)portInputRegister(digitalPinToPort(_sck));
  }
#endif // end !CORE_TEENSY
#else  // !HAS_PORT_SET_CLR
  _sckPort = (PORTreg_t)portOutputRegister(digitalPinToPort(_sck));
  _sckPinMaskSet = digitalPinToBitMask(_sck);
  _mosiPort = (PORTreg_t)portOutputRegister(digitalPinToPort(_mosi));
  _mosiPinMaskSet = digitalPinToBitMask(_mosi);
  if (_dc >= 0)
  {
    _dcPort = (PORTreg_t)portOutputRegister(digitalPinToPort(_dc));
    _dcPinMaskSet = digitalPinToBitMask(_dc);
  }
  else
  {
    // No D/C line defined; 9-bit SPI.
    // Assign a valid GPIO register (though not used for DC), and an
    // empty pin bitmask...the nonsense bit-twiddling might be faster
    // than checking _dc and possibly branching.
    _dcPort = _sckPort;
    _dcPinMaskSet = 0;
  }
  if (_cs >= 0)
  {
    _csPort = (PORTreg_t)portOutputRegister(digitalPinToPort(_cs));
    _csPinMaskSet = digitalPinToBitMask(_cs);
  }
  else
  {
    // No chip-select line defined; might be permanently tied to GND.
    // Assign a valid GPIO register (though not used for CS), and an
    // empty pin bitmask...the nonsense bit-twiddling might be faster
    // than checking _cs and possibly branching.
    _csPort = _sckPort;
    _csPinMaskSet = 0;
  }
  if (_miso >= 0)
  {
    _misoPort = (PORTreg_t)portInputRegister(digitalPinToPort(_miso));
    _misoPinMask = digitalPinToBitMask(_miso);
  }
  else
  {
    _misoPort = (PORTreg_t)portInputRegister(digitalPinToPort(_sck));
    _misoPinMask = 0;
  }
  _csPinMaskClr = ~_csPinMaskSet;
  _dcPinMaskClr = ~_dcPinMaskSet;
  _sckPinMaskClr = ~_sckPinMaskSet;
  _mosiPinMaskClr = ~_mosiPinMaskSet;
#endif // !HAS_PORT_SET_CLR
#endif // USE_FAST_PINIO
}

void Arduino_SWSPI_beginWrite()
{
  if (_dc >= 0)
  {
    Arduino_SWSPI_DC_HIGH();
  }
  Arduino_SWSPI_CS_LOW();
}

void Arduino_SWSPI_endWrite()
{
  Arduino_SWSPI_CS_HIGH();
}

void Arduino_SWSPI_writeCommand(uint8_t c)
{
  if (_dc < 0) // 9-bit SPI
  {
    Arduino_SWSPI_WRITE9BITCOMMAND(c);
  }
  else
  {
    Arduino_SWSPI_DC_LOW();
    Arduino_SWSPI_WRITE(c);
    Arduino_SWSPI_DC_HIGH();
  }
}

void Arduino_SWSPI_writeCommand16(uint16_t c)
{
  if (_dc < 0) // 9-bit SPI
  {
    _data16.value = c;
    Arduino_SWSPI_WRITE9BITCOMMAND(_data16.msb);
    Arduino_SWSPI_WRITE9BITCOMMAND(_data16.lsb);
  }
  else
  {
    Arduino_SWSPI_DC_LOW();
    Arduino_SWSPI_WRITE16(c);
    Arduino_SWSPI_DC_HIGH();
  }
}

void Arduino_SWSPI_write(uint8_t d)
{
  if (_dc < 0) // 9-bit SPI
  {
    Arduino_SWSPI_WRITE9BITDATA(d);
  }
  else
  {
    Arduino_SWSPI_WRITE(d);
  }
}

void Arduino_SWSPI_write16(uint16_t d)
{
  if (_dc < 0) // 9-bit SPI
  {
    _data16.value = d;
    Arduino_SWSPI_WRITE9BITDATA(_data16.msb);
    Arduino_SWSPI_WRITE9BITDATA(_data16.lsb);
  }
  else
  {
    Arduino_SWSPI_WRITE16(d);
  }
}

void Arduino_SWSPI_writeRepeat(uint16_t p, uint32_t len)
{
  if (_dc < 0) // 9-bit SPI
  {
// ESP8266 avoid trigger watchdog
#if defined(ESP8266)
    while (len > (ESP8266SAFEBATCHBITSIZE / 9))
    {
      Arduino_SWSPI_WRITE9BITREPEAT(p, ESP8266SAFEBATCHBITSIZE / 9);
      len -= ESP8266SAFEBATCHBITSIZE / 9;
      yield();
    }
    Arduino_SWSPI_WRITE9BITREPEAT(p, len);
#else
    Arduino_SWSPI_WRITE9BITREPEAT(p, len);
#endif
  }
  else
  {
#if defined(ESP8266)
    while (len > (ESP8266SAFEBATCHBITSIZE / 8))
    {
      Arduino_SWSPI_WRITEREPEAT(p, ESP8266SAFEBATCHBITSIZE / 8);
      len -= ESP8266SAFEBATCHBITSIZE / 8;
      yield();
    }
    Arduino_SWSPI_WRITEREPEAT(p, len);
#else
    Arduino_SWSPI_WRITEREPEAT(p, len);
#endif
  }
}

void Arduino_SWSPI_writePixels(uint16_t *data, uint32_t len)
{
  while (len--)
  {
    Arduino_SWSPI_WRITE16(*data++);
  }
}

#if !defined(LITTLE_FOOT_PRINT)
void Arduino_SWSPI_writeBytes(uint8_t *data, uint32_t len)
{
  while (len--)
  {
    Arduino_SWSPI_WRITE(*data++);
  }
}

void Arduino_SWSPI_writePattern(uint8_t *data, uint8_t len, uint32_t repeat)
{
  while (repeat--)
  {
    for (uint8_t i = 0; i < len; i++)
    {
      Arduino_SWSPI_WRITE(data[i]);
    }
  }
}
#endif // !defined(LITTLE_FOOT_PRINT)

INLINE void Arduino_SWSPI_WRITE9BITCOMMAND(uint8_t c)
{
  // D/C bit, command
  Arduino_SWSPI_SPI_MOSI_LOW();
  Arduino_SWSPI_SPI_SCK_HIGH();
  Arduino_SWSPI_SPI_SCK_LOW();

  uint8_t bit = 0x80;
  while (bit)
  {
    if (c & bit)
    {
      Arduino_SWSPI_SPI_MOSI_HIGH();
    }
    else
    {
      Arduino_SWSPI_SPI_MOSI_LOW();
    }
    Arduino_SWSPI_SPI_SCK_HIGH();
    bit >>= 1;
    Arduino_SWSPI_SPI_SCK_LOW();
  }
}

INLINE void Arduino_SWSPI_WRITE9BITDATA(uint8_t d)
{
  // D/C bit, data
  Arduino_SWSPI_SPI_MOSI_HIGH();
  Arduino_SWSPI_SPI_SCK_HIGH();
  Arduino_SWSPI_SPI_SCK_LOW();

  uint8_t bit = 0x80;
  while (bit)
  {
    if (d & bit)
    {
      Arduino_SWSPI_SPI_MOSI_HIGH();
    }
    else
    {
      Arduino_SWSPI_SPI_MOSI_LOW();
    }
    Arduino_SWSPI_SPI_SCK_HIGH();
    bit >>= 1;
    Arduino_SWSPI_SPI_SCK_LOW();
  }
}

INLINE void Arduino_SWSPI_WRITE(uint8_t d)
{
  uint8_t bit = 0x80;
  while (bit)
  {
    if (d & bit)
    {
      Arduino_SWSPI_SPI_MOSI_HIGH();
    }
    else
    {
      Arduino_SWSPI_SPI_MOSI_LOW();
    }
    Arduino_SWSPI_SPI_SCK_HIGH();
    bit >>= 1;
    Arduino_SWSPI_SPI_SCK_LOW();
  }
}

INLINE void Arduino_SWSPI_WRITE16(uint16_t d)
{
  uint16_t bit = 0x8000;
  while (bit)
  {
    if (d & bit)
    {
      Arduino_SWSPI_SPI_MOSI_HIGH();
    }
    else
    {
      Arduino_SWSPI_SPI_MOSI_LOW();
    }
    Arduino_SWSPI_SPI_SCK_HIGH();
    bit >>= 1;
    Arduino_SWSPI_SPI_SCK_LOW();
  }
}

INLINE void Arduino_SWSPI_WRITE9BITREPEAT(uint16_t p, uint32_t len)
{
  if (p == 0xffff) // no need to set MOSI level while filling white
  {
    Arduino_SWSPI_SPI_MOSI_HIGH();
    len *= 18; // 9-bit * 2
    while (len--)
    {
      Arduino_SWSPI_SPI_SCK_HIGH();
      Arduino_SWSPI_SPI_SCK_LOW();
    }
  }
  else
  {
    _data16.value = p;
    while (len--)
    {
      Arduino_SWSPI_WRITE9BITDATA(_data16.msb);
      Arduino_SWSPI_WRITE9BITDATA(_data16.lsb);
    }
  }
}

INLINE void Arduino_SWSPI_WRITEREPEAT(uint16_t p, uint32_t len)
{
  assert(false); ////  9-bit only
  if ((p == 0x0000) || (p == 0xffff)) // no need to set MOSI level while filling black or white
  {
    if (p)
    {
      Arduino_SWSPI_SPI_MOSI_HIGH();
    }
    else
    {
      Arduino_SWSPI_SPI_MOSI_LOW();
    }
    len *= 16;
    while (len--)
    {
      Arduino_SWSPI_SPI_SCK_HIGH();
      Arduino_SWSPI_SPI_SCK_LOW();
    }
  }
  else
  {
    while (len--)
    {
      Arduino_SWSPI_WRITE16(p);
    }
  }
}

/******** low level bit twiddling **********/

INLINE void Arduino_SWSPI_DC_HIGH(void)
{
#if defined(USE_FAST_PINIO)
#if defined(HAS_PORT_SET_CLR)
#if defined(KINETISK)
  *_dcPortSet = 1;
#else  // !KINETISK
  *_dcPortSet = _dcPinMask;
#endif // end !KINETISK
#else  // !HAS_PORT_SET_CLR
  *_dcPort |= _dcPinMaskSet;
#endif // end !HAS_PORT_SET_CLR
#else  // !USE_FAST_PINIO
  debug_st7789("+ dc %d data\r\n", _dc);
  digitalWrite(_dc, HIGH);
#endif // end !USE_FAST_PINIO
}

INLINE void Arduino_SWSPI_DC_LOW(void)
{
#if defined(USE_FAST_PINIO)
#if defined(HAS_PORT_SET_CLR)
#if defined(KINETISK)
  *_dcPortClr = 1;
#else  // !KINETISK
  *_dcPortClr = _dcPinMask;
#endif // end !KINETISK
#else  // !HAS_PORT_SET_CLR
  *_dcPort &= _dcPinMaskClr;
#endif // end !HAS_PORT_SET_CLR
#else  // !USE_FAST_PINIO
  debug_st7789("- dc %d command\r\n", _dc);
  digitalWrite(_dc, LOW);
#endif // end !USE_FAST_PINIO
}

INLINE void Arduino_SWSPI_CS_HIGH(void)
{
  if (_cs >= 0)
  {
#if defined(USE_FAST_PINIO)
#if defined(HAS_PORT_SET_CLR)
#if defined(KINETISK)
    *_csPortSet = 1;
#else  // !KINETISK
    *_csPortSet = _csPinMask;
#endif // end !KINETISK
#else  // !HAS_PORT_SET_CLR
    *_csPort |= _csPinMaskSet;
#endif // end !HAS_PORT_SET_CLR
#else  // !USE_FAST_PINIO
    digitalWrite(_cs, HIGH);
    debug_st7789("- cs %d disable\r\n", _cs);
#endif // end !USE_FAST_PINIO
  }
  if (_cs2 >= 0)
  {
    digitalWrite(_cs2, HIGH);
    debug_st7789("- cs2 %d disable\r\n", _cs2);
  }
}

INLINE void Arduino_SWSPI_CS_LOW(void)
{
  if (_cs >= 0)
  {
#if defined(USE_FAST_PINIO)
#if defined(HAS_PORT_SET_CLR)
#if defined(KINETISK)
    *_csPortClr = 1;
#else  // !KINETISK
    *_csPortClr = _csPinMask;
#endif // end !KINETISK
#else  // !HAS_PORT_SET_CLR
    *_csPort &= _csPinMaskClr;
#endif // end !HAS_PORT_SET_CLR
#else  // !USE_FAST_PINIO
    debug_st7789("+ cs %d enable\r\n", _cs);
    digitalWrite(_cs, LOW);
#endif // end !USE_FAST_PINIO
  }
  if (_cs2 >= 0)
  {
    debug_st7789("+ cs2 %d enable\r\n", _cs2);
    digitalWrite(_cs2, LOW);
  }
}

/*!
    @brief  Set the software (bitbang) SPI MOSI line HIGH.
*/
INLINE void Arduino_SWSPI_SPI_MOSI_HIGH(void)
{
#if defined(USE_FAST_PINIO)
#if defined(HAS_PORT_SET_CLR)
#if defined(KINETISK)
  *_mosiPortSet = 1;
#else // !KINETISK
  *_mosiPortSet = _mosiPinMask;
#endif
#else  // !HAS_PORT_SET_CLR
  *_mosiPort |= _mosiPinMaskSet;
#endif // end !HAS_PORT_SET_CLR
#else  // !USE_FAST_PINIO
  digitalWrite(_mosi, HIGH);
#endif // end !USE_FAST_PINIO
}

/*!
    @brief  Set the software (bitbang) SPI MOSI line LOW.
*/
INLINE void Arduino_SWSPI_SPI_MOSI_LOW(void)
{
#if defined(USE_FAST_PINIO)
#if defined(HAS_PORT_SET_CLR)
#if defined(KINETISK)
  *_mosiPortClr = 1;
#else // !KINETISK
  *_mosiPortClr = _mosiPinMask;
#endif
#else  // !HAS_PORT_SET_CLR
  *_mosiPort &= _mosiPinMaskClr;
#endif // end !HAS_PORT_SET_CLR
#else  // !USE_FAST_PINIO
  digitalWrite(_mosi, LOW);
#endif // end !USE_FAST_PINIO
}

/*!
    @brief  Set the software (bitbang) SPI SCK line HIGH.
*/
INLINE void Arduino_SWSPI_SPI_SCK_HIGH(void)
{
#if defined(USE_FAST_PINIO)
#if defined(HAS_PORT_SET_CLR)
#if defined(KINETISK)
  *_sckPortSet = 1;
#else                                                // !KINETISK
  *_sckPortSet = _sckPinMask;
#if defined(__IMXRT1052__) || defined(__IMXRT1062__) // Teensy 4.x
  for (volatile uint8_t i = 0; i < 1; i++)
    ;
#endif
#endif
#else  // !HAS_PORT_SET_CLR
  *_sckPort |= _sckPinMaskSet;
#endif // end !HAS_PORT_SET_CLR
#else  // !USE_FAST_PINIO
  digitalWrite(_sck, HIGH);
#endif // end !USE_FAST_PINIO
}

/*!
    @brief  Set the software (bitbang) SPI SCK line LOW.
*/
INLINE void Arduino_SWSPI_SPI_SCK_LOW(void)
{
#if defined(USE_FAST_PINIO)
#if defined(HAS_PORT_SET_CLR)
#if defined(KINETISK)
  *_sckPortClr = 1;
#else                                                // !KINETISK
  *_sckPortClr = _sckPinMask;
#if defined(__IMXRT1052__) || defined(__IMXRT1062__) // Teensy 4.x
  for (volatile uint8_t i = 0; i < 1; i++)
    ;
#endif
#endif
#else  // !HAS_PORT_SET_CLR
  *_sckPort &= _sckPinMaskClr;
#endif // end !HAS_PORT_SET_CLR
#else  // !USE_FAST_PINIO
  digitalWrite(_sck, LOW);
#endif // end !USE_FAST_PINIO
}

/*!
    @brief   Read the state of the software (bitbang) SPI MISO line.
    @return  true if HIGH, false if LOW.
*/
INLINE bool Arduino_SWSPI_SPI_MISO_READ(void)
{
  return 0; ////
#ifdef NOTUSED

#if defined(USE_FAST_PINIO)
#if defined(KINETISK)
  return *_misoPort;
#else  // !KINETISK
  return *_misoPort & _misoPinMask;
#endif // end !KINETISK
#else  // !USE_FAST_PINIO
  return digitalRead(_miso);
#endif // end !USE_FAST_PINIO

#endif  //  NOTUSED
}