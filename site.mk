GLUON_SITE_PACKAGES := \
  gluon-mesh-batman-adv-15 \
  gluon-alfred \
  gluon-respondd \
  ffho-ath9k-blackout-workaround \
  gluon-autoupdater \
  gluon-config-mode-autoupdater \
  gluon-config-mode-contact-info \
  gluon-config-mode-core \
  gluon-config-mode-geo-location \
  gluon-config-mode-hostname \
  gluon-config-mode-tunneldigger \
  gluon-ebtables-filter-multicast \
  gluon-ebtables-filter-ra-dhcp \
  gluon-ebtables-filter-roguenets \
  gluon-luci-admin \
  gluon-luci-autoupdater \
  gluon-luci-portconfig \
  gluon-luci-wifi-config \
  gluon-luci-private-wifi \
  gluon-next-node \
  gluon-mesh-vpn-tunneldigger \
  gluon-tunneldigger-watchdog \
  gluon-radvd \
  gluon-setup-mode \
  gluon-status-page \
  gluon-migrate-vpn \
  iwinfo \
  iptables \
  haveged

USB_BASIC := \
  kmod-usb-core \
  kmod-usb2 \
  kmod-usb-hid

USB_NIC := \
  kmod-usb-net \
  kmod-usb-net-asix \
  kmod-usb-net-rtl8150 \
  kmod-usb-net-rtl8152 \
  kmod-usb-net-dm9601-ether

ifeq ($(GLUON_TARGET),x86-generic)
  GLUON_SITE_PACKAGES += \
    $(USB_BASIC) \
    kmod-usb-ohci-pci \
    $(USB_NIC)
endif

ifeq ($(GLUON_TARGET),x86-64)
  GLUON_SITE_PACKAGES += \
    $(USB_BASIC) \
    $(USB_NIC) \
    kmod-igb #APU2
endif

DEFAULT_GLUON_RELEASE := v1.2.X-exp-$(shell date '+%Y%m%d')

# Allow overriding the release number from the command line
GLUON_RELEASE ?= $(DEFAULT_GLUON_RELEASE)

# Default priority for updates.
GLUON_PRIORITY ?= 0

GLUON_LANGS ?= en de
