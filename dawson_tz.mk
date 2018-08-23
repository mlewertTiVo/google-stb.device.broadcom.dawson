# cypress variant which does add support for arm trustzone
# integration, implies it runs in kernel 64 + android 32 mode.
export LOCAL_ARM_AARCH64_COMPAT_32_BIT := y
export LOCAL_ARM_TRUSTZONE_USE         := y

include device/broadcom/dawson/dawson.mk

PRODUCT_NAME                   := dawson_tz
PRODUCT_MODEL                  := dawson
PRODUCT_BRAND                  := google
PRODUCT_DEVICE                 := dawson

