#!/usr/bin/env bash
# vim:foldmethod=marker

#: Network {{{
paru -S --needed --nocomfirm systemd-resolvconf iwd
#: }}}

#: Bluetooth {{{
paru -S --needed --noconfirm bluez bluez-utils
#: }}}

#: Sound {{{
paru -S --needed --noconfirm wireplumber pipewire pipewire-alsa pipewire-pulse pipewire-jack libpulse pamixer
#: }}}

#: Printer {{{
paru -S --needed --noconfirm epson-inkjet-printer-escpr
#: }}}

#: footswitch {{{
# paru -S --needed --noconfirm footswitch-git
#: }}}
