#!/bin/sh
#
###############################################################################################
# Jenkins-Buildscript zu erstellung der Images
#
# Dieses Script wird nach jedem Push auf dem Freifunk Buildserver ausgführt
# und erstelt die Images komplett neu.
#
# Durch den Jenkins-Server werden folgende Systemvariablem gesetzt:
# $WORKSPACE - Arbeitsverzeichnis, hierhin wurde dieses repo geclont
# $JENKINS_HOME - TBD
# $BUILD_NUMBER - Nummer des aktuellen Buildvorganges (wird in der site.conf verwendet)
#
###############################################################################################
# Based on https://github.com/FreiFunkMuenster/site-ffms/blob/master/build-jenkins.sh
###############################################################################################

set -e

# Globale Einstellungen
export GLUON_URL=https://github.com/freifunk-gluon/gluon.git
export GLUON_COMMIT=$2
export BUILD_TYPE=$3
export VERSION=$4
export GLUON_RELEASE="${VERSION}${BUILD_TYPE}"

export SITE_URL=$5
export SITE_BRANCH=$6

export CORES=$7
export VERBOSE=$8

echo "Building gluon $GLUON_COMMIT -> $GLUON_RELEASE"

# Verzeichnis für Gluon-Repo erstellen und initialisieren
echo  "/tmp/$1"

test -d "/tmp/$1" || git clone "$GLUON_URL" "/tmp/$1"
cd "/tmp/$1"
git fetch
git checkout $GLUON_COMMIT

# Site config kopieren
test -d "/tmp/$1/site" && rm -r "/tmp/$1/site"
mkdir "/tmp/$1/site"
git clone $SITE_URL "/tmp/$1/site"
cd "/tmp/$1/site/"
git fetch
git checkout $SITE_BRANCH

# Gluon Pakete aktualisieren und Build ausfuhren
cd "/tmp/$1"

# make update
echo make update -j $CORES "GLUON_RELEASE=$GLUON_RELEASE"
make update -j $CORES "GLUON_RELEASE=$GLUON_RELEASE"

# echo make -j $CORES V=$VERBOSE GLUON_DEPRECATED=full GLUON_TARGET=ar71xx-generic GLUON_BRANCH=$BUILD_TYPE GLUON_RELEASE=$GLUON_RELEASE GLUON_OUTPUTDIR=$GLUON_IMAGEDIR
# make -j $CORES V=$VERBOSE GLUON_DEPRECATED=full GLUON_TARGET=ar71xx-generic GLUON_BRANCH=$BUILD_TYPE GLUON_RELEASE=$GLUON_RELEASE GLUON_OUTPUTDIR=$GLUON_IMAGEDIR
# Manifest für Autoupdater erstellen und mit den Key des Servers unterschreiben
# Der private Schlüssel des Servers muss in $JENKINS_HOME/secret liegen und das
# Tools 'ecdsasign' muss auf dem Server verfügbar sein.
# Repo: https://github.com/tcatm/ecdsautils

