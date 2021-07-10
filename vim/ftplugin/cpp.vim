" Perform incremental build, and open build output
nnoremap <F12> :silent make\|redraw!\|cw<CR><CR>

" Perform clean build, and open build output
nnoremap <S-F12> :make clean\|silent make\|redraw!\|cw<CR><CR>

" Comment line
noremap ,c :s/^/\/\/ /<CR>:nohlsearch<CR>

" Uncomment line
noremap ,u :s/^\/\/ //<CR>

" Debug
noremap <F5>
    \ :Termdebug<CR><C-w>l
    \ :vertical resize +35<CR><C-w>h

" Set breakpoints
nnoremap <F9> :Break<CR>
nnoremap <S-F9> :Clear<CR>
