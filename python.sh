#!/usr/bin/env bash

if [ ! -f $HOME/.local/bin/micromamba ]; then
	echo "Install micromamba ..."
	"${SHELL}" <(curl -L micro.mamba.pm/install.sh)
	mkdir -p $HOME/micromamba
fi

if [ ! -d $HOME/.config/vcsh/repo.d/python.git ]; then
	vcsh clone git@github.com:kconf/python.git python
fi
