# NimBLE Porting Layer (Multitasking Functions)

Ported from Apache NimBLE to BL602...

https://github.com/apache/mynewt-nimble/tree/master/porting/npl/freertos

The source files were ported Apache NimBLE with minor changes...

-   [Detect Interrupt Service Routine](https://github.com/lupyuen/bl_iot_sdk/commit/72e2cb44a40f9faf91c87ee8d421ed8eb4adb571#diff-c13b2cc976e41c4bc4d3fd967aefc40cccfb76bc14c7210001f675f371a14818)

-   [Rename `vPortEnterCritical` and `vPortExitCritical` to `taskENTER_CRITICAL` and `taskEXIT_CRITICAL`](https://github.com/lupyuen/bl_iot_sdk/commit/41a07867dceb5541439ff3f05129941647b9341f#diff-c13b2cc976e41c4bc4d3fd967aefc40cccfb76bc14c7210001f675f371a14818)

Read the articles...

https://lupyuen.github.io/articles/lora2

https://lupyuen.github.io/pinetime-rust-mynewt/articles/dfu#nimble-stack-for-bluetooth-le-on-pinetime
