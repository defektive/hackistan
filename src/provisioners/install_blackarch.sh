#! /bin/bash
if [ -z $SOURCE_DIR ]; then
  # determine script path
  pushd $(dirname `dirname $0`) > /dev/null
  SOURCE_DIR=`pwd`
  popd > /dev/null
fi
source $SOURCE_DIR/provisioners/etc/common.sh

## Install yay
_infoStart "Checking for BlackArch"

if [ ! -f /etc/pacman.d/blackarch-mirrorlist ]; then
  _infoStatus "BlackArch not found installing"
  # Run https://blackarch.org/strap.sh as root and follow the instructions.
  cd /tmp
  curl -sO https://blackarch.org/strap.sh

  SHASUM=$(curl -s https://blackarch.org/downloads.html | grep -P "SHA1 .+$" | awk '{print $7}')

  # The SHA1 sum should match: 9f770789df3b7803105e5fbc19212889674cd503 strap.sh
  sha1sum strap.sh | grep "$SHASUM" || exit

  chmod +x strap.sh
  sudo ./strap.sh
  rm strap.sh

  yay --noconfirm -Syu
else
  _infoStatus "BlackArch found. Nothing to do"

fi
