"""" Enable Vundle: vim plugin manager

" required before Vundle initialization
set nocompatible        " disable compatibility mode with vi
" filetype off            " disable filetype detection (but re-enable later, see below)

" set the runtime path to include Vundle, and initialize
" set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#begin()
" Plugin 'VundleVim/Vundle.vim'
" Plugin 'wting/rust.vim' " enable syntax highlighting for rust
" call vundle#end()


"""" Basic Behavior

set number              " show line numbers
set wrap                " wrap lines
set encoding=utf-8      " set encoding to UTF-8 (default was "latin1")
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw screen only when we need to
set laststatus=2        " always show statusline (even with only single window)
set ruler               " show line and column number of the cursor on right side of statusline
set visualbell          " blink cursor on error, instead of beeping


"""" Key Bindings

" move vertically by visual line (don't skip wrapped lines)
nmap j gj
nmap k gk


"""" Vim Appearance

" put colorscheme files in ~/.vim/colors/ or in ~/.config/nvim/colors/
try
    colorscheme molokai " good colorschemes: murphy, slate, molokai, badwolf, solarized
catch
endtry

" use filetype-based syntax highlighting, ftplugins, and indentation
syntax enable
filetype plugin indent on


"""" Tab settings

set tabstop=4           " width that a <TAB> character displays as
set expandtab           " convert <TAB> key-presses to spaces
set shiftwidth=4        " number of spaces to use for each step of (auto)indent
set softtabstop=4       " backspace after pressing <TAB> will remove up to this many spaces

set autoindent          " copy indent from current line when starting a new line
set smartindent         " even better autoindent (e.g. add indent after '{')


"""" Search settings

set ignorecase          " ignore case when searching
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set smartcase           " try to be smart about cases

" turn off search highlighting with <CR> (carriage-return)
nnoremap <CR> :nohlsearch<CR><CR>


""" Browsing filesystem with netrw

let g:netrw_banner = 0          " remove directory banner
let g:netrw_liststyle = 3       " tree view
let g:netrw_browse_split = 4    " open file in previous window
let g:netrw_altv = 1            " open file in vertical split
let g:netrw_winsize = 25        " width of directory browser = 25% of the page
augroup ProjectDrawer           " present file browser on startup
  autocmd!
  autocmd VimEnter * :Vexplore
augroup END


""" C++

" Save, compile and run
autocmd filetype cpp nnoremap <F9>
    \ :w <CR>
    \ :!g++ -g % -o %:r -std=c++2a -O2 -pedantic -W -Wall -Wextra -Wcast-align
    \ -Wcast-qual -Wctor-dtor-privacy -Wdisabled-optimization -Wformat=2
    \ -Winit-self -Wuninitialized -Wmissing-include-dirs -fsanitize=address -fsanitize=undefined
    \ -Woverloaded-virtual -Wshadow -Wno-sign-conversion -Wsign-promo
    \ && ./%:r <CR>

" Save and generate preprocessor output
autocmd filetype cpp nnoremap <F2>
    \ :w <CR>
    \ :!g++ -E % -o %:r.i <CR>
    \ :vsp %:r.i <CR>

" Save and generate assembly output without optimization
autocmd filetype cpp nnoremap <F3>
    \ :w <CR>
    \ :!g++ -S % -std=c++2a -O0 -o %:r.s <CR>
    \ :vsp %:r.s <CR>

" Save and generate assembly output with 2nd level optimization
autocmd filetype cpp nnoremap <F4>
    \ :w <CR>
    \ :!g++ -S % -std=c++2a -O2 -o %:r_opt.s <CR>
    \ :vsp %:r_opt.s <CR>
