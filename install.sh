#!/usr/bin/env zsh

sudo pacman -S --needed $(sed -e 's/\s*#.*$//' packages.txt)
paru -S $(sed -e 's/\s*#.*$//' aur.txt)
