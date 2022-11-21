#
# Copyright (C) 2016-2017 GitHub 
#
# This is free software, licensed under the GNU General Public License v3.
# See /LICENSE for more information.

include $(TOPDIR)/rules.mk

PKG_NAME:=mkbootargs
PKG_VERSION:=2
PKG_RELEASE:=32
PKG_LICENSE:=GPLv3
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk

define Package/mkbootargs
  SECTION:=luci
  CATEGORY:=LuCI
  TITLE:=LuCI support for Default Settings
  PKGARCH:=all
  DEPENDS:=bash
endef

ifeq ($(ARCH),arm)
	PKG_ARCH:=armhf
endif
ifeq ($(ARCH),aarch64)
	PKG_ARCH:=arm64
endif

define Package/mkbootargs/description
	Language Support Packages.
endef

define Build/Compile
endef

define Package/mkbootargs/install
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_BIN) ./files/emmc_bootargs_$(PKG_ARCH).txt $(1)/etc/emmc_bootargs.txt
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) ./files/chgmac.sh $(1)/usr/bin/chgmac.sh
	$(INSTALL_BIN) ./files/mkbootargs_$(PKG_ARCH) $(1)/usr/bin/mkbootargs
endef

$(eval $(call BuildPackage,mkbootargs))
