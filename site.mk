GLUON_SITE_PACKAGES := \
  gluon-mesh-batman-adv-15 \
  gluon-alfred \
  gluon-respondd \
  gluon-autoupdater \
  gluon-config-mode-autoupdater \
  gluon-config-mode-contact-info \
  gluon-config-mode-core \
  gluon-config-mode-geo-location \
  gluon-config-mode-hostname \
  gluon-config-mode-mesh-vpn \
  gluon-ebtables-filter-multicast \
  gluon-ebtables-filter-ra-dhcp \
  gluon-luci-admin \
  gluon-luci-autoupdater \
  gluon-luci-portconfig \
  gluon-luci-wifi-config \
  gluon-luci-private-wifi \
  gluon-next-node \
  gluon-mesh-vpn-fastd \
  gluon-radvd \
  gluon-setup-mode \
  gluon-status-page \
  haveged \
  iptables \
  iwinfo

GLUON_BRANCH ?= experimental
DEFAULT_GLUON_RELEASE := 0.1.8~$(GLUON_BRANCH)_$(shell date '+%Y%m%d')

# Allow overriding the release number from the command line
GLUON_RELEASE ?= $(DEFAULT_GLUON_RELEASE)

# Region code required for some images; supported values: us eu
GLUON_REGION ?= eu

GLUON_PRIORITY ?= 0
GLUON_LANGS ?= de en
