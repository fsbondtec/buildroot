#############################################################
#
# xsd
#
#############################################################
XSD_VERSION = 4.0.0
XSD_SOURCE = xsd-$(XSD_VERSION).tar.bz2
XSD_SITE = http://www.codesynthesis.com/download/xsd/4.0
XSD_INSTALL_STAGING = YES

define XSD_INSTALL_STAGING_CMDS
	#note $(install) is not working to copy directory recursivley
    cp -r -dpf $(@D)/libxsd/xsd $(STAGING_DIR)/usr/include/xsd
endef

$(eval $(generic-package))
