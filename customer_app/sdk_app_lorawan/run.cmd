::  Windows script to build, flash and run BL602 Firmware

::  Go up two levels to the bl_iot_sdk folder
pushd ..\..

::  Name of app
set APP_NAME=sdk_app_lorawan

::  Build for BL602
set CONFIG_CHIP_NAME=BL602

::  Where BL602 IoT SDK is located
set BL60X_SDK_PATH=.

::  Where blflash is located
set BLFLASH_PATH=%cd%\..\blflash

::  Where GCC is located
set GCC_PATH=%cd%\..\xpack-riscv-none-embed-gcc

::  TODO: Build Firmware
@%GCC_PATH%\bin\riscv-none-embed-gcc -std=gnu99 -Os -gdwarf -ffunction-sections -fdata-sections -fstrict-volatile-bitfields -fshort-enums -ffreestanding -fno-strict-aliasing -fno-omit-frame-pointer -DCONF_ENABLE_FRAME_PTR -Wall -Werror=all -Wno-error=unused-function -Wno-error=unused-but-set-variable -Wno-error=unused-variable -Wno-error=deprecated-declarations -Wextra -Wno-unused-parameter -Wno-sign-compare -DCONF_USER_ENABLE_PSRAM -Wno-old-style-declaration -DLORA_NODE=1 -DCONFIG_LORA_NODE_REGION=1 -DLORA_NODE_DEFAULT_DATARATE=0 -DLORA_NODE_CLI=0 -DLORA_NODE_LOG_CLI=1 -DLORA_APP_NUM_PORTS=4 -DLORA_APP_AUTO_JOIN=0 -DLORA_MAC_PRIO=0 -DLORA_JOIN_REQ_RAND_DELAY=5000 -DLORA_UNCONFIRMED_TX_RAND_DELAY=5000 -DLORA_NODE_PUBLIC_NWK=0 -DLORA_LP_CLOCK=1 -DLORA_NODE_SYSINIT_STAGE=200 -DLORA_MAC_TIMER_NUM=0 -march=rv32imfc -mabi=ilp32f -save-temps=obj -DconfigUSE_TICKLESS_IDLE=0 -DFEATURE_WIFI_DISABLE=1 -D BL_SDK_VER=\"Unknown\" -D BL_SDK_PHY_VER=\"Unknown\" -D BL_SDK_RF_VER=\"Unknown\" -D BL_CHIP_NAME=\"BL602\" -MMD -MP -D BL_SDK_VER=\"Unknown\" -D BL_SDK_PHY_VER=\"Unknown\" -D BL_SDK_RF_VER=\"Unknown\" -DARCH_RISCV -DCONFIG_PSM_EASYFLASH_SIZE=16384 -DconfigUSE_TICKLESS_IDLE=0 -DFEATURE_WIFI_DISABLE=1 -DCFG_COMPONENT_BLOG_ENABLE=0 -D __FILENAME__=\"lora_app.c\" -D __FILENAME_WO_SUFFIX__=\"lora_app\" -D __FILENAME_WO_SUFFIX_DEQUOTED__=lora_app -D __COMPONENT_NAME__=\"lorawan\" -D __COMPONENT_NAME_DEQUOTED__=lorawan -D __COMPONENT_FILE_NAME__=\"lorawanlora_app\" -D__COMPONENT_FILE_NAMED__=lorawan.lora_app -D__COMPONENT_FILE_NAME_DEQUOTED__=lorawanlora_app -I %BL60X_SDK_PATH%/components/3rdparty/lorawan/include -I %BL60X_SDK_PATH%/components/bl602/bl602 -I %BL60X_SDK_PATH%/components/bl602/bl602/include -I %BL60X_SDK_PATH%/components/bl602/bl602_std -I %BL60X_SDK_PATH%/components/bl602/bl602_std/include -I %BL60X_SDK_PATH%/components/bl602/bl602_std/bl602_std/StdDriver/Inc -I %BL60X_SDK_PATH%/components/bl602/bl602_std/bl602_std/Device/Bouffalo/BL602/Peripherals -I %BL60X_SDK_PATH%/components/bl602/bl602_std/bl602_std/RISCV/Device/Bouffalo/BL602/Startup -I %BL60X_SDK_PATH%/components/bl602/bl602_std/bl602_std/RISCV/Core/Include -I %BL60X_SDK_PATH%/components/bl602/bl602_std/bl602_std/Include -I %BL60X_SDK_PATH%/components/bl602/bl602_std/bl602_std/Common/platform_print -I %BL60X_SDK_PATH%/components/bl602/bl602_std/bl602_std/Common/soft_crc -I %BL60X_SDK_PATH%/components/bl602/bl602_std/bl602_std/Common/partition -I %BL60X_SDK_PATH%/components/bl602/bl602_std/bl602_std/Common/xz -I %BL60X_SDK_PATH%/components/bl602/bl602_std/bl602_std/Common/cipher_suite/inc -I %BL60X_SDK_PATH%/components/bl602/bl602_std/bl602_std/Common/ring_buffer -I %BL60X_SDK_PATH%/components/stage/blfdt -I %BL60X_SDK_PATH%/components/stage/blfdt/include -I %BL60X_SDK_PATH%/components/stage/blfdt/inc -I %BL60X_SDK_PATH%/components/sys/blmtd -I %BL60X_SDK_PATH%/components/sys/blmtd/include -I %BL60X_SDK_PATH%/components/sys/blmtd/include -I %BL60X_SDK_PATH%/components/stage/blog -I %BL60X_SDK_PATH%/components/stage/blog/include -I %BL60X_SDK_PATH%/components/stage/blog -I %BL60X_SDK_PATH%/components/stage/blog_testc -I %BL60X_SDK_PATH%/components/stage/blog_testc/include -I %BL60X_SDK_PATH%/components/stage/blog_testc -I %BL60X_SDK_PATH%/components/sys/bloop/bloop -I %BL60X_SDK_PATH%/components/sys/bloop/bloop/include -I %BL60X_SDK_PATH%/components/sys/bloop/bloop/include -I %BL60X_SDK_PATH%/components/sys/bltime -I %BL60X_SDK_PATH%/components/sys/bltime/include -I %BL60X_SDK_PATH%/components/sys/bltime/include -I %BL60X_SDK_PATH%/components/stage/cli -I %BL60X_SDK_PATH%/components/stage/cli/include -I %BL60X_SDK_PATH%/components/stage/cli/cli/include -I %BL60X_SDK_PATH%/components/stage/easyflash4 -I %BL60X_SDK_PATH%/components/stage/easyflash4/include -I %BL60X_SDK_PATH%/components/stage/easyflash4/inc -I %BL60X_SDK_PATH%/components/bl602/freertos_riscv_ram -I %BL60X_SDK_PATH%/components/bl602/freertos_riscv_ram/include -I %BL60X_SDK_PATH%/components/bl602/freertos_riscv_ram/config -I %BL60X_SDK_PATH%/components/bl602/freertos_riscv_ram/portable/GCC/RISC-V -I %BL60X_SDK_PATH%/components/bl602/freertos_riscv_ram/portable/GCC/RISC-V/chip_specific_extensions/RV32F_float_abi_single -I %BL60X_SDK_PATH%/components/bl602/freertos_riscv_ram/panic -I %BL60X_SDK_PATH%/components/hal_drv -I %BL60X_SDK_PATH%/components/hal_drv/include -I %BL60X_SDK_PATH%/components/hal_drv/bl602_hal -I %BL60X_SDK_PATH%/components/sys/bloop/looprt -I %BL60X_SDK_PATH%/components/sys/bloop/looprt/include -I %BL60X_SDK_PATH%/components/sys/bloop/loopset -I %BL60X_SDK_PATH%/components/sys/bloop/loopset/include -I %BL60X_SDK_PATH%/components/3rdparty/lora-sx1262/include -I %BL60X_SDK_PATH%/components/network/lwip -I %BL60X_SDK_PATH%/components/network/lwip/include -I %BL60X_SDK_PATH%/components/network/lwip/src/include -I %BL60X_SDK_PATH%/components/network/lwip/lwip-port -I %BL60X_SDK_PATH%/components/network/lwip/lwip-port/config -I %BL60X_SDK_PATH%/components/network/lwip/lwip-port/FreeRTOS -I %BL60X_SDK_PATH%/components/network/lwip/lwip-port/arch -I %BL60X_SDK_PATH%/components/3rdparty/nimble-porting-layer/include -I %BL60X_SDK_PATH%/components/fs/romfs -I %BL60X_SDK_PATH%/components/fs/romfs/include -I %BL60X_SDK_PATH%/customer_app/%APP_NAME%/%APP_NAME% -I %BL60X_SDK_PATH%/customer_app/%APP_NAME%/%APP_NAME%/include -I %BL60X_SDK_PATH%/components/utils -I %BL60X_SDK_PATH%/components/utils/include -I %BL60X_SDK_PATH%/components/fs/vfs -I %BL60X_SDK_PATH%/components/fs/vfs/include -I %BL60X_SDK_PATH%/components/fs/vfs/posix/include -I %BL60X_SDK_PATH%/components/stage/yloop -I %BL60X_SDK_PATH%/components/stage/yloop/include -I %BL60X_SDK_PATH%/components/stage/yloop/include  -I src -c %BL60X_SDK_PATH%/components/3rdparty/lorawan/src/mac/*.c %BL60X_SDK_PATH%/components/3rdparty/lorawan/src/mac/region/*.c

:: TODO: %BL60X_SDK_PATH%/components/3rdparty/lora-sx1262/src/*.c %BL60X_SDK_PATH%/customer_app/%APP_NAME%/%APP_NAME%/*.c %BL60X_SDK_PATH%/components/3rdparty/lorawan/src/*.c 

del *.d *.s *.i *.o

::  TODO: Flash Firmware

::  TODO: Run Firmware

::  Return to the app folder
popd
