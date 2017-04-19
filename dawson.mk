# mandatory device configuration.
export LOCAL_ARM_AARCH64         := y
export LOCAL_ARM_AARCH64_NOT_ABI_COMPATIBLE := y
export NEXUS_PLATFORM            := 97268
export BCHP_VER                  := B0
export PLATFORM                  := 97268
export ANDROID_PRODUCT_OUT       := dawson

# compile the rc's for the device.
LOCAL_DEVICE_RCS                 := device/broadcom/common/rcs/init.rc:root/init.dawson.rc
LOCAL_DEVICE_RCS                 += device/broadcom/common/rcs/ueventd.rc:root/ueventd.dawson.rc
LOCAL_DEVICE_RECOVERY_RCS        := device/broadcom/common/rcs/init.recovery.rc:root/init.recovery.dawson.rc
LOCAL_DEVICE_FSTAB               := device/broadcom/common/fstab/fstab.verity.squashfs.ab-update:root/fstab.dawson

# compile the media codecs for the device.
LOCAL_DEVICE_MEDIA               := device/broadcom/common/media/media_codecs_no_legacy_enc.xml:system/etc/media_codecs.xml
LOCAL_DEVICE_MEDIA               += device/broadcom/common/media/media_codecs_performance_no_legacy_enc.xml:system/etc/media_codecs_performance.xml

# temporary: test sage binaries for dtu support.
export SAGE_APP_BINARY_PATH      := device/broadcom/dawson/dawson/sage_dtu/slogs

# common to all dawson devices.
include device/broadcom/dawson/common.mk

# kernel command line.
LOCAL_DEVICE_KERNEL_CMDLINE      += bmem=274m@416m
LOCAL_DEVICE_KERNEL_CMDLINE      += brcm_cma=725m@800m

# board missing bt, disable for now.
export ANDROID_ENABLE_BT          := n

# no legacy decoder (vp8, h263, mpeg4) in hardware s.2
export HW_HVD_REVISION := S
# v3d mmu available.
export HW_GPU_MMU_SUPPORT         := y
# dtu enabled.
export HW_DTU_SUPPORT             := y

# *** WARNING: O-BRING-UP: no drm's.
export ANDROID_SUPPORTS_WIDEVINE  := n
export ANDROID_SUPPORTS_PLAYREADY := n
# *** WARNING: O-BRING-UP: no drm's.

# baseline the common support.
$(call inherit-product, device/broadcom/common/bcm.mk)
PRODUCT_NAME                     := dawson
PRODUCT_MODEL                    := dawson
PRODUCT_BRAND                    := broadcom
PRODUCT_DEVICE                   := dawson

# additional setup per device.
PRODUCT_PROPERTY_OVERRIDES    += ro.hardware=dawson
PRODUCT_PROPERTY_OVERRIDES    += ro.product.board=dawson
