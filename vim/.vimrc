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

Plug 'jiangmiao/auto-pairs'

Plug 'prabirshrestha/vim-lsp'

Plug 'prabirshrestha/asyncomplete.vim'

Plug 'prabirshrestha/asyncomplete-lsp.vim'

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
" nmap q :q<CR>
" nmap w :w<CR>
" nmap <C-q> :q!<CR>
nnoremap <C-t> :terminal<CR>
nnoremap <C-b> :NERDTreeToggle<CR>
nnoremap <C-n> :new<CR>

" lsp config

if executable('clangd')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'clangd',
        \ 'cmd': {server_info->['clangd']},
        \ 'allowlist': ['c'],
        \ })
endif

if executable('gopls')
	au User lsp_setup call lsp#register_server({
		\ 'name': 'gopls',
		\ 'cmd': {server_info->['gopls']},
		\ 'allowlist': ['go']
		\ })
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000

endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" config colors (vim-lsp)

highlight LspErrorText guifg=#ff5f5f ctermfg=203
highlight LspWarningText guifg=#ffaa00 ctermfg=214
highlight LspInformationText guifg=#5fd7ff ctermfg=81
highlight LspHintText guifg=#87af87 ctermfg=108

" auto complete configs

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

let g:asyncomplete_auto_popup = 1

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction
