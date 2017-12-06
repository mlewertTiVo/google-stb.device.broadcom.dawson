export ANDROID_PRODUCT_OUT       := dawsonk64
export LOCAL_DEVICE_FULL_TREBLE  := y
# enable user mode 32bit with kernel mode 64bit compatible mode.
export LOCAL_ARM_AARCH64_COMPAT_32_BIT := y
# TODO: enable wifi for armv8 (dhd)
export HW_WIFI_SUPPORT                 := n

# compile the rc's for the device.
LOCAL_DEVICE_RCS                 := device/broadcom/common/rcs/init.rc:root/init.dawsonk64.rc
LOCAL_DEVICE_RCS                 += device/broadcom/common/rcs/ueventd.rc:root/ueventd.dawsonk64.rc
LOCAL_DEVICE_RECOVERY_RCS        := device/broadcom/common/rcs/init.recovery.rc:root/init.recovery.dawsonk64.rc

LOCAL_DEVICE_FSTAB               := device/broadcom/dawson/fstab/fstab.verity.ab-update.early:root/fstab.dawsonk64
LOCAL_DEVICE_FSTAB               += device/broadcom/dawson/fstab/fstab.verity.ab-update.early:root/fstab.bcm
export LOCAL_DEVICE_FSTAB

LOCAL_DEVICE_RECOVERY_FSTAB      := device/broadcom/common/recovery/fstab.ab-update/recovery.fstab
export LOCAL_DEVICE_RECOVERY_FSTAB

# compile the media codecs for the device.
LOCAL_DEVICE_MEDIA               := device/broadcom/common/media/media_codecs_no_legacy_enc.xml:system/etc/media_codecs.xml

export LOCAL_SYSTEMIMAGE_SQUASHFS := n
export LOCAL_VENDORIMAGE_SQUASHFS := n
export HW_AB_UPDATE_SUPPORT      := y
export LOCAL_DEVICE_USE_VERITY   := y
export LOCAL_DEVICE_GPT          := device/broadcom/common/gpts/ab-u.conf

# common to all dawson devices.
include device/broadcom/dawson/common.mk

# kernel command line.
LOCAL_DEVICE_KERNEL_CMDLINE      += bmem=242m@414m
LOCAL_DEVICE_KERNEL_CMDLINE      += brcm_cma=768m@1240m

# no legacy decoder (vp8, h263, mpeg4) in hardware s.2
export HW_HVD_REVISION            := S
# v3d mmu available.
export HW_GPU_MMU_SUPPORT         := y

# baseline the common support.
$(call inherit-product, device/broadcom/common/bcm.mk)
$(call inherit-product, build/make/target/product/product_launched_with_n.mk)
PRODUCT_NAME                     := dawsonk64
PRODUCT_MODEL                    := dawsonk64
PRODUCT_BRAND                    := google
PRODUCT_DEVICE                   := dawsonk64

# additional setup per device.
PRODUCT_PROPERTY_OVERRIDES    += ro.hardware=dawsonk64
TARGET_BOOTLOADER_BOARD_NAME := dawsonk64
