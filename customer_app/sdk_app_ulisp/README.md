# BL602 uLisp Firmware

A version of the Lisp programming language for BL602 RISC-V boards.

Read the article...

- [__uLisp and Blockly on PineCone BL602 RISC-V Board__](https://lupyuen.github.io/articles/lisp)

uLisp was ported to BL602 from ESP32 Arduino...

https://github.com/technoblogy/ulisp-esp

This firmware calls the BL602 uLisp Library `components/3rdparty/ulisp-bl602`...

https://github.com/lupyuen/ulisp-bl602

This firmware works with `blockly-ulisp`, which allows embedded apps to be dragged-and-dropped from Web Browser to BL602...

https://github.com/AppKaki/blockly-ulisp

For more information about uLisp...

http://www.ulisp.com/show?21T5

# Commands

We need a space before the first `(` because `(` is parsed as a command keyword...

List Commands from http://www.ulisp.com/show?1AC5

```text
# Create a list (1 2 3)
( list 1 2 3 )

# Returns 1
( car ( list 1 2 3 ) )

# Returns (2 3)
( cdr ( list 1 2 3 ) )
```

GPIO Commands from http://www.ulisp.com/show?1AEK

```text
# Configure GPIO Pin 11 (Blue LED) for output (instead of input) 
( pinmode 11 :output )

# Set GPIO Pin 11 to High (LED Off)
( digitalwrite 11 :high )

# Set GPIO Pin 11 to Low (LED On)
( digitalwrite 11 :low )

# Sleep 1,000 milliseconds (1 second)
( delay 1000 )
```

Blinky Commands from http://www.ulisp.com/show?1AEK

```text
# Define the blinky function
( defun blinky ()             \
  ( pinmode 11 :output )      \
  ( loop                      \
   ( digitalwrite 11 :high )  \
   ( delay 1000 )             \
   ( digitalwrite 11 :low  )  \
   ( delay 1000 )))

# Run the blinky function
( blinky )
```

Make sure there's no space after "`\`"
