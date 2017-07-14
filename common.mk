# mandatory device configuration.
export LOCAL_ARM_AARCH64         := y
export LOCAL_ARM_AARCH64_NOT_ABI_COMPATIBLE := y
export NEXUS_PLATFORM            := 97268
export BCHP_VER                  := B0
export PLATFORM                  := 97268

# compile the rc's for the device.
LOCAL_DEVICE_RCS                 += device/broadcom/common/rcs/init.nx.rc:root/init.nx.rc
LOCAL_DEVICE_RCS                 += device/broadcom/common/rcs/init.fs.verity.rc:root/init.fs.rc  # verity
LOCAL_DEVICE_RCS                 += device/broadcom/common/rcs/init.eth.eth0.rc:root/init.eth.rc   # uses 'eth0'
LOCAL_DEVICE_RCS                 += device/broadcom/dawson/rcs/init.block.rc:root/init.block.rc   # block devices
LOCAL_DEVICE_RCS                 += device/broadcom/dawson/rcs/init.bcm.usb.rc:root/init.bcm.usb.rc   # uses 'configfs'
export LOCAL_DEVICE_RCS

LOCAL_DEVICE_RECOVERY_RCS        += device/broadcom/dawson/rcs/init.block.rc:root/init.recovery.block.rc   # block devices
LOCAL_DEVICE_RECOVERY_RCS        += device/broadcom/dawson/rcs/init.recovery.usb.rc:root/init.recovery.usb.rc   # uses 'configfs'
export LOCAL_DEVICE_RECOVERY_RCS

# compile the media codecs for the device.
LOCAL_DEVICE_MEDIA               += device/broadcom/common/media/media_profiles.xml:system/etc/media_profiles.xml
export LOCAL_DEVICE_MEDIA

# optional device override/addition.
export LOCAL_DEVICE_OVERLAY      := device/broadcom/dawson/overlay
export LOCAL_DEVICE_SEPOLICY_BLOCK := device/broadcom/dawson/sepolicy-block
export LOCAL_DEVICE_AON_GPIO     := device/broadcom/dawson/aon_gpio.cfg:$(TARGET_COPY_OUT_VENDOR)/power/aon_gpio.cfg
export LOCAL_DEVICE_KEY_POLL     := device/broadcom/common/keylayout/gpio_keys_polled.kl:system/usr/keylayout/gpio_keys_polled.kl
export LOCAL_DEVICE_BT_CONFIG    := device/broadcom/dawson/bluetooth/vnd_dawson.txt
export LOCAL_DEVICE_USERDATA     := 5927582720 # ~5.52GB
export HW_ENCODER_SUPPORT        := n
export BT_RFKILL_SUPPORT         := y
export ANDROID_ENABLE_BT         := uart
export LOCAL_KCONFIG_CHIP_OVERRIDE := 7271B0
export V3D_VARIANT               := vc5
export LOCAL_DEVICE_REFERENCE_BUILD := device/broadcom/dawson/reference_build.mk
export LOCAL_DEVICE_SYSTEM_VERITY_PARTITION := /dev/block/platform/rdb/f0200200.sdhci/by-name/system
export LOCAL_DEVICE_VENDOR_VERITY_PARTITION := /dev/block/platform/rdb/f0200200.sdhci/by-name/vendor

# kernel command line.
LOCAL_DEVICE_KERNEL_CMDLINE      := mem=2040m@0m
LOCAL_DEVICE_KERNEL_CMDLINE      += ramoops.mem_address=0x7F800000 ramoops.mem_size=0x800000 ramoops.console_size=0x400000
LOCAL_DEVICE_KERNEL_CMDLINE      += rootwait init=/init ro
export LOCAL_DEVICE_KERNEL_CMDLINE
