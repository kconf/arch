#!/usr/bin/env bash

if [ ! -d $HOME/.cargo ]; then
	echo "Install cargo ..."
	export RUSTUP_UPDATE_ROOT=https://mirrors.tuna.tsinghua.edu.cn/rustup/rustup
	export RUSTUP_DIST_SERVER=https://mirrors.tuna.tsinghua.edu.cn/rustup
	"${SHELL}" <(curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs)
fi

if [ ! -d $HOME/.config/vcsh/repo.d/rust.git ]; then
	vcsh clone git@github.com:kconf/rust.git rust
fi
