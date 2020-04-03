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

******



### Bare metal

- create a user, with sudo permissions
- clone the repo

```
cd hackistan
provisioners/install.sh
```
