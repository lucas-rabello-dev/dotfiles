nnoremap <C-b> :NERDTreeToggle<CR>
" open the file in other tab (left position)
nnoremap <C-m> :leftabove vsplit<CR>
" to open new tabs in different positions
" press Ctrl+n and (h, j, k, l)
nnoremap <C-n>h :abo vnew<CR>
nnoremap <C-n>j :bel new<CR>
nnoremap <C-n>k :abo new<CR>
nnoremap <C-n>l :bel vnew<CR>

nnoremap <C-t>h :abo vertical term <CR>
nnoremap <C-t>j :bel term <CR>
nnoremap <C-t>k :abo term <CR>
nnoremap <C-t>l :bel vertical term <CR>
