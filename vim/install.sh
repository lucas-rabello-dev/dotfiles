#!/usr/bin/env bash

#comando do curl pra instalar o vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

if [ -e "$HOME/.vimrc" ]; then
    mv "$HOME/.vimrc" "$HOME/.vimrc_old"
    mv "./.vimrc" "$HOME/.vimrc"
else
    cp "./.vimrc" "$HOME/"
fi
cp ./configs -r ~/.vim/
