# Hackistan
**Arch linux, bspwm, yay, BlackArch Repos**

This uses vagrant, but everything should work on a clean install of Arch

![Screenshot](screenshot.png)

---

## Getting Started

### Vagrant
**sadly I couldn't get certain key combinations to work (super + {Left, Right, Up, Down}) so that has been mapped to alt**

```
vagrant up
```

### Bare metal

- create a user, with sudo permissions
- clone the repo

```
cd hackistan
provisioners/install.sh
```
