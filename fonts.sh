#!/usr/bin/env bash

sudo pacman -S --needed --noconfirm nodejs-material-design-icons noto-fonts noto-fonts-cjk noto-fonts-emoji adobe-source-han-sans-cn-fonts adobe-source-han-serif-cn-fonts ttf-jetbrains-mono-nerd ttf-firacode-nerd ttf-iosevka-term

if [ ! -d $HOME/.config/vcsh/repo.d/fonts.git ]; then
	vcsh clone git@github.com:kconf/fonts.git fonts
fi
