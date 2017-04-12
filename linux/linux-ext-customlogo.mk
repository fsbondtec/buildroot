################################################################################
#
# Custom logo
#
################################################################################

LINUX_EXTENSIONS += customlogo

define CUSTOMLOGO_PREPARE_KERNEL
	cp $(CUSTOMLOGO_DIR)/logo_linux_clut224.ppm $(LINUX_DIR)/drivers/video/logo/logo_linux_clut224.ppm
endef
