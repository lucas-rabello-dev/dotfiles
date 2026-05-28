" configs
set nocompatible
filetype on
filetype plugin on
filetype indent on
syntax on
set autoindent
" set number
set relativenumber
set title
set encoding=utf-8
set shiftwidth=4
set tabstop=4
set nobackup
set incsearch
set showmatch
set smartcase
set hlsearch
set showcmd
set mouse=a
set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

colorscheme industry

" load config files
source ~/.vim/configs/plugins.vim
source ~/.vim/configs/lsp.vim
source ~/.vim/configs/statusbar.vim
source ~/.vim/configs/keymaps.vim
