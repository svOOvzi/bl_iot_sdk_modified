#
# "main" pseudo-component makefile.
#
# (Uses default behaviour of compiling all source files in directory, adding 'include' to include path.)

include $(BL60X_SDK_PATH)/components/network/ble/ble_common.mk

ifeq ($(CONFIG_ENABLE_PSM_RAM),1)
CPPFLAGS += -DCONF_USER_ENABLE_PSRAM
endif

ifeq ($(CONFIG_ENABLE_CAMERA),1)
CPPFLAGS += -DCONF_USER_ENABLE_CAMERA
endif

ifeq ($(CONFIG_ENABLE_BLSYNC),1)
CPPFLAGS += -DCONF_USER_ENABLE_BLSYNC
endif

ifeq ($(CONFIG_ENABLE_VFS_SPI),1)
CPPFLAGS += -DCONF_USER_ENABLE_VFS_SPI
endif

ifeq ($(CONFIG_ENABLE_VFS_ROMFS),1)
CPPFLAGS += -DCONF_USER_ENABLE_VFS_ROMFS
endif

# Define the GCC compiler options:
# CFLAGS for C compiler, CPPFLAGS for C++ compiler
# See additional options at components/3rdparty/tflite-bl602/bouffalo.mk

# Use Static Memory instead of Heap Memory
# See components/3rdparty/tflite-bl602/tensorflow/lite/kernels/internal/types.h
CFLAGS   += -DTF_LITE_STATIC_MEMORY
CPPFLAGS += -DTF_LITE_STATIC_MEMORY

# Don't use Thread-Safe Initialisation for C++ Static Variables.
# This fixes the missing symbols __cxa_guard_acquire and __cxa_guard_release.
# Note: This assumes that we will not init C++ static variables in multiple tasks.
# See https://alex-robenko.gitbook.io/bare_metal_cpp/compiler_output/static
CPPFLAGS += -fno-threadsafe-statics
