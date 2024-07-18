#!/usr/bin/env bash
# vim:foldmethod=marker

set -e

usage() {
  echo "Usage: $0 [-p <proxy>]" 1>&2
  exit 1
}

#: Proxy {{{
while getopts ":p:" opts; do
  case "${opts}" in
  p)
    proxy=${OPTARG}
    echo "Using proxy $proxy"
    export http_proxy=http://$proxy:7890
    export https_proxy=http://$proxy:7890
    ;;
  *)
    usage
    ;;
  esac
done
#: }}}

#: Mirror {{{
echo "Setup mirrors"

sudo cp ./etc/pacman.conf /etc/pacman.conf
sudo cp ./etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist

# Key for archlinuxcn
sudo pacman-key --lsign-key "farseerfc@archlinux.org"
sudo pacman -S --needed --noconfirm archlinuxcn-keyring

# Key for arch4edu
sudo pacman-key --recv-keys 7931B6D628C8D3BA
sudo pacman-key --finger 7931B6D628C8D3BA
sudo pacman-key --lsign-key 7931B6D628C8D3BA

sudo pacman -Syuu --noconfirm
#: }}}

#: Basic setup {{{
sudo pacman -S --needed --noconfirm base base-devel linux linux-firmware sudo zsh wget vcsh git openssh paru
#: }}}

#: Hardware {{{
sudo pacman -S --needed --noconfirm bluez bluez-utils
paru -S --needed --noconfirm epson-inkjet-printer-escpr footswitch-git
#: }}}

#: Network {{{
sudo pacman -S --needed --nocomfirm kdeconnect wireguard-tools systemd-resolvconf
paru -S --needed --noconfirm easyconnect
#: }}}

#: Applications {{{
sudo pacman -S --needed --noconfirm keepassxc mpv npm obsidian quarto-cli-bin rsync fuse sshfs mergerfs zeal zotero-bin clash-verge okular imagemagick microsoft-edge-stable-bin visual-studio-code-bin wemeet-bin
paru -S --needed --noconfirm dingtalk-bin wps-office wechat-universal-bwrap
#: }}}

#: Flatpak {{{
sudo pacman -S --needed --noconfirm flatpak
#: }}}
