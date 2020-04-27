#! /bin/bash

grep "en_US.UTF-8 UTF-8" /etc/locale.gen \
  | grep -v "#" \
  | grep "en_US.UTF-8 UTF-8" || echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen

locale-gen

pacman-key --delete 91FFE0700E80619CEB73235CA88E23E377514E00
pacman-key --populate archlinux

pacman -Syu --noconfirm
