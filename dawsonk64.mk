# enable user mode 32bit with kernel mode 64bit compatible mode.
export LOCAL_ARM_AARCH64_COMPAT_32_BIT := y

include device/broadcom/dawson/dawson.mk

PRODUCT_NAME                   := dawsonk64
PRODUCT_MODEL                  := dawson
PRODUCT_BRAND                  := google
PRODUCT_DEVICE                 := dawson
