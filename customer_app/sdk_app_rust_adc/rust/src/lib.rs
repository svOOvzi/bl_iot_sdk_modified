//! Measure the ambient brightness with an LED configured as ADC Input.
#![no_std]  //  Use the Rust Core Library instead of the Rust Standard Library, which is not compatible with embedded systems

//  Import External Libraries
use core::{            //  Rust Core Library
    fmt::Write,        //  For String Formatting    
    mem::transmute,    //  For Pointer Casting
    panic::PanicInfo,  //  For Panic Function
};
use bl602_sdk::{       //  Rust Wrapper for BL602 IoT SDK
    adc,               //  For ADC HAL
    dma,               //  For DMA HAL
    puts,              //  For Console Output
    Ptr,               //  For C Pointer
    String,            //  For Strings (limited to 64 chars)
};

/// GPIO Pin Number that will be configured as ADC Input.
/// PineCone Blue LED is connected on BL602 GPIO 11.
/// PineCone Green LED is connected on BL602 GPIO 14.
/// Only these GPIOs are supported: 4, 5, 6, 9, 10, 11, 12, 13, 14, 15
/// TODO: Change the GPIO Pin Number for your BL602 board
const ADC_GPIO: i32 = 11;

/// We set the ADC Frequency to 10 kHz according to <https://wiki.analog.com/university/courses/electronics/electronics-lab-led-sensor?rev=1551786227>
/// This is 10,000 samples per second.
const ADC_FREQUENCY: u32 = 10000;  //  Hz

/// We shall read 1,000 ADC samples, which will take 0.1 seconds
const ADC_SAMPLES: usize = 1000;

/// Set ADC Gain to Level 1 to increase the ADC sensitivity.
/// To disable ADC Gain, set `ADC_GAIN1` and `ADC_GAIN2` to `ADC_PGA_GAIN_NONE`.
/// See <https://github.com/lupyuen/bl_iot_sdk/blob/master/components/bl602/bl602_std/bl602_std/StdDriver/Inc/bl602_adc.h#L133-L144>
const ADC_GAIN1: u32 = ADC_PGA_GAIN_1;
const ADC_GAIN2: u32 = ADC_PGA_GAIN_1;
const ADC_PGA_GAIN_1: u32 = 1;  //  From <https://github.com/lupyuen/bl_iot_sdk/blob/master/components/bl602/bl602_std/bl602_std/StdDriver/Inc/bl602_adc.h#L133-L144>

/// Command to init the ADC Channel and start reading the ADC Samples.
/// Based on `hal_adc_init` in <https://github.com/lupyuen/bl_iot_sdk/blob/master/components/hal_drv/bl602_hal/hal_adc.c#L50-L102>
#[no_mangle]             //  Don't mangle the function name
extern "C" fn init_adc(  //  Declare `extern "C"` because it will be called by BL602 firmware
    _result: *mut u8,        //  Result to be returned to command-line interface (char *)
    _len:  i32,              //  Length of command line (int)
    _argc: i32,              //  Number of command line args (int)
    _argv: *const *const u8  //  Array of command line args (char **)
) {
    puts("[Rust] Init ADC");

    //  Only these GPIOs are supported: 4, 5, 6, 9, 10, 11, 12, 13, 14, 15
    assert!(ADC_GPIO==4 || ADC_GPIO==5 || ADC_GPIO==6 || ADC_GPIO==9 || ADC_GPIO==10 || ADC_GPIO==11 || ADC_GPIO==12 || ADC_GPIO==13 || ADC_GPIO==14 || ADC_GPIO==15);

    //  For Single-Channel Conversion Mode, frequency must be between 500 and 16,000 Hz
    assert!(ADC_FREQUENCY >= 500 && ADC_FREQUENCY <= 16000);

    //  Init the ADC Frequency for Single-Channel Conversion Mode
    adc::freq_init(1, ADC_FREQUENCY)
        .expect("ADC Freq failed");

    //  Init the ADC GPIO for Single-Channel Conversion Mode
    adc::init(1, ADC_GPIO)
        .expect("ADC Init failed");

    //  Enable ADC Gain to increase the ADC sensitivity
    let rc = unsafe { set_adc_gain(ADC_GAIN1, ADC_GAIN2) };  //  Unsafe because we are calling C function
    assert!(rc == 0);

    //  Init DMA for the ADC Channel for Single-Channel Conversion Mode
    adc::dma_init(1, ADC_SAMPLES as u32)
        .expect("DMA Init failed");

    //  Configure the GPIO Pin as ADC Input, no pullup, no pulldown
    adc::gpio_init(ADC_GPIO)
        .expect("ADC GPIO failed");

    //  Get the ADC Channel Number for the GPIO Pin
    let channel = unsafe { bl_adc_get_channel_by_gpio(ADC_GPIO) };

    //  Get the DMA Context for the ADC Channel
    let ptr = dma::find_ctx_by_channel(adc::ADC_DMA_CHANNEL as i32)
        .expect("DMA Ctx failed");
    assert!(!ptr.is_null());  //  TODO: Check null pointer in wrapper

    //  Cast the returned C Pointer (void *) to a DMA Context Pointer (adc_ctx *)
    let ctx = unsafe {         //  Unsafe because we are casting a pointer
        transmute::<           //  Cast the type...
            Ptr,               //  From C Pointer (void *)
            *mut adc::adc_ctx  //  To DMA Context Pointer (adc_ctx *)
        >(ptr)                 //  For this pointer
    };

    //  Indicate that the GPIO has been configured for ADC
    unsafe {  //  Unsafe because we are dereferencing a pointer
        (*ctx).chan_init_table |= 1 << channel;
    }

    //  Start reading the ADC via DMA
    adc::start()
        .expect("ADC Start failed");
}

