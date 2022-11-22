#
# Copyright (C) 2016-2017 GitHub 
#
# This is free software, licensed under the GNU General Public License v3.
# See /LICENSE for more information.

include $(TOPDIR)/rules.mk

PKG_NAME:=frp
PKG_VERSION:=0.45.0
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/frp
  TITLE:=A fast reverse proxy
  URL:=https://github.com/fatedier/frp
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Web Servers/Proxies
  DEPENDS:=bash
endef

ifeq ($(ARCH),arm)
	PKG_ARCH:=armhf
endif
ifeq ($(ARCH),aarch64)
	PKG_ARCH:=arm64
endif

define Package/frp/description
	A fast reverse proxy.
endef

define Build/Compile
endef

define Package/frp/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) ./files/frpc_$(PKG_ARCH) $(1)/usr/bin/frpc
endef

$(eval $(call BuildPackage,frp))
