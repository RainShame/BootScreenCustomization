GO_EASY_ON_ME = 1
DEBUG = 0
TARGET = iphone:9.2
ARCHS = armv7 arm64

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = BootScreenCustomization
BootScreenCustomization_FILES = Tweak.xm
BootScreenCustomization_FRAMEWORKS = CoreGraphics QuartzCore UIKit

include $(THEOS_MAKE_PATH)/tweak.mk

BUNDLE_NAME = BSCSettings
BSCSettings_FILES = BSCPreferenceController.m
BSCSettings_INSTALL_PATH = /Library/PreferenceBundles
BSCSettings_PRIVATE_FRAMEWORKS = Preferences
BSCSettings_FRAMEWORKS = CoreGraphics Social UIKit
BSCSettings_LIBRARIES = cephei cepheiprefs

include $(THEOS_MAKE_PATH)/bundle.mk

after-install::
	install.exec "killall -9 backboardd"


internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/BootScreenCustomization.plist$(ECHO_END)
	$(ECHO_NOTHING)find $(THEOS_STAGING_DIR) -name .DS_Store | xargs rm -rf$(ECHO_END)
