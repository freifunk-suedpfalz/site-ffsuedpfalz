pipeline {
  agent {
    node {
      label 'master'
      customWorkspace "/tmp/.jenkins_${env.BRANCH_NAME}_site"
    }
  }
  parameters {
    string(name: 'GLUON_VERSION', defaultValue: 'v2021.1.1', description: 'Gluon version')
    string(name: 'BUILD_TYPE', defaultValue: 'beta', description: 'experimental, beta, stable')
    string(name: 'VERSION', defaultValue: '1.4.14', description: 'Firmware version')
    string(name: 'SITE_URL', defaultValue: 'https://github.com/freifunk-suedpfalz/site-ffsuedpfalz', description: 'FF Site Git Repository')
    string(name: 'SITE_BRANCH', defaultValue: '1.4.14_b', description: 'FF Site Git Branch')
    string(name: 'CORES', defaultValue: '4', description: 'Cores for make process')
  }
  stages {
    stage('prepare build') {
      steps {
        rocketSend channel: 'firmware_builds', message: 'Build started'
        echo "Running ${env.BUILD_ID} on on ${env.JENKINS_URL}"
        checkout scm
        sh "sh -x build-jenkins.sh ${env.BRANCH_NAME} ${params.GLUON_VERSION} ${params.BUILD_TYPE}  ${params.VERSION} ${params.SITE_URL} ${params.SITE_BRANCH} ${params.CORES}"
      }
    }
    stage('build ar71xx-generic') {
      steps {
        dir("/tmp/${env.BRANCH_NAME}") {
          sh "make -j ${params.CORES} GLUON_DEPRECATED=full GLUON_TARGET=ar71xx-generic GLUON_AUTOUPDATER_BRANCH=${params.BUILD_TYPE} GLUON_AUTOUPDATER_ENABLED=1 GLUON_RELEASE=${VERSION}${BUILD_TYPE}"
        }
      }
    }
    stage("build ar71xx-nand") {
      steps {
        dir("/tmp/${env.BRANCH_NAME}") {
          sh "make -j ${params.CORES} GLUON_DEPRECATED=full GLUON_TARGET=ar71xx-nand GLUON_AUTOUPDATER_BRANCH=${params.BUILD_TYPE} GLUON_AUTOUPDATER_ENABLED=1 GLUON_RELEASE=${VERSION}${BUILD_TYPE}"
        }
      }
    }
    stage('build ar71xx-tiny') {
      steps {
        dir("/tmp/${env.BRANCH_NAME}") {
          sh "make -j ${params.CORES} GLUON_DEPRECATED=full GLUON_TARGET=ar71xx-tiny GLUON_AUTOUPDATER_BRANCH=${params.BUILD_TYPE} GLUON_AUTOUPDATER_ENABLED=1 GLUON_RELEASE=${VERSION}${BUILD_TYPE}"
        }
      }
    }
    stage('build ath79-generic') {
      steps {
        dir("/tmp/${env.BRANCH_NAME}") {
          sh "make -j ${params.CORES} GLUON_DEPRECATED=full GLUON_TARGET=ath79-generic GLUON_AUTOUPDATER_BRANCH=${params.BUILD_TYPE} GLUON_AUTOUPDATER_ENABLED=1 GLUON_RELEASE=${VERSION}${BUILD_TYPE}"
        }
      }
    }
    stage("build brcm2708-bcm2708") {
      steps {
        dir("/tmp/${env.BRANCH_NAME}") {
          sh "make -j ${params.CORES} GLUON_DEPRECATED=full GLUON_TARGET=brcm2708-bcm2708 GLUON_AUTOUPDATER_BRANCH=${params.BUILD_TYPE} GLUON_AUTOUPDATER_ENABLED=1 GLUON_RELEASE=${VERSION}${BUILD_TYPE}"
        }
      }
    }
    stage("build brcm2708-bcm2709") {
      steps {
        dir("/tmp/${env.BRANCH_NAME}") {
          sh "make -j ${params.CORES} GLUON_DEPRECATED=full GLUON_TARGET=brcm2708-bcm2709 GLUON_AUTOUPDATER_BRANCH=${params.BUILD_TYPE} GLUON_AUTOUPDATER_ENABLED=1 GLUON_RELEASE=${VERSION}${BUILD_TYPE}"
        }
      }
    }
    stage('build ipq40xx-generic') {
      steps {
        dir("/tmp/${env.BRANCH_NAME}") {
          sh "make -j ${params.CORES} GLUON_DEPRECATED=full GLUON_TARGET=ipq40xx-generic GLUON_AUTOUPDATER_BRANCH=${params.BUILD_TYPE} GLUON_AUTOUPDATER_ENABLED=1 GLUON_RELEASE=${VERSION}${BUILD_TYPE}"
        }
      }
    }
    stage('build ipq806x-generic') {
      steps {
        dir("/tmp/${env.BRANCH_NAME}") {
          sh "make -j ${params.CORES} GLUON_DEPRECATED=full GLUON_TARGET=ipq806x-generic GLUON_AUTOUPDATER_BRANCH=${params.BUILD_TYPE} GLUON_AUTOUPDATER_ENABLED=1 GLUON_RELEASE=${VERSION}${BUILD_TYPE}"
        }
      }
    }
    stage('build lantiq-xrx200') {
      steps {
        dir("/tmp/${env.BRANCH_NAME}") {
          sh "make -j ${params.CORES} GLUON_DEPRECATED=full GLUON_TARGET=lantiq-xrx200 GLUON_AUTOUPDATER_BRANCH=${params.BUILD_TYPE} GLUON_AUTOUPDATER_ENABLED=1 GLUON_RELEASE=${VERSION}${BUILD_TYPE}"
        }
      }
    }
    stage('build lantiq-xway') {
      steps {
        dir("/tmp/${env.BRANCH_NAME}") {
          sh "make -j ${params.CORES} GLUON_DEPRECATED=full GLUON_TARGET=lantiq-xway GLUON_AUTOUPDATER_BRANCH=${params.BUILD_TYPE} GLUON_AUTOUPDATER_ENABLED=1 GLUON_RELEASE=${VERSION}${BUILD_TYPE}"
        }
      }
    }
    stage('build mpc85xx-generic') {
      steps {
        dir("/tmp/${env.BRANCH_NAME}") {
          sh "make -j ${params.CORES} GLUON_DEPRECATED=full GLUON_TARGET=mpc85xx-generic GLUON_AUTOUPDATER_BRANCH=${params.BUILD_TYPE} GLUON_AUTOUPDATER_ENABLED=1 GLUON_RELEASE=${VERSION}${BUILD_TYPE}"
        }
      }
    }
    stage('build mpc85xx-p1020') {
      steps {
        dir("/tmp/${env.BRANCH_NAME}") {
          sh "make -j ${params.CORES} GLUON_DEPRECATED=full GLUON_TARGET=mpc85xx-p1020 GLUON_AUTOUPDATER_BRANCH=${params.BUILD_TYPE} GLUON_AUTOUPDATER_ENABLED=1 GLUON_RELEASE=${VERSION}${BUILD_TYPE}"
        }
      }
    }
    stage('build ramips-mt7620') {
      steps {
        dir("/tmp/${env.BRANCH_NAME}") {
          sh "make -j ${params.CORES} GLUON_DEPRECATED=full GLUON_TARGET=ramips-mt7620 GLUON_AUTOUPDATER_BRANCH=${params.BUILD_TYPE} GLUON_AUTOUPDATER_ENABLED=1 GLUON_RELEASE=${VERSION}${BUILD_TYPE}"
        }
      }
    }
    stage('build ramips-mt7621') {
      steps {
        dir("/tmp/${env.BRANCH_NAME}") {
          sh "make -j ${params.CORES} V=s GLUON_DEPRECATED=full GLUON_TARGET=ramips-mt7621 GLUON_AUTOUPDATER_BRANCH=${params.BUILD_TYPE} GLUON_AUTOUPDATER_ENABLED=1 GLUON_RELEASE=${VERSION}${BUILD_TYPE}"
        }
      }
    }
    stage('build ramips-mt76x8') {
      steps {
        dir("/tmp/${env.BRANCH_NAME}") {
          sh "make -j ${params.CORES} GLUON_DEPRECATED=full GLUON_TARGET=ramips-mt76x8 GLUON_AUTOUPDATER_BRANCH=${params.BUILD_TYPE} GLUON_AUTOUPDATER_ENABLED=1 GLUON_RELEASE=${VERSION}${BUILD_TYPE}"
        }
      }
    }
    stage('build ramips-rt305x') {
      steps {
        dir("/tmp/${env.BRANCH_NAME}") {
          sh "make -j ${params.CORES} GLUON_DEPRECATED=full GLUON_TARGET=ramips-rt305x GLUON_AUTOUPDATER_BRANCH=${params.BUILD_TYPE} GLUON_AUTOUPDATER_ENABLED=1 GLUON_RELEASE=${VERSION}${BUILD_TYPE}"
        }
      }
    }
    stage('build sunxi-cortexa7') {
      steps {
        dir("/tmp/${env.BRANCH_NAME}") {
          sh "make -j ${params.CORES} GLUON_DEPRECATED=full GLUON_TARGET=sunxi-cortexa7 GLUON_AUTOUPDATER_BRANCH=${params.BUILD_TYPE} GLUON_AUTOUPDATER_ENABLED=1 GLUON_RELEASE=${VERSION}${BUILD_TYPE}"
        }
      }
    }
    stage('build x86-64') {
      steps {
        dir("/tmp/${env.BRANCH_NAME}") {
          sh "make -j ${params.CORES} GLUON_DEPRECATED=full GLUON_TARGET=x86-64 GLUON_AUTOUPDATER_BRANCH=${params.BUILD_TYPE} GLUON_AUTOUPDATER_ENABLED=1 GLUON_RELEASE=${VERSION}${BUILD_TYPE}"
        }
      }
    }
    stage('build x86-legacy') {
      steps {
        dir("/tmp/${env.BRANCH_NAME}") {
            sh "make -j ${params.CORES} GLUON_DEPRECATED=full GLUON_TARGET=x86-legacy GLUON_AUTOUPDATER_BRANCH=${params.BUILD_TYPE} GLUON_AUTOUPDATER_ENABLED=1 GLUON_RELEASE=${VERSION}${BUILD_TYPE}"
        }
      }
    }
    stage('build x86-generic') {
      steps {
        dir("/tmp/${env.BRANCH_NAME}") {
          sh "make -j ${params.CORES} GLUON_DEPRECATED=full GLUON_TARGET=x86-generic GLUON_AUTOUPDATER_BRANCH=${params.BUILD_TYPE} GLUON_AUTOUPDATER_ENABLED=1 GLUON_RELEASE=${VERSION}${BUILD_TYPE}"
        }
      }
    }
    stage('build x86-geode') {
      steps {
        dir("/tmp/${env.BRANCH_NAME}") {
          sh "make -j ${params.CORES} GLUON_DEPRECATED=full GLUON_TARGET=x86-geode GLUON_AUTOUPDATER_BRANCH=${params.BUILD_TYPE} GLUON_AUTOUPDATER_ENABLED=1 GLUON_RELEASE=${VERSION}${BUILD_TYPE}"
        }
      }
    }
    stage('create manifest') {
      steps {
        dir("/tmp/${env.BRANCH_NAME}") {
          sh "make manifest GLUON_AUTOUPDATER_BRANCH=${BUILD_TYPE} GLUON_RELEASE=${VERSION}${BUILD_TYPE}"
        }
      }
    }
    stage('move images') {
      steps {
        sh "mkdir -p /mnt/images/${env.BRANCH_NAME}"
        sh "yes | cp -rf /tmp/${env.BRANCH_NAME}/output/images/ /mnt/images/${env.BRANCH_NAME}/"
        rocketSend channel: 'firmware_builds', message: 'Build finished'
      }
    }
    stage('clean directory') {
      steps {
        sh "rm -r /tmp/${env.BRANCH_NAME}"
      }
    }
  }
  post {
    failure {
      rocketSend channel: 'firmware_builds', message: 'Build error'
    }
  }
}
