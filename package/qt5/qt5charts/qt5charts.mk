################################################################################
#
# qt5charts
#
################################################################################

#QT5CHARTS_VERSION = f4ba2fb9840279f986bd11ab6860e6a3125d9599
#QT5CHARTS_SITE = git://code.qt.io/qt/qtcharts.git
#QT5CHARTS_SITE_METHOD = git
#QT5CHARTS_DEPENDENCIES = qt5base qt5declarative
#QT5CHARTS_INSTALL_STAGING = YES

#define QT5CHARTS_CONFIGURE_CMDS
#	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
#endef

#define QT5CHARTS_BUILD_CMDS
#	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
#endef

#define QT5CHARTS_INSTALL_STAGING_CMDS
#	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
#endef

#define QT5CHARTS_INSTALL_TARGET_CMDS
#	cp -dpf $(STAGING_DIR)/usr/lib/libQt5Charts*.so.* $(TARGET_DIR)/usr/lib
#	cp -dpfr $(STAGING_DIR)/usr/qml/QtCharts $(TARGET_DIR)/usr/qml
#endef

#$(eval $(generic-package))


################################################################################
#
# qt5charts
#
################################################################################

QT5CHARTS_VERSION = 5.9.1
QT5CHARTS_SITE = http://download.qt.io/official_releases/qt/5.9/5.9.1/submodules
QT5CHARTS_SOURCE = qtcharts-opensource-src-5.9.1.tar.xz
QT5CHARTS_DEPENDENCIES = qt5base qt5declarative
QT5CHARTS_INSTALL_STAGING = YES

define QT5CHARTS_CONFIGURE_CMDS
	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
endef

define QT5CHARTS_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
endef

define QT5CHARTS_INSTALL_STAGING_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
endef

define QT5CHARTS_INSTALL_TARGET_CMDS
	cp -dpf $(STAGING_DIR)/usr/lib/libQt5Charts*.so.* $(TARGET_DIR)/usr/lib
	cp -dpfr $(STAGING_DIR)/usr/qml/QtCharts $(TARGET_DIR)/usr/qml
endef

$(eval $(generic-package))
