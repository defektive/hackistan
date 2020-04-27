#! /bin/bash

if [ -z $SOURCE_DIR ]; then
  # determine script path
  pushd $(dirname `dirname $0`) > /dev/null
  SOURCE_DIR=`pwd`
  popd > /dev/null
fi

source $SOURCE_DIR/provisioners/etc/common.sh

if [ `whoami` == "vagrant" ]; then
  _err 'This is not intended to be run in vagrant'
  exit 1
fi

pacman --needed -S sudo

if [ $UID -eq 0 ]; then
  _infoStart 'You are running as root'
  _infoStart 'Checking for existing user 1000'
  user=$(getent passwd 1000 | cut -d: -f1)

  if [ "$user" == "" ]; then
    _infoStart 'Creating operator user'
    user='operator'
    useradd -m -Gwheel $user
    _infoStatus 'Remember to set a password'
  fi

  echo '%wheel ALL=(ALL) ALL' > /etc/sudoers.d/wheel

  $SOURCE_DIR/provisioners/bootstrap.sh
  sudo -u $user $SOURCE_DIR/provisioners/install_default.sh
  sudo -u $user $SOURCE_DIR/provisioners/bootstrap_user.sh
  sudo -u $user $SOURCE_DIR/provisioners/install_blackarch.sh
  sudo -u $user $SOURCE_DIR/provisioners/install_aur.sh
  sudo -u $user $SOURCE_DIR/provisioners/install_desktop.sh
else
  _infoStart "Hello $(whoami), I hope you have sudo..."
  sudo $SOURCE_DIR/provisioners/bootstrap.sh
  $SOURCE_DIR/provisioners/install_default.sh
  $SOURCE_DIR/provisioners/bootstrap_user.sh
  $SOURCE_DIR/provisioners/install_blackarch.sh
  $SOURCE_DIR/provisioners/install_aur.sh
  $SOURCE_DIR/provisioners/install_desktop.sh
fi
