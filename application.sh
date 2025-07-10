#!/usr/bin/env bash
# vim:foldmethod=marker

#: System {{{
paru -S --needed --noconfirm rsync fuse sshfs mergerfs easyconnect
#: }}}

#: Office {{{
paru -S --needed --noconfirm keepassxc obsidian wps-office dingtalk-bin wechat-bin wemeet-bin zotero-bin microsoft-edge-stable-bin okular quarto-cli-bin
#: }}}

#: Media {{{
paru -S --needed --noconfirm mpv imagemagick xnviewmp
#: }}}

#: Develop {{{
paru -S --needed --noconfirm visual-studio-code-bin zeal
#: }}}
