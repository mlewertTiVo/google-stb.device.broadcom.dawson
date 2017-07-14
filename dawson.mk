export ANDROID_PRODUCT_OUT       := dawson

# compile the rc's for the device.
LOCAL_DEVICE_RCS                 := device/broadcom/common/rcs/init.rc:root/init.dawson.rc
LOCAL_DEVICE_RCS                 += device/broadcom/common/rcs/ueventd.rc:root/ueventd.dawson.rc
LOCAL_DEVICE_RECOVERY_RCS        := device/broadcom/common/rcs/init.recovery.rc:root/init.recovery.dawson.rc

LOCAL_DEVICE_FSTAB               := device/broadcom/dawson/fstab/fstab.verity.squashfs.ab-update.early:root/fstab.dawson
LOCAL_DEVICE_FSTAB               += device/broadcom/dawson/fstab/fstab.verity.squashfs.ab-update.early:root/fstab.bcm
export LOCAL_DEVICE_FSTAB

LOCAL_DEVICE_RECOVERY_FSTAB      := device/broadcom/common/recovery/fstab.ab-update/recovery.fstab
export LOCAL_DEVICE_RECOVERY_FSTAB

# compile the media codecs for the device.
LOCAL_DEVICE_MEDIA               := device/broadcom/common/media/media_codecs_no_legacy_enc.xml:system/etc/media_codecs.xml
LOCAL_DEVICE_MEDIA               += device/broadcom/common/media/media_codecs_performance_v2_no_legacy_enc.xml:system/etc/media_codecs_performance.xml

export LOCAL_SYSTEMIMAGE_SQUASHFS := y
export LOCAL_VENDORIMAGE_SQUASHFS := n
export HW_AB_UPDATE_SUPPORT      := y
export LOCAL_DEVICE_USE_VERITY   := y
export LOCAL_DEVICE_GPT          := device/broadcom/common/gpts/ab-u.conf
export LOCAL_DEVICE_SEPOLICY_BLOCK := device/broadcom/dawson/sepolicy-block

# common to all dawson devices.
include device/broadcom/dawson/common.mk

# kernel command line.
LOCAL_DEVICE_KERNEL_CMDLINE      += bmem=528m@416m
LOCAL_DEVICE_KERNEL_CMDLINE      += brcm_cma=744m@944m

# no legacy decoder (vp8, h263, mpeg4) in hardware s.2
export HW_HVD_REVISION            := S
# v3d mmu available.
export HW_GPU_MMU_SUPPORT         := y

# baseline the common support.
$(call inherit-product, device/broadcom/common/bcm.mk)
PRODUCT_NAME                     := dawson
PRODUCT_MODEL                    := dawson
PRODUCT_BRAND                    := google
PRODUCT_DEVICE                   := dawson

# additional setup per device.
PRODUCT_PROPERTY_OVERRIDES    += ro.hardware=dawson
PRODUCT_PROPERTY_OVERRIDES    += ro.product.board=dawson
