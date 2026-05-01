#!/bin/bash

echo "removing ble.sh directory..."
rm -rf ~/ble.sh

echo "backup ~/.bashrc.bak"
cp ~/.bashrc ~/.bashrc.bak

echo "removing config from .bashrc..."

# sed (procuram linhas que contenham 'texto') -i (edita direto no arquivo) 'd' (que ta no final, eh de delete)
# \/ -> teclas de escape do 'sed'
sed -i '/# ====== modified by t3cl4do ======/d' ~/.bashrc
sed -i '/source ~\/ble.sh\/out\/ble.sh/d' ~/.bashrc
sed -i '/ble-import contrib\/syntax\/edit.named-command.bash/d' ~/.bashrc
sed -i '/bleopt complete_auto_complete=1/d' ~/.bashrc

sed -i '/# prompt strings t3cl4do/d' ~/.bashrc
sed -i '/PROMPT_DIRTRIM=3/d' ~/.bashrc
sed -i 'PS1="\[\e[0m\]\u\[\e[0m\] \[\e[1;31m\]||\[\e[0m\] \[\e[1;32m\]\w\[\e[0m\] \[\e[1;34m\]$\[\e[0m\] "' ~/.bashrc

echo "done."

