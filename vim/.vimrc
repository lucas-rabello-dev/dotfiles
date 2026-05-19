" configs
set nocompatible
filetype on
filetype plugin on
filetype indent on
syntax on
set autoindent
set number
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

" pluggins
call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim', {'branch':'release'}
let g:coc_global_extensions = ['coc-clangd', 'coc-go', 'coc-java', 'coc-rust-analyzer', 'coc-html', 'coc-css', 'coc-tsserver', 'coc-sh']

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
let g:SuperTabDefaultCompletionType = '<C-n>'
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

Plug 'jiangmiao/auto-pairs'

call plug#end()


" status bar
set noshowmode
set laststatus=2
function! NewStatus()
    let l:mode = mode()

    if l:mode ==# 'n'
        return 'NORMAL'
    elseif l:mode ==# 'i'
        return 'INSERT'
    elseif l:mode ==# 'v'
        return 'VISUAL'
    elseif l:mode ==# 'V'
        return 'V-LINE'
    elseif l:mode ==# 'R'
        return 'REPLACE'
    else
        return l:mode
    endif
endfunction

set statusline=
set statusline+=\ %{NewStatus()}
set statusline+=\ %F\ %m\ %y\ %r
set statusline+=%=
set statusline+=ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%
set laststatus=2

" themes
colorscheme industry

" keymaps
nmap q :q<CR>
nmap w :w<CR>
nmap <C-q> :q!<CR>
nnoremap <C-t> :terminal<CR>
nnoremap <C-b> :NERDTreeToggle<CR>

" config for coc.nvim to select a opition with enter
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
