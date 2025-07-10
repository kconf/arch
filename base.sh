#!/usr/bin/env bash
# vim:foldmethod=marker

#: Mirror {{{
echo "Setup pacman mirrors"

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

#: Base setup {{{
sudo pacman -S --needed --noconfirm base base-devel linux linux-firmware sudo zsh wget git openssh paru
#: }}}

