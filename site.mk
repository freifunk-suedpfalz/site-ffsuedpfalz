GLUON_FEATURES := \
  autoupdater \
  alfred \
  config-mode-domain-select \
  ebtables-filter-multicast \
  ebtables-filter-ra-dhcp \
  radv-filterd\
  ebtables-limit-arp \
  mesh-batman-adv-15 \
  mesh-vpn-tunneldigger \
  radvd \
  respondd \
  status-page \
  web-advanced \
  web-wizard \
  web-osm \
  config-mode-geo-location-osm

GLUON_SITE_PACKAGES := \
  gluon-autorestart \
  gluon-tunneldigger-watchdog \
  iwinfo \
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

USB_WIFI := \
  kmod-rtl8192cu

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

ifeq ($(GLUON_TARGET),brcm2708-bcm2708)
  GLUON_SITE_PACKAGES += \
    $(USB_BASIC) \
    $(USB_NIC) \
    $(USB_WIFI)
endif

ifeq ($(GLUON_TARGET),brcm2708-bcm2709)
  GLUON_SITE_PACKAGES += \
    $(USB_BASIC) \
    $(USB_NIC) \
    $(USB_WIFI)
endif

GLUON_BRANCH ?= experimental
DEFAULT_GLUON_RELEASE := 1.4.0~$(GLUON_BRANCH)_$(shell date '+%Y%m%d')

# Default priority for updates.
GLUON_PRIORITY ?= 0

GLUON_LANGS ?= en de

GLUON_ATH10K_MESH ?= 11s

GLUON_REGION := eu

GLUON_MULTIDOMAIN=1
