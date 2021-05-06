# BL602 uLisp Firmware

A version of the Lisp programming language for BL602 RISC-V boards.

uLisp was ported to BL602 from ESP32 Arduino...

https://github.com/technoblogy/ulisp-esp

This firmware calls the BL602 uLisp Library `components/3rdparty/ulisp-bl602`...

https://github.com/lupyuen/ulisp-bl602

For more information about uLisp...

http://www.ulisp.com/show?21T5

# Commands

We need a space before the first `(` because `(` is parsed as a command keyword...

```text
# Create a list (1 2 3)
( list 1 2 3 )

# Returns 1
( car ( list 1 2 3 ) )

# Returns (2 3)
( cdr ( list 1 2 3 ) )
```
