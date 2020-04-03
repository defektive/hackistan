#! /bin/bash

echo X11Forwarding yes >> /etc/ssh/sshd_config
systemctl sshd restart

pacman-key --delete 91FFE0700E80619CEB73235CA88E23E377514E00
pacman-key --populate archlinux

pacman -Syu --noconfirm
