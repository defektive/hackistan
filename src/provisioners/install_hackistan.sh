#! /bin/bash

if [ -z $SOURCE_DIR ]; then
  # determine script path
  pushd $(dirname `dirname $0`) > /dev/null
  SOURCE_DIR=`pwd`
  popd > /dev/null
fi

source $SOURCE_DIR/provisioners/etc/common.sh

_infoStart "Installing hackistan packages"
packages=$(echo $(cat $SOURCE_DIR/provisioners/etc/defaults/hackistan-packages*.txt))
yay --needed --noconfirm -S $packages

_infoStatus "hackistan package install complete"
