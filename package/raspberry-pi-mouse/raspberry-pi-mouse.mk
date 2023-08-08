################################################################################
#
# raspberry-pi-mouse
#
################################################################################

RASPBERRY_PI_MOUSE_VERSION = 4f0ebeabf2d2c67092a86324dbcbfd06b4dd16c8
RASPBERRY_PI_MOUSE_SITE = $(call github,rt-net,RaspberryPiMouse,$(RASPBERRY_PI_MOUSE_VERSION))
RASPBERRY_PI_MOUSE_LICENSE = Apache-2.0
RASPBERRY_PI_MOUSE_LICENSE_FILES = LICENSE

RASPBERRY_PI_MOUSE_MODULE_SUBDIRS = src/drivers

define RASPBERRY_PI_MOUSE_TWEAK
	$(SED) 's/^#define RASPBERRYPI 2$$/#define RASPBERRYPI 4/' \
		$(@D)/$(RASPBERRY_PI_MOUSE_MODULE_SUBDIRS)/rtmouse.c
endef

RASPBERRY_PI_MOUSE_PRE_BUILD_HOOKS += RASPBERRY_PI_MOUSE_TWEAK

$(eval $(kernel-module))
$(eval $(generic-package))
