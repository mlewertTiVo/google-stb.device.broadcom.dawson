# mandatory device configuration.
export LOCAL_ARM_AARCH64         := y
export LOCAL_ARM_AARCH64_NOT_ABI_COMPATIBLE := y
export NEXUS_PLATFORM            := 97268
export BCHP_VER                  := B0
export PLATFORM                  := 97268
export ANDROID_PRODUCT_OUT       := dawsonb0

# compile the rc's for the device.
LOCAL_DEVICE_RCS                 := device/broadcom/common/rcs/init.rc:root/init.dawsonb0.rc
LOCAL_DEVICE_RCS                 += device/broadcom/common/rcs/ueventd.rc:root/ueventd.dawsonb0.rc
LOCAL_DEVICE_RECOVERY_RCS        := device/broadcom/common/rcs/init.recovery.rc:root/init.recovery.dawsonb0.rc
LOCAL_DEVICE_FSTAB               := device/broadcom/common/fstab/fstab.verity.squashfs.ab-update:root/fstab.dawsonb0

# compile the media codecs for the device.
LOCAL_DEVICE_MEDIA               := device/broadcom/common/media/media_codecs_no_legacy_enc.xml:system/etc/media_codecs.xml
LOCAL_DEVICE_MEDIA               += device/broadcom/common/media/media_codecs_performance_no_legacy_enc.xml:system/etc/media_codecs_performance.xml

# common to all dawson devices.
include device/broadcom/dawson/common.mk

# board missing bt, disable for now.
export ANDROID_ENABLE_BT          := n

# no legacy decoder (vp9, h263, mpeg4) in hardware s.2
export HW_DECODER_LEGACY_SUPPORT  := n

# baseline the common support.
$(call inherit-product, device/broadcom/common/bcm.mk)
PRODUCT_NAME                     := dawsonb0
PRODUCT_MODEL                    := dawsonb0
PRODUCT_BRAND                    := broadcom
PRODUCT_DEVICE                   := dawsonb0

# additional setup per device.
PRODUCT_PROPERTY_OVERRIDES    += ro.hardware=dawsonb0
PRODUCT_PROPERTY_OVERRIDES    += ro.product.board=dawsonb0
