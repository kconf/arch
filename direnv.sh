#!/usr/bin/env bash

if [ ! -f $HOME/.local/bin/direnv ]; then
	echo "Install direnv ..."
	"${SHELL}" <(curl -L https://direnv.net/install.sh)
fi