/// Command to compute the average value of the ADC Samples that have just been read.
/// Based on `hal_adc_get_data` in <https://github.com/lupyuen/bl_iot_sdk/blob/master/components/hal_drv/bl602_hal/hal_adc.c#L142-L179>
#[no_mangle]              //  Don't mangle the function name
extern "C" fn read_adc(   //  Declare `extern "C"` because it will be called by BL602 firmware
    _result: *mut u8,        //  Result to be returned to command-line interface (char *)
    _len:  i32,              //  Length of command line (int)
    _argc: i32,              //  Number of command line args (int)
    _argv: *const *const u8  //  Array of command line args (char **)
) {    
    //  Array that will store last 1,000 ADC Samples
    let mut adc_data: [u32; ADC_SAMPLES]
        = [0; ADC_SAMPLES];  //  Init array to zeroes

    //  Get the ADC Channel Number for the GPIO Pin
    let channel = unsafe { bl_adc_get_channel_by_gpio(ADC_GPIO) };
    
    //  Get the DMA Context for the ADC Channel
    let ptr = dma::find_ctx_by_channel(adc::ADC_DMA_CHANNEL as i32)
        .expect("DMA Ctx failed");

    //  Cast the returned C Pointer (void *) to a DMA Context Pointer (adc_ctx *)
    let ctx = unsafe {         //  Unsafe because we are casting a pointer
        transmute::<           //  Cast the type...
            Ptr,               //  From C Pointer (void *)
            *mut adc::adc_ctx  //  To DMA Context Pointer (adc_ctx *)
        >(ptr)                 //  For this pointer
    };

    //  Verify that the GPIO has been configured for ADC
    unsafe {  //  Unsafe because we are dereferencing a pointer
        assert!(((1 << channel) & (*ctx).chan_init_table) != 0);
    }

    //  If ADC Sampling is not finished, try again later    
    if unsafe { (*ctx).channel_data.is_null() } {  //  Unsafe because we are dereferencing a pointer
        puts("ADC Sampling not finished");
        return;
    }

    //  Copy the read ADC Samples to the static array
    unsafe {                        //  Unsafe because we are copying raw memory
        core::ptr::copy(            //  Copy the memory...
            (*ctx).channel_data,    //  From Source (ADC DMA data)
            adc_data.as_mut_ptr(),  //  To Destination (mutable pointer to adc_data)
            adc_data.len()          //  Number of Items (each item is uint32 or 4 bytes)
        );    
    }

    //  Compute the average value of the ADC Samples
    let mut sum = 0;
    for i in 0..ADC_SAMPLES {
        //  Scale up the ADC Sample to the range 0 to 3199
        let scaled = ((adc_data[i] & 0xffff) * 3200) >> 16;
        sum += scaled;
    }
    let avg = sum / ADC_SAMPLES as u32;

    //  Format the output and display it
    let mut buf = String::new();
    write!(buf, "[Rust] Average: {}", avg)
        .expect("buf overflow");
    puts(&buf);
}

/// This function is called on panic, like an assertion failure
#[panic_handler]
fn panic(_info: &PanicInfo) -> ! {  //  `!` means that panic handler will never return
    //  TODO: Implement the complete panic handler like this:
    //  https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/rust/app/src/lib.rs#L115-L146

    //  For now we display a message
    puts("TODO: Rust panic"); 

	//  Loop forever, do not pass go, do not collect $200
    loop {}
}

extern "C" {  //  Import C Function
    /// Enable ADC Gain to increase the ADC sensitivity.
    /// Defined in customer_app/sdk_app_rust_adc/sdk_app_rust_adc/demo.c
    fn set_adc_gain(gain1: u32, gain2: u32) -> i32;

    /// Get the ADC Channel Number for the GPIO Pin
    /// TODO: Fix the return type of the Rust Wrapper
    fn bl_adc_get_channel_by_gpio(gpio_num: i32) -> i32;
}

/* Output Log
*/