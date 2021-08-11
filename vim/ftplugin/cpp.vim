" Perform incremental build, and open build output
nnoremap <F12> :silent make\|redraw!\|cw<CR><CR>

" Perform clean build, and open build output
" F24 is S-F12 for neovim
nnoremap <F24> :make clean\|silent make\|redraw!\|cw<CR><CR>

" Comment line
noremap ,c :s/^/\/\/ /<CR>:nohlsearch<CR>

" Uncomment line
noremap ,u :s/^\/\/ //<CR>

" Debug
nnoremap <F5>
    \ :Termdebug<CR><C-w>l
    \ :vertical resize +35<CR><C-w>h

" Set breakpoints
nnoremap <F9> :Break<CR>
" F21 is S-F9 for neovim
nnoremap <F21> :Clear<CR>
