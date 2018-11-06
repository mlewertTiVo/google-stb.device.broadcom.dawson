ifndef LOCAL_PRODUCT_OUT
export LOCAL_PRODUCT_OUT         := dawson
endif

ifeq ($(LOCAL_DEVICE_FORCED_NAB),y)
export LOCAL_DEVICE_GPT          := device/broadcom/common/gpts/nab.o.conf
LOCAL_DEVICE_FSTAB               := device/broadcom/dawson/fstab/fstab.verity.early:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.dawson
LOCAL_DEVICE_FSTAB               += device/broadcom/dawson/fstab/fstab.verity.early:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.bcm
LOCAL_DEVICE_RECOVERY_FSTAB      := device/broadcom/common/recovery/fstab.default/recovery.fstab
else
export HW_AB_UPDATE_SUPPORT      := y
ifeq ($(LOCAL_ARM_TRUSTZONE_USE),y)
export LOCAL_DEVICE_GPT          := device/broadcom/common/gpts/ab-u.o.tee.conf
else
export LOCAL_DEVICE_GPT          := device/broadcom/common/gpts/ab-u.o.conf
endif
ifeq ($(LOCAL_DEVICE_LOWRAM),y)
LOCAL_DEVICE_FSTAB               := device/broadcom/dawson/fstab/fstab.verity.ab-update.early.bp3.zram:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.dawson
LOCAL_DEVICE_FSTAB               += device/broadcom/dawson/fstab/fstab.verity.ab-update.early.bp3.zram:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.bcm
else
LOCAL_DEVICE_FSTAB               := device/broadcom/dawson/fstab/fstab.verity.ab-update.early:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.dawson
LOCAL_DEVICE_FSTAB               += device/broadcom/dawson/fstab/fstab.verity.ab-update.early:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.bcm
endif
LOCAL_DEVICE_RECOVERY_FSTAB      := device/broadcom/common/recovery/fstab.ab-update/recovery.fstab
endif
export LOCAL_DEVICE_GPT_O_LAYOUT := y
export LOCAL_DEVICE_FSTAB
export LOCAL_DEVICE_RECOVERY_FSTAB

# compile the rc's for the device.
LOCAL_DEVICE_RCS                 := device/broadcom/common/rcs/init.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.dawson.rc
LOCAL_DEVICE_RCS                 += device/broadcom/common/rcs/ueventd.rc:$(TARGET_COPY_OUT_VENDOR)/ueventd.rc
LOCAL_DEVICE_RECOVERY_RCS        := device/broadcom/common/rcs/init.recovery.rc:root/init.recovery.dawson.rc

# compile the media codecs for the device.
LOCAL_DEVICE_MEDIA               := device/broadcom/common/media/media_codecs_no_legacy_enc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml

export LOCAL_DEVICE_USE_VERITY   := y

# common to all dawson devices.
include device/broadcom/dawson/common.mk

# kernel command line.
ifeq ($(LOCAL_DEVICE_LOWRAM),y)
LOCAL_DEVICE_KERNEL_CMDLINE      += bmem=38m@510m
LOCAL_DEVICE_KERNEL_CMDLINE      += brcm_cma=436m@548m
LOCAL_DEVICE_KERNEL_CMDLINE      += vmalloc=514m
#LOCAL_DEVICE_KERNEL_CMDLINE     += brcmv3d.ignore_cma=1
else
LOCAL_DEVICE_KERNEL_CMDLINE      += bmem=242m@414m
LOCAL_DEVICE_KERNEL_CMDLINE      += brcm_cma=768m@1176m
endif

# no legacy decoder (vp8, h263, mpeg4) in hardware s.2
export HW_HVD_REVISION            := S
# v3d mmu available.
export HW_GPU_MMU_SUPPORT         := y

# baseline the common support.
$(call inherit-product, device/broadcom/common/bcm.mk)
$(call inherit-product, build/make/target/product/product_launched_with_o.mk)
PRODUCT_NAME                     := dawson
PRODUCT_MODEL                    := dawson
PRODUCT_BRAND                    := google
PRODUCT_DEVICE                   := dawson

# additional setup per device.
PRODUCT_PROPERTY_OVERRIDES += \
   ro.hardware=dawson \
   \
   ro.opengles.version=196609 \
   ro.nx.mma=1 \
   \
   ro.nx.heap.drv_managed=0m \
   ro.nx.capable.dtu=1 \
   \
   ro.nx.hwc2.tweak.fbcomp=1 \
   ro.nx.capable.cb=1 \
   ro.sf.lcd_density=320 \
   \
   ro.nx.eth.irq_mode_mask=f:c \
   \
   ro.com.google.clientidbase=android-dawson-tv

ifeq ($(LOCAL_DEVICE_LOWRAM),y)
PRODUCT_PROPERTY_OVERRIDES += \
   ro.nx.hwc2.tweak.fbs=2 \
   \
   ro.nx.heap.video_secure=36m \
   ro.nx.heap.main=66m \
   ro.nx.heap.grow=2m \
   ro.nx.heap.shrink=2m \
   ro.nx.heap.gfx=0m \
   \
   ro.config.low_ram=true \
   ro.lmk.critical=-700 \
   ro.lmk.medium=800 \
   ro.lmk.low=900 \
   ro.lmk.kill_heaviest_task=true \
   ro.lmk.kill_timeout_ms=0 \
   ro.lmk.critical_upgrade=true \
   ro.lmk.upgrade_pressure=70 \
   ro.lmk.downgrade_pressure=95 \
   \
   pm.dexopt.shared=quicken \
   \
   ro.nx.audio.pbk=2 \
   ro.nx.audio.pbkfifosz=48k \
   ro.nx.audio.pcm=1 \
   ro.nx.trpt.pband=1 \
   ro.nx.trpt.ppump=2 \
   ro.nx.trim.deint=1 \
   ro.nx.trim.disp.cap=1 \
   \
   ro.nx.dtu.all=1
else
PRODUCT_PROPERTY_OVERRIDES += \
   ro.nx.heap.video_secure=80m \
   ro.nx.heap.main=96m \
   ro.nx.heap.grow=2m \
   ro.nx.heap.shrink=2m \
   ro.nx.heap.gfx=64m
endif

TARGET_BOOTLOADER_BOARD_NAME := dawson
