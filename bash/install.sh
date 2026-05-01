#!/bin/bash

git clone --recursive https://github.com/akinomyoga/ble.sh.git ~/ble.sh

cd ~/ble.sh && make

# procura se o ble.sh ja esta no .bashrc, -q (nao mostra resultados na tela) -x (precisa ser exatamente igual) -F (nao transformar alguns caracteres em caracteres especiais, texto literal) , || (se nao achar), ele da o echo
if ! grep -qxF 'source ~/ble.sh/out/ble.sh' ~/.bashrc; then
    echo "# ====== modified by t3cl4do ======" >> ~/.bashrc
    echo "source ~/ble.sh/out/ble.sh" >> ~/.bashrc
    echo "ble-import contrib/syntax/edit.named-command.bash" >> ~/.bashrc
    echo "bleopt complete_auto_complete=1" >> ~/.bashrc
fi

if ! grep -qxF '# aliases t3cl4do' ~/.bashrc; then
    echo "alias f='fastfetch'" >> ~/.bashrc
    echo "alias q='exit'" >> ~/.bashrc
    echo "alias cl='clear'" >> ~/.bashrc
    echo "alias discord='flatpak run com.discordapp.Discord'" >> ~/.bashrc
fi

if ! grep -qxF '# export list t3cl4do' ~/.bashrc; then
    echo "export PATH='$HOME/.cargo/bin/$PATH'" >> ~/.bashrc
    echo "export PATH='$PATH:$HOME/go/bin'" >> ~/.bashrc
    echo "export PATH='$HOME/.local/bin:$PATH'"
fi

if ! grep -qxF '# prompt strings t3cl4do' ~/.bashrc; then
    echo "PROMPT_DIRTRIM=3" >> ~/.bashrc
    echo 'PS1="\[\e[0m\]\u\[\e[0m\] \[\e[1;31m\]||\[\e[0m\] \[\e[1;32m\]\w\[\e[0m\] \[\e[1;34m\]$\[\e[0m\] "' >> ~/.bashrc
fi
