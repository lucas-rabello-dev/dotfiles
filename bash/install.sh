#!/bin/bash

if [ -e "$HOME/.bashrc" ]; then
	# rename the file
	mv "$HOME/.bashrc" "$HOME/.bashrc_old"
fi

# copy the file to $HOME
cp "./.bashrc" "$HOME/"
