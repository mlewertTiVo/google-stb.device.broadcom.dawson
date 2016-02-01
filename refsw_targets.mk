#
# (partial) list of targets generated by 'bcm_refsw.mk'
#

REFSW_TARGET_LIST := \
	brcm_nexus/bin/bcmnexusfb.ko \
	brcm_nexus/bin/libb_os.so \
	brcm_nexus/bin/libnexus_client.so \
	brcm_nexus/bin/libnexus.so \
	brcm_nexus/bin/libnexus_static.a \
	brcm_nexus/bin/libnxclient_local.so \
	brcm_nexus/bin/libnxclient.so \
	brcm_nexus/bin/libnxserver.a \
	brcm_nexus/bin/libmagnum.a \
	brcm_nexus/bin/nexus \
	brcm_nexus/bin/nexus.client \
	brcm_nexus/bin/nexus.ko \
	brcm_nexus/bin/nx_ashmem.ko \
	brcm_nexus/bin/logger \
	brcm_nexus/bin/wakeup_drv.ko \
	libGLES_nexus/bin/libGLES_nexus.so \

ifeq ($(SAGE_SUPPORT),y)
REFSW_TARGET_LIST += \
	brcm_nexus/bin/sage_bl.bin \
	brcm_nexus/bin/sage_bl_dev.bin \
	brcm_nexus/bin/sage_os_app.bin \
	brcm_nexus/bin/sage_os_app_dev.bin
endif
