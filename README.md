# Hackistan
**Arch linux, bspwm, yay, BlackArch Repos**

This uses vagrant, but everything should work on a clean install of Arch

![Screenshot](screenshot.png)

******

## Getting Started

### Vagrant

#### Single Machine

```
vagrant up
vagrant ssh
```

#### Multi Machine

```
cp example.boxes.yaml boxes.yaml
vim boxes.yaml # customize if you want
vagrant up op1

vagrant up op2

# done with op2
vagrant destroy op2

```

sometimes its nice not to have to be in the vagrant folder. you can add a VM's ssh config to your config.
```
vagrant ssh-config >> ~/.ssh/config
```

Then you should be able to run the following from anywhere.
```
ssh op1
```

******



### Bare metal

- create a user, with sudo permissions
- clone the repo

```
cd hackistan
provisioners/install.sh
```

*******

### LXC

This assumes you are already running arch linux as your base OS

#### Initial lxc
```
sudo lxc-create -n hackistan -t download -- --dist archlinux --release current --arch amd64
```

##### Config

Add to the end of `/var/lib/lxc/hackistan/config`.

```
# hackistan config
lxc.mount.entry = /var/cache/pacman/pkg var/cache/pacman/pkg none bind 0 0
lxc.mount.entry = /dev/dri dev/dri none bind,optional,create=dir
lxc.mount.entry = /dev/snd dev/snd none bind,optional,create=dir
lxc.mount.entry = /tmp/.X11-unix tmp/.X11-unix none bind,optional,create=dir,ro
lxc.mount.entry = /dev/video0 dev/video0 none bind,optional,create=file
lxc.mount.entry = {{REPLACE WITH PATH TO TO CODE}}/hackistan/src home/operator/.config/hackistan none bind,create=dir 0 0
```

##### Initial Container Setup

```
lxc-start -n hackistan
sudo lxc-attach -n hackistan
cd /home/operator/.config/hackistan
src/provisioners/install.sh
lxc-stop -n hackistan
```

#### Use

##### New Op Container

```
sudo lxc-copy -n hackistan -N opname -B overlayfs -s
```

##### Delete Op Container

```
sudo lxc-destroy -n opname -f
```

##### List All Container Info

```
sudo lxc-ls | xargs -n 1 sudo lxc-info
```
