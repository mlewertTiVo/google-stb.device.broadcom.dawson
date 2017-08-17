export ANDROID_PRODUCT_OUT       := dawson_l

# compile the rc's for the device.
LOCAL_DEVICE_RCS                 := device/broadcom/common/rcs/init.rc:root/init.dawson_l.rc
LOCAL_DEVICE_RCS                 += device/broadcom/common/rcs/ueventd.rc:root/ueventd.dawson_l.rc
LOCAL_DEVICE_RECOVERY_RCS        := device/broadcom/common/rcs/init.recovery.rc:root/init.recovery.dawson_l.rc

LOCAL_DEVICE_FSTAB               := device/broadcom/common/fstab/fstab.default:root/fstab.dawson_l
LOCAL_DEVICE_FSTAB               += device/broadcom/common/fstab/fstab.default:root/fstab.bcm
export LOCAL_DEVICE_FSTAB

LOCAL_DEVICE_RECOVERY_FSTAB      := device/broadcom/common/recovery/fstab.default/recovery.fstab
export LOCAL_DEVICE_RECOVERY_FSTAB

# compile the media codecs for the device.
LOCAL_DEVICE_MEDIA               := device/broadcom/common/media/media_codecs_no_legacy_enc.xml:system/etc/media_codecs.xml
LOCAL_DEVICE_MEDIA               += device/broadcom/common/media/media_codecs_performance_v2_no_legacy_enc.xml:system/etc/media_codecs_performance.xml

export LOCAL_DEVICE_GPT          := device/broadcom/common/gpts/default_v2.conf
export LOCAL_DEVICE_SEPOLICY_BLOCK := device/broadcom/dawson/sepolicy-block-v2

# common to all dawson devices.
include device/broadcom/dawson/common.mk

# kernel command line.
LOCAL_DEVICE_KERNEL_CMDLINE      += bmem=528m@416m
LOCAL_DEVICE_KERNEL_CMDLINE      += brcm_cma=608m@1432m

# no legacy decoder (vp8, h263, mpeg4) in hardware s.2
export HW_HVD_REVISION := S
# v3d mmu available.
export HW_GPU_MMU_SUPPORT         := y

# baseline the common support.
$(call inherit-product, device/broadcom/common/bcm.mk)
$(call inherit-product, build/make/target/product/product_launched_with_n.mk)
PRODUCT_NAME                     := dawson_l
PRODUCT_MODEL                    := dawson_l
PRODUCT_BRAND                    := broadcom
PRODUCT_DEVICE                   := dawson_l

# additional setup per device.
PRODUCT_PROPERTY_OVERRIDES    += ro.hardware=dawson_l
PRODUCT_PROPERTY_OVERRIDES    += ro.product.board=dawson_l
