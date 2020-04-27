#! /bin/bash

if [ -z $SOURCE_DIR ]; then
  # determine script path
  pushd $(dirname `dirname $0`) > /dev/null
  SOURCE_DIR=`pwd`
  popd > /dev/null
fi
source $SOURCE_DIR/provisioners/etc/common.sh

_infoStart "Installing desktop packages"
packages=$(echo $(cat $SOURCE_DIR/provisioners/etc/defaults/desktop-packages*.txt))
sysman=$(dmidecode -s system-manufacturer)

if [ "$sysman" == "innotek GmbH" ]; then
  yay --noconfirm -R virtualbox-guest-utils-nox
  packages="$packages virtualbox-guest-utils"
fi


# May want to add the following
# xdo \
# xtitle \

## Install desktop
yay --needed --noconfirm -S $packages

## configure desktop
source $SOURCE_DIR/provisioners/install_desktop_configs.sh
_infoStatus "Desktop package install complete"
