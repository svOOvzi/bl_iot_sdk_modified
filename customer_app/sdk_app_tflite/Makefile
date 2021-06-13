#
# This is a project Makefile. It is assumed the directory this Makefile resides in is a
# project subdirectory.
#

PROJECT_NAME := sdk_app_tflite
PROJECT_PATH := $(abspath .)
PROJECT_BOARD := evb
export PROJECT_PATH PROJECT_BOARD
#CONFIG_TOOLPREFIX :=

# Define the GCC compiler options:
# CFLAGS for C compiler, CPPFLAGS for C++ compiler

# Don't use Thread-Safe Initialisation for C++ Static Variables.
# This fixes the missing symbols __cxa_guard_acquire and __cxa_guard_release.
# Note: This assumes that we will not init C++ static variables in multiple tasks.
# See https://alex-robenko.gitbook.io/bare_metal_cpp/compiler_output/static
CPPFLAGS += -fno-threadsafe-statics

-include ./proj_config.mk

ifeq ($(origin BL60X_SDK_PATH), undefined)
BL60X_SDK_PATH_GUESS ?= $(shell pwd)
BL60X_SDK_PATH ?= $(BL60X_SDK_PATH_GUESS)/../..
$(info ****** Please SET BL60X_SDK_PATH ******)
$(info ****** Trying SDK PATH [$(BL60X_SDK_PATH)])
endif

# TensorFlow Lite for inference functions
COMPONENTS_TFLITE  := tflite-bl602
# NimBLE Porting Layer needed for mulitasking functions
COMPONENTS_NPL     := nimble-porting-layer 
COMPONENTS_BLSYS   := bltime blfdt blmtd bloop loopadc looprt loopset
COMPONENTS_VFS     := romfs
COMPONENTS_BLE     := 

INCLUDE_COMPONENTS += freertos_riscv_ram bl602 bl602_std hal_drv vfs yloop utils cli blog blog_testc
INCLUDE_COMPONENTS += easyflash4
INCLUDE_COMPONENTS += $(COMPONENTS_NETWORK)
INCLUDE_COMPONENTS += $(COMPONENTS_BLSYS)
INCLUDE_COMPONENTS += $(COMPONENTS_VFS)
INCLUDE_COMPONENTS += $(COMPONENTS_NPL)
INCLUDE_COMPONENTS += $(COMPONENTS_TFLITE)
INCLUDE_COMPONENTS += $(PROJECT_NAME)

include $(BL60X_SDK_PATH)/make_scripts_riscv/project.mk
