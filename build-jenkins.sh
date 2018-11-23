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
export GLUON_RELEASE=$GLUON_COMMIT-`date '+%Y%m%d'`

echo "Building gluon $GLUON_COMMIT -> $GLUON_RELEASE"

# Verzeichnis für Gluon-Repo erstellen und initialisieren
echo  "/temp/$1"

test -d "/temp/$1" || git clone "$GLUON_URL" "/temp/$1"
cd "/temp/$1"
git fetch
git checkout -f $GLUON_COMMIT

# Site config kopieren
test -d "/temp/$1/site" && rm -r "/temp/$1/site"
mkdir "/temp/$1/site"
cp -r ${WORKSPACE}/* "/temp/$1/site/"
#cp "${WORKSPACE}/modules" "/temp/$1/site/"
#cp "${WORKSPACE}/site.mk" "/temp/$1/site/"
#cp "${WORKSPACE}/site.conf" "/temp/$1/site/"

# Gluon Pakete aktualisieren und Build ausfuhren
cd "/temp/$1"

make update

# make update "GLUON_RELEASE=$GLUON_RELEASE"

# Manifest für Autoupdater erstellen und mit den Key des Servers unterschreiben
# Der private Schlüssel des Servers muss in $JENKINS_HOME/secret liegen und das
# Tools 'ecdsasign' muss auf dem Server verfügbar sein.
# Repo: https://github.com/tcatm/ecdsautils
