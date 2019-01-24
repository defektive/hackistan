#! /bin/bash

# May want to add the following
# xdo \
# xtitle \

## Install desktop
yay --noconfirm -S \
  xorg-server \
  xorg-xinit \
  dmenu \
  sxhkd \
  xf86-video-fbdev \
  xf86-video-vesa \
  ttf-dejavu bspwm \
  compton \
  feh \
  bc \
  xorg-xev \
  xorg-xrandr \
  polybar \
  ttf-font-icons
echo exec bspwm > ~/.xinitrc
