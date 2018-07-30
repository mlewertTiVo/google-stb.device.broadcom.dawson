export LOCAL_ARM_AARCH64_NOT_ABI_COMPATIBLE := n
export LOCAL_ANDROID_64BIT                  := y
export ANDROID_SUPPORTS_PLAYREADY           := n

# *** only 64bit support, no mixed mode.
export LOCAL_ANDROID_64BIT_ONLY             := y

include device/broadcom/dawson/dawson.mk

PRODUCT_NAME                   := dawson_o64
PRODUCT_MODEL                  := dawson
PRODUCT_BRAND                  := google
PRODUCT_DEVICE                 := dawson
