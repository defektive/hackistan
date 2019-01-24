#! /bin/bash

SOURCE_DIR='/vagrant'

function link_config() {
  if [ ! -e $SOURCE_DIR/home/.config/$1 ]; then
    echo "[!] $1 doesn't exist in $SOURCE_DIR/home/.config"
    exit 1
  fi

  if [ ! -e $HOME/.config/$1 ]; then
    cd $HOME/.config
    ln -s $SOURCE_DIR/home/.config/$1 .
    cd -
  fi
}

function link_file() {
  if [ ! -e $SOURCE_DIR/home/$1 ]; then
    echo "[!] $1 doesn't exist in $SOURCE_DIR/home/"
    exit 1
  fi

  if [ ! -e $HOME/$1 ]; then
    cd $HOME/
    ln -s $SOURCE_DIR/home/$1 .
    cd -
  fi
}

cd $HOME
mkdir -p .config

link_file .zshrc
link_config bspwm
link_config gtk-3.0
link_config personal
link_config polybar
link_config sxhkd
link_config termite
link_config wallpaper
link_config yay

if [ ! -d $HOME/.config/oh-my-zsh ]; then
  cd $HOME/.config/
  git clone https://github.com/robbyrussell/oh-my-zsh.git
  cd -
fi

sudo chsh -s /usr/bin/zsh `whoami`
