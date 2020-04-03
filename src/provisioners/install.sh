#! /bin/bash

if [ `whoami` == "vagrant" ]; then
  echo '[!] This is not intended to be run in vagrant'
  # exit 1
fi

if [ -z $SOURCE_DIR ]; then
  # determine script path
  pushd $(dirname `dirname $0`) > /dev/null
  SOURCE_DIR=`pwd`
  popd > /dev/null
fi

source $SOURCE_DIR/provisioners/etc/common.sh

sudo $SOURCE_DIR/provisioners/bootstrap.sh
$SOURCE_DIR/provisioners/bootstrap_user.sh
$SOURCE_DIR/provisioners/install_default.sh
$SOURCE_DIR/provisioners/install_blackarch.sh
$SOURCE_DIR/provisioners/install_aur.sh
$SOURCE_DIR/provisioners/install_desktop.sh
