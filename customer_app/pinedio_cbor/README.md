# Tiny CBOR Demo Firmware for BL602 and BL604

This firmware calls the [`tinycbor-bl602`](https://github.com/lupyuen/tinycbor-bl602) Library to encode the following data into [CBOR (Concise Binary Object Representation)](https://en.wikipedia.org/wiki/CBOR) Format...

```text
{ "t": 1234 }

{ "t": 1234, "l": 2345 }
```

At the BL604 Command Prompt, enter `test_cbor` and `test_cbor2`...

```text
# test_cbor
CBOR Output: 6 bytes
  0xa1
  0x61
  0x74
  0x19
  0x04
  0xd2

# test_cbor2
CBOR Output: 11 bytes
  0xa2
  0x61
  0x74
  0x19
  0x04
  0xd2
  0x61
  0x6c
  0x19
  0x09
  0x29
```

See [`pinedio_cbor/demo.c`](pinedio_cbor/demo.c)
