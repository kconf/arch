#!/usr/bin/env zsh

if [ ! -f $HOME/.local/bin/pipx ]; then
  python3 -m pip install --user pipx
  python3 -m pipx ensurepath
fi

pipx install ansible-core
