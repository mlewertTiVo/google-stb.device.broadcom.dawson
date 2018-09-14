LOCAL_PATH := $(my-dir)

include $(LOCAL_PATH)/AndroidKernel.mk
include $(LOCAL_PATH)/AndroidPhony.mk

INSTALLED_RADIOIMAGE_TARGET += $(PRODUCT_OUT)/bootloader.img

ifneq ($(BCM_DIST_BLIMG_BINS),y)
$(call add-radio-file, gpt.bin)
endif
