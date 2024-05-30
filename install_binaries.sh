#!/usr/bin/env bash

export bin_path=$HOME/.local/bin

if [ ! -f $bin_path/micromamba ]; then
  "${SHELL}" <(curl -L micro.mamba.pm/install.sh)
fi

if [ ! -f $bin_path/direnv ]; then
  "${SHELL}" <(curl -L https://direnv.net/install.sh )
fi

if [ ! -f $HOME/n/bin/n ]; then
  export NODE_MIRROR=https://mirrors.tuna.tsinghua.edu.cn/nodejs-release/
  export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).
  "${SHELL}" <(curl -L https://bit.ly/n-install)
fi

if [ ! -d $HOME/.cargo ]; then
  export RUSTUP_UPDATE_ROOT=https://mirrors.tuna.tsinghua.edu.cn/rustup/rustup
  export RUSTUP_DIST_SERVER=https://mirrors.tuna.tsinghua.edu.cn/rustup
  "${SHELL}" <(curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs)
fi
