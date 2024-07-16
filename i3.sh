#!/usr/bin/env bash

sudo pacman -S --needed --noconfirm xdg-utils xorg-server xorg-xinit xorg-xrandr autorandr arandr i3 i3status-rust rofi wezterm maim xclip thunar fcitx5-rime fcitx5-nord fcitx5-configtool

if [ ! -d $HOME/.config/vcsh/repo.d/i3.git ]; then
  vcsh clone git@github.com:kconf/i3.git i3
fi

if [ ! -d $HOME/.config/vcsh/repo.d/rime.git ]; then
  vcsh clone git@github.com:kconf/rime.git rime
fi
