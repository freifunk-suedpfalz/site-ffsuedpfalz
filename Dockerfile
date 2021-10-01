FROM debian:stable-slim
ENV GLUON_VERSION=v2020.2.2
ENV BUILD_TYPE=beta
ENV BRANCH_NAME=1.4.13_b
ENV VERSION=1.4.13
ENV GLUON_URL=https://github.com/freifunk-gluon/gluon.git

ENV SITE_URL=https://github.com/freifunk-suedpfalz/site-ffsuedpfalz
ENV SITE_BRANCH=1.4.13_b

ENV FORCE_UNSAFE_CONFIGURE=1
ENV CORES=7

ENV VERBOSE=w

ENV GLUON_IMAGEDIR=/output
VOLUME /output

RUN apt-get update \
    && apt-get install -y cmake help2man wget curl python2.7 python-pip build-essential gnupg gawk unzip ncurses-dev git \
    && apt-get update

COPY build-jenkins.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/build-jenkins.sh
RUN ln -s /usr/local/bin/build-jenkins.sh /

ENTRYPOINT build-jenkins.sh $BRANCH_NAME $GLUON_VERSION $BUILD_TYPE $VERSION $SITE_URL $SITE_BRANCH $CORES $VERBOSE
