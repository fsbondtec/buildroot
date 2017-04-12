################################################################################
#
# customlogo
#
################################################################################

CUSTOMLOGO_SOURCE =

define CUSTOMLOGO_BUILD_CMDS
	convert $(BR2_PACKAGE_CUSTOMLOGO_PATH) \
		-dither None -colors 224 -compress none \
		$(@D)/logo_linux_clut224.ppm
endef

$(eval $(generic-package))
