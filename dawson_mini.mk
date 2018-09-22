# dawson variant with 1GB ram configuration.  requires proper bootloader
# adjusted profile.
export LOCAL_DEVICE_LOWRAM := y
export LOCAL_DEVICE_DALVIK_CONFIG := frameworks/native/build/tablet-7in-hdpi-1024-dalvik-heap.mk
include device/broadcom/dawson/dawson.mk

PRODUCT_NAME                   := dawson_mini
PRODUCT_MODEL                  := dawson
PRODUCT_BRAND                  := broadcom
PRODUCT_DEVICE                 := dawson

PRODUCT_SYSTEM_SERVER_COMPILER_FILTER := speed-profile
PRODUCT_ALWAYS_PREOPT_EXTRACTED_APK   := true

