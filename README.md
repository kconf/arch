# Arch Linux

- Add `archlinuxcn` repository

See [pacman.conf](./etc/pacman.conf) for details.

```sh
pacman-key --lsign-key "farseerfc@archlinux.org"
pacman -Sy archlinuxcn-keyring
```

- Show installed packages

```sh
comm -23 <(pacman -Qqett | sort) <(pacman -Qqg base-devel | sort | uniq)
```

- Install packages from a file containing all packages

```sh
sudo pacman -S --needed $(sed -e 's/\s*#.*$//' packages.txt)
paru -S $(sed -e 's/\s*#.*$//' aur.txt)
```
