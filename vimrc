" Do not be compatible with vi
set nocompatible
set nocp

" Prevent character encoding issues
set encoding=utf-8

" Filetype support
filetype on
filetype plugin on
filetype indent on

" Do not keep any history
set viminfo='0,:0,<0,@0,f0
set nobackup
set nowb
set noswapfile

" Disable bells
set noerrorbells
set novisualbell
set t_vb=

" Turn on syntax highlighting
syntax on

" Terminal layout fixes
set t_Co=256

" Use full 24-bit colors
set termguicolors

" Set background type
set background=dark

" Set colorscheme
colorscheme habamax

" Don't lose unsaved changes when opening a new file - old buffer will be
" hidden instead of closed
set hidden

" Don't update the display while executing macros
set lazyredraw

" Indicates a fast terminal connection
set ttyfast

" Always show statusline
set laststatus=2

" Show cursor position
set ruler

" Highlight current line
set cursorline

" Smart tab handling
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Smart indentation
set autoindent
set smartindent

" Show absolute and relative line numbers
set number
set relativenumber

" Show matching ({[
set showmatch

" Edit match pairs for all bracket types
set matchpairs=(:),\[:\],{:},<:>

" Smart search
set ignorecase
set smartcase

" Highlight search results
set hlsearch

" Highlight search matches while typing
set incsearch

" Allow backspacing
set backspace=indent,eol,start

" Set up ripgrep if available
if executable('rg')
    set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
endif

" Visual autocomplete for command menu
set wildmenu wildoptions=pum

" Wrap lines
set wrap

" Show command in the last line of the screen
set showcmd

" Set whitespace character colors
" https://vim.fandom.com/wiki/Xterm256_color_names_for_console_Vim
highlight SpecialKey ctermfg=238 guifg=#444444
highlight NonText ctermfg=238 guifg=#444444

" Make non-printable characters visible
set list
set listchars=tab:▶—,space:·,trail:␣,nbsp:+,extends:>,precedes:<

" Highlight trailing whitespaces with red background
highlight TrailingWhiteSpace ctermbg=red guibg=red
autocmd BufWinEnter,WinEnter * call matchadd('TrailingWhiteSpace', '\s\+$')

" Treat colons as keywords
autocmd FileType cpp set iskeyword+=:

" Set compiler
compiler gcc

" Set the <leader> key to space
let mapleader = " "

" Place search result to the middle of the screen
nnoremap n nzz
nnoremap N Nzz

nnoremap j gj
nnoremap k gk

nnoremap <leader>l :set list!<CR>
