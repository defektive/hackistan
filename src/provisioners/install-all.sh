#! /bin/bash

if [ -z $SOURCE_DIR ]; then
  # determine script path
  pushd $(dirname `dirname $0`) > /dev/null
  SOURCE_DIR=`pwd`
  popd > /dev/null
fi
source $SOURCE_DIR/provisioners/etc/common.sh

_infoStart "Yeah. I am that lazy..."
packages=$(echo $(cat $SOURCE_DIR/provisioners/etc/defaults/*packages*.txt))
yay --needed -Sy $packages

_infoStatus "Congrats! its all done"
