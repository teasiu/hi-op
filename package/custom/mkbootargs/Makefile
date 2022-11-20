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
  DEPENDS:=
endef

define Package/mkbootargs/description
	Language Support Packages.
endef

define Build/Compile
endef

define Package/mkbootargs/install
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_BIN) ./files/emmc_bootargs_32.txt $(1)/etc/emmc_bootargs_32.txt
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) ./files/chgmac.sh $(1)/usr/bin/chgmac.sh
endef

$(eval $(call BuildPackage,mkbootargs))
