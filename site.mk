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

GLUON_BRANCH ?= experimental
DEFAULT_GLUON_RELEASE := 0.1.8~$(GLUON_BRANCH)_$(shell date '+%Y%m%d')

# Allow overriding the release number from the command line
GLUON_RELEASE ?= $(DEFAULT_GLUON_RELEASE)

# Region code required for some images; supported values: us eu
GLUON_REGION ?= eu

GLUON_PRIORITY ?= 0
GLUON_LANGS ?= de en
