#
# This is a project Makefile. It is assumed the directory this Makefile resides in is a
# project subdirectory.
#

PROJECT_NAME := sdk_app_lorawan
PROJECT_PATH := $(abspath .)
PROJECT_BOARD := evb
export PROJECT_PATH PROJECT_BOARD
#CONFIG_TOOLPREFIX :=

# Define the GCC compiler options
# LoRaWAN Options based on components/3rdparty/lorawan/syscfg.yml

# Used by package management system to include lora/node hardware drivers.
CFLAGS += -DLORA_NODE=1

# The operating region of the device. These values map to
# enumerated regions in the stack. User must override the
# region or compilation error will occur.
# 	0: No region
# 	1: AS band on 923MHz
# 	2: Australian band on 915MHz
# 	3: Chinese band on 470MHz
# 	4: Chinese band on 779MHz
# 	5: European band on 433MHz
# 	6: European band on 868MHz
# 	7: South korean band on 920MHz
# 	8: India band on 865MHz
# 	9: North american band on 915MHz
# 	10: North american band on 915MHz with a maximum of 16 channels
CFLAGS += -DCONFIG_LORA_NODE_REGION=1

# The default data rate to be used. Data rate definitions are
# band specific and some values may not be valid for certain
# bands. The data rates are enumerated values with 0 being
# the lowest data rate (generally) and higher numbers either
# representing higher data rates or different spreading
# factors and/or higher channel bandwidths.
CFLAGS += -DLORA_NODE_DEFAULT_DATARATE=0

# Include shell commands for LoRa operations
CFLAGS += -DLORA_NODE_CLI=0

# Include shell commands for lora node debug log
CFLAGS += -DLORA_NODE_LOG_CLI=1

# The number of unique LoRa application ports
CFLAGS += -DLORA_APP_NUM_PORTS=4

# Determines if the stack will handle joining or whether the
# application will handle joining.
CFLAGS += -DLORA_APP_AUTO_JOIN=0

# The priority of the LoRa MAC task
CFLAGS += -DLORA_MAC_PRIO=0

# Used to compute a random delay (in milliseconds) between
# the transmission of join requests by an end device.
CFLAGS += -DLORA_JOIN_REQ_RAND_DELAY=5000

# Used to compute a random delay (in milliseconds) between
# the transmission of join requests by an end device.
CFLAGS += -DLORA_UNCONFIRMED_TX_RAND_DELAY=5000

# TODO: Check this
# Sets public or private lora network. A value of 1 means
# the network is public; private otherwise
CFLAGS += -DLORA_NODE_PUBLIC_NWK=0

# Used by BSP packages to configure LP clock for the LoRa system.
CFLAGS += -DLORA_LP_CLOCK=1

# (Unused) Sysinit stage for the LoRa endpoint
CFLAGS += -DLORA_NODE_SYSINIT_STAGE=200

-include ./proj_config.mk

ifeq ($(origin BL60X_SDK_PATH), undefined)
BL60X_SDK_PATH_GUESS ?= $(shell pwd)
BL60X_SDK_PATH ?= $(BL60X_SDK_PATH_GUESS)/../..
$(info ****** Please SET BL60X_SDK_PATH ******)
$(info ****** Trying SDK PATH [$(BL60X_SDK_PATH)])
endif

# Include these components
COMPONENTS_LORA    := lora-sx1276 nimble-porting-layer lorawan
COMPONENTS_BLSYS   := bltime blfdt blmtd bloop loopadc looprt loopset
COMPONENTS_VFS     := romfs
COMPONENTS_BLE     := 

INCLUDE_COMPONENTS += freertos_riscv_ram bl602 bl602_std hal_drv vfs yloop utils cli blog blog_testc
INCLUDE_COMPONENTS += easyflash4
INCLUDE_COMPONENTS += $(COMPONENTS_NETWORK)
INCLUDE_COMPONENTS += $(COMPONENTS_BLSYS)
INCLUDE_COMPONENTS += $(COMPONENTS_VFS)
INCLUDE_COMPONENTS += $(COMPONENTS_LORA)
INCLUDE_COMPONENTS += $(PROJECT_NAME)

include $(BL60X_SDK_PATH)/make_scripts_riscv/project.mk
