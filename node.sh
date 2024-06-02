#!/usr/bin/env bash

if [ ! -f $HOME/n/bin/n ]; then
	echo "Install n ..."
	export NODE_MIRROR=https://mirrors.tuna.tsinghua.edu.cn/nodejs-release/
	export N_PREFIX="$HOME/n"
	[[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin" # Added by n-install (see http://git.io/n-install-repo).
	"${SHELL}" <(curl -L https://bit.ly/n-install)
fi
