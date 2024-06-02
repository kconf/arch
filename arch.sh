#!/usr/bin/env bash

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

sudo pacman-key --lsign-key "farseerfc@archlinux.org"
sudo pacman -S --needed --noconfirm archlinuxcn-keyring

sudo pacman -Syuu --noconfirm
#: }}}

#: Basic setup {{{
sudo pacman -S --needed --noconfirm base base-devel linux linux-firmware sudo zsh wget archlinuxcn-keyring vcsh git openssh
#: }}}

#: Desktop wm {{{
sudo pacman -S --needed --noconfirm xdg-utils xorg-server xorg-xinit xorg-xrandr autorandr arandr i3 i3status-rust rofi kitty maim xclip thunar fcitx5-rime fcitx5-nord fcitx5-configtool
#: }}}

source ./i3.sh
source ./fonts.sh

#: Applications {{{
sudo pacman -S --needed --noconfirm keepassxc mpv npm obsidian pandoc pandoc-crossref rsync fuse sshfs mergerfs zeal zotero-bin
#: }}}

#: AUR {{{
sudo pacman -S --needed --noconfirm paru
paru -S --needed --noconfirm i3wsr dingtalk-bin wemeet-bin wps-office ttf-wps-fonts microsoft-edge-stable-bin visual-studio-code-bin fcitx5-input-support epson-inkjet-printer-escpr2
#: }}}

source ./nix.sh
source ./python.sh
source ./direnv.sh
source ./node.sh
source ./rust.sh
