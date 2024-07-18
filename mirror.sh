#!/usr/bin/env bash

#: Mirror {{{
echo "Setup mirrors"

sudo cp ./etc/pacman.conf /etc/pacman.conf
sudo cp ./etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist

# Key for archlinuxcn
sudo pacman -S --needed --noconfirm archlinuxcn-keyring
sudo pacman-key --lsign-key "farseerfc@archlinux.org"

# Key for arch4edu
sudo pacman-key --recv-keys 7931B6D628C8D3BA
sudo pacman-key --finger 7931B6D628C8D3BA
sudo pacman-key --lsign-key 7931B6D628C8D3BA

sudo pacman -Syuu --noconfirm
#: }}}
