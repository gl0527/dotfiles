" Save, compile and run
nnoremap <F9>
    \ :w <CR>
    \ :!g++ -g % -o %:r -std=c++2a -O2 -pedantic -W -Wall -Wextra -Wcast-align
    \ -Wcast-qual -Wctor-dtor-privacy -Wdisabled-optimization -Wformat=2
    \ -Winit-self -Wuninitialized -Wmissing-include-dirs -fsanitize=address -fsanitize=undefined
    \ -Woverloaded-virtual -Wshadow -Wno-sign-conversion -Wsign-promo
    \ && ./%:r <CR>

" Save and generate preprocessor output
nnoremap <F2>
    \ :w <CR>
    \ :!g++ -E % -o %:r.i <CR>
    \ :vsp %:r.i <CR>

" Save and generate assembly output without optimization
nnoremap <F3>
    \ :w <CR>
    \ :!g++ -S % -std=c++2a -O0 -o %:r.s <CR>
    \ :vsp %:r.s <CR>

" Save and generate assembly output with 2nd level optimization
nnoremap <F4>
    \ :w <CR>
    \ :!g++ -S % -std=c++2a -O2 -o %:r_opt.s <CR>
    \ :vsp %:r_opt.s <CR>

" Perform incremental build, and open build output
nnoremap <F12>
    \ :make<CR><CR>
    \ :cwindow<CR><CR>

" Perform clean build, and open build output
nnoremap <S-F12>
    \ :make clean<CR>
    \ :make<CR><CR>
    \ :cwindow<CR><CR>

" Comment line
noremap ,c :s/^/\/\/ /<CR>:nohlsearch<CR>

" Uncomment line
noremap ,u :s/^\/\/ //<CR>
