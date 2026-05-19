# My vim config

### Dependencies:

`nodejs` 


### how to install

Clone the repo:

`git clone https://github.com/lucas-rabello-dev/vim-config.git && cd vim-config`

Install the pluggin manager (vim-plug) and copy my snippets files

`chmod +x ./install.sh && ./install.sh` 

Then enter on your vim and run: `:PlugInstall` to install all pluggins

`mkdir -p "$HOME/.vim/plugged/vim-snippets/UltiSnips/" && mv "./snippets-config/c.snippets" "./snippets-config/cpp.snippets" "$HOME/.vim/plugged/vim-snippets/UltiSnips/"`
