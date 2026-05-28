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
