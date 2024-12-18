# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2022-2023 ImmortalWrt.org

include $(TOPDIR)/rules.mk

LUCI_TITLE:=The modern ImmortalWrt proxy platform for ARM64/AMD64
LUCI_PKGARCH:=all

ifdef CONFIG_PACKAGE_firewall4
LUCI_DEPENDS:= \
	+sing-box \
	+chinadns-ng \
	+firewall4 \
	+kmod-nft-tproxy
else
LUCI_DEPENDS:= \
	+sing-box \
	+chinadns-ng \
	+firewall \
	+kmod-ipt-tproxy
endif

PKG_NAME:=luci-app-homeproxy

define Package/luci-app-homeproxy/conffiles
/etc/config/homeproxy
/etc/homeproxy/certs/
/etc/homeproxy/ruleset/
/etc/homeproxy/resources/direct_list.txt
/etc/homeproxy/resources/proxy_list.txt
endef

include $(TOPDIR)/feeds/luci/luci.mk

# call BuildPackage - OpenWrt buildroot signature
