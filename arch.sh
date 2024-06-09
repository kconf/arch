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

sudo pacman-key --lsign-key "farseerfc@archlinux.org"
sudo pacman -S --needed --noconfirm archlinuxcn-keyring

sudo pacman-key --recv-keys 7931B6D628C8D3BA
sudo pacman-key --finger 7931B6D628C8D3BA
sudo pacman-key --lsign-key 7931B6D628C8D3BA

sudo pacman -Syuu --noconfirm
#: }}}

#: Basic setup {{{
sudo pacman -S --needed --noconfirm base base-devel linux linux-firmware sudo zsh wget archlinuxcn-keyring vcsh git openssh paru
#: }}}

#: Hardware {{{
sudo pacman -S --needed --noconfirm bluez bluez-utils
paru -S --needed --noconfirm epson-inkjet-printer-escpr2
#: }}}

#: Desktop wm {{{
sudo pacman -S --needed --noconfirm xdg-utils xorg-server xorg-xinit xorg-xrandr autorandr arandr i3 i3status-rust rofi kitty wezterm maim xclip thunar fcitx5-rime fcitx5-nord fcitx5-configtool
#: }}}

source ./i3.sh
source ./fonts.sh

#: Applications {{{
sudo pacman -S --needed --noconfirm keepassxc mpv npm obsidian quarto-cli-bin rsync fuse sshfs mergerfs zeal zotero-bin clash-verge okular imagemagick microsoft-edge-stable-bin visual-studio-code-bin
#: }}}

#: AUR {{{
paru -S --needed --noconfirm i3wsr dingtalk-bin wemeet-bin wps-office ttf-wps-fonts fcitx5-input-support
#: }}}

#: Flatpak {{{
sudo pacman -S --needed --noconfirm flatpak
#: }}}

source ./nix.sh
source ./python.sh
source ./direnv.sh
source ./node.sh
source ./rust.sh
