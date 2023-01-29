# mindestens die kommentierten Zeilen sind anzupassen
FROM debian:stable-slim
# Gluon Version anpassen
ENV GLUON_VERSION=v2022.1.1
# stable, beta oder experimental anpassen
ENV BUILD_TYPE=beta
# Version für firmware anpassen
ENV VERSION=1.4.15
ENV GLUON_URL=https://github.com/freifunk-gluon/gluon.git

ENV SITE_URL=https://github.com/freifunk-suedpfalz/site-ffsuedpfalz
## Git Branch der für den Build benutzt wird anpassen
ENV SITE_BRANCH=1.4.15_b

ENV FORCE_UNSAFE_CONFIGURE=1
ENV CORES=16

ENV VERBOSE=w

ENV GLUON_IMAGEDIR=/output

ENV FORCE_UNSAFE_CONFIGURE=1

RUN apt-get update \
    && apt-get install -y subversion cmake help2man wget curl python2.7 python3 rsync build-essential gnupg gawk unzip ncurses-dev git qemu-utils\
    && apt-get update \
    && curl https://bootstrap.pypa.io/pip/2.7/get-pip.py --output get-pip.py && python2.7 get-pip.py

COPY build-jenkins.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/build-jenkins.sh
RUN ln -s /usr/local/bin/build-jenkins.sh /

ENTRYPOINT build-jenkins.sh $GLUON_VERSION $BUILD_TYPE $VERSION $SITE_URL $SITE_BRANCH $CORES $VERBOSE \
           && cd /tmp/$SITE_BRANCH \
           && for TARGET in $(make list-targets); do \
               make -j $CORES V=$VERBOSE GLUON_OUTPUTDIR=$GLUON_IMAGEDIR GLUON_DEPRECATED=full GLUON_TARGET=$TARGET GLUON_AUTOUPDATER_BRANCH=$BUILD_TYPE GLUON_AUTOUPDATER_ENABLED=1 GLUON_RELEASE=$VERSION$BUILD_TYPE; \
           done \
           && make manifest GLUON_AUTOUPDATER_BRANCH=$BUILD_TYPE GLUON_RELEASE=$VERSION$BUILD_TYPE
