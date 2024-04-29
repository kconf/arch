#!/usr/bin/env zsh

export bin_path=$HOME/.local/bin

if [ ! -f $bin_path/micromamba ]; then
  "${SHELL}" <(curl -L micro.mamba.pm/install.sh)
fi

if [ ! -f $bin_path/direnv ]; then
  "${SHELL}" <(curl -L https://direnv.net/install.sh )
fi
