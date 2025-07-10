#!/usr/bin/env bash
# vim:foldmethod=marker

#: Network {{{
paru -S --needed --nocomfirm systemd-resolvconf iwd
#: }}}

#: Bluetooth {{{
paru -S --needed --noconfirm bluez bluez-utils
#: }}}

#: Printer {{{
paru -S --needed --noconfirm epson-inkjet-printer-escpr
#: }}}

#: footswitch {{{
# paru -S --needed --noconfirm footswitch-git
#: }}}
