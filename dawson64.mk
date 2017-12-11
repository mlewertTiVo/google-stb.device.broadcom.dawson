export LOCAL_PRODUCT_OUT       := dawson64
export LOCAL_DEVICE_FULL_TREBLE  := y
# this is a 64bit target device.
export LOCAL_ARM_AARCH64_NOT_ABI_COMPATIBLE := n
export LOCAL_ANDROID_64BIT       := y

# compile the rc's for the device.
LOCAL_DEVICE_RCS                 := device/broadcom/common/rcs/init.rc:root/init.dawson64.rc
LOCAL_DEVICE_RCS                 += device/broadcom/common/rcs/ueventd.rc:root/ueventd.dawson64.rc
LOCAL_DEVICE_RECOVERY_RCS        := device/broadcom/common/rcs/init.recovery.rc:root/init.recovery.dawson64.rc

LOCAL_DEVICE_FSTAB               := device/broadcom/dawson/fstab/fstab.verity.ab-update.early:root/fstab.dawson64
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
export LOCAL_DEVICE_GPT          := device/broadcom/common/gpts/ab-u.o.conf
export LOCAL_DEVICE_GPT_O_LAYOUT := y
export LOCAL_DEVICE_BOOT         := 67108864   # 64M

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
#$(call inherit-product, build/make/target/product/product_launched_with_o_mr1.mk)
PRODUCT_SHIPPING_API_LEVEL       := 27
PRODUCT_NAME                     := dawson64
PRODUCT_MODEL                    := dawson64
PRODUCT_BRAND                    := google
PRODUCT_DEVICE                   := dawson64

# additional setup per device.
PRODUCT_PROPERTY_OVERRIDES    += ro.hardware=dawson64
TARGET_BOOTLOADER_BOARD_NAME := dawson64
