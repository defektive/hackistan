#! /bin/bash
if [ -z $SOURCE_DIR ]; then
  # determine script path
  pushd $(dirname `dirname $0`) > /dev/null
  SOURCE_DIR=`pwd`
  popd > /dev/null
fi
source $SOURCE_DIR/provisioners/etc/common.sh

## Install yay
_infoStart "Checking for yay"
if [ -z "$(which yay)" ]; then
  _infoStatus "yay not found. installing"
  cd /tmp
  git clone https://aur.archlinux.org/yay.git
  cd yay
  makepkg --noconfirm -si
  cd -
  rm -rf yay
else
  _infoStatus "yay found. skipping"
fi
