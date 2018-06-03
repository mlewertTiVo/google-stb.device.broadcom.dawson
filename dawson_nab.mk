# dawson variant which does not support a|b mode, therefore
# only legacy style single slot and recovery.
export LOCAL_DEVICE_FORCED_NAB := y
include device/broadcom/dawson/dawson.mk

PRODUCT_NAME                   := dawson_nab
PRODUCT_MODEL                  := dawson
PRODUCT_BRAND                  := broadcom
PRODUCT_DEVICE                 := dawson
