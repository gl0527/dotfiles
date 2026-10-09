" ==========================================
" 1. CORE & LEADER SETTINGS
" ==========================================
" Set the <leader> key to space (Must be defined first!)
let mapleader = " "

" Prevent character encoding issues
set encoding=utf-8

" Set the idle time trigger (2 seconds)
set updatetime=2000

" Automatically read a file if it was changed outside of Vim
set autoread

" Tell standard Vim to listen to tmux/xterm focus escape sequences
if !has('nvim') && has('terminal')
  let &t_fe = "\<Esc>[?1004h"
  let &t_fd = "\<Esc>[?1004l"
  execute "set <FocusGained>=\<Esc>[I"
  execute "set <FocusLost>=\<Esc>[O"
endif

" Trigger autoread when changing buffers or holding the cursor still
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * silent! checktime

" Filetype support (Combines detection, plugins, and indent)
filetype plugin indent on

" Turn on syntax highlighting
syntax on

" ==========================================
" 2. PERFORMANCE & HISTORY
" ==========================================
" Do not keep any history, backups, or swapfiles
set viminfo='0,:0,<0,@0,f0
set nobackup
set nowb
set noswapfile

" Don't lose unsaved changes when opening a new file
set hidden

" Don't update the display while executing macros
set lazyredraw

" Disable bells
set noerrorbells
set novisualbell
set t_vb=

" ==========================================
" 3. UI & COLORS
" ==========================================
set t_Co=256
set termguicolors
set background=dark
colorscheme catppuccin

set laststatus=2    " Always show statusline
set ruler           " Show cursor position
set cursorline      " Highlight current line
set colorcolumn=120
set wrap            " Wrap long lines

" Show absolute and relative line numbers together (Hybrid line numbers)
set number
set relativenumber

" Visual autocomplete for command menu
set wildmenu wildoptions=pum

" ==========================================
" 4. TEXT FORMATTING & INDENTATION
" ==========================================
" Smart tab handling (4 spaces)
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Smart indentation
set autoindent
set smartindent

" ==========================================
" 5. SEARCH & MATCHES
" ==========================================
set ignorecase
set smartcase
set hlsearch
set incsearch
set showmatch
set matchpairs=(:),\[:\],{:},<:>
set backspace=indent,eol,start

" Set up ripgrep if available
if executable('rg')
  set grepprg=rg\ --vimgrep\ --smart-case\ --hidden
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

" ==========================================
" 6. WHITESPACE & VISUALS
" ==========================================
" Make non-printable characters visible
set list
set listchars=tab:▶—,space:·,trail:␣,nbsp:+,extends:>,precedes:<

" Style whitespace characters
highlight SpecialKey ctermfg=238 guifg=#444444
highlight NonText ctermfg=238 guifg=#444444

" Highlight trailing whitespaces with red background
highlight TrailingWhiteSpace ctermbg=red guibg=red
autocmd BufWinEnter * call clearmatches() | call matchadd('TrailingWhiteSpace', '\s\+$')

" ==========================================
" 7. AUTOCOMMANDS & COMPILER
" ==========================================
" Treat colons as keywords ONLY in C++
autocmd FileType cpp setlocal iskeyword+=:

" Set compiler
compiler gcc

" Show command in the last line of the screen
set showcmd

" ==========================================
" 8. KEY MAPPINGS
" ==========================================
" Place search result to the middle of the screen
nnoremap n nzz
nnoremap N Nzz

" Move by visual lines rather than logical lines (great for wrapped lines)
nnoremap j gj
nnoremap k gk

" Toggle visible whitespace characters easily
nnoremap <leader>l :set list!<CR>

" Grep
nnoremap <leader>g :grep!  \| copen<C-Left><C-Left><Left>

" Grep word under cursor
nnoremap <leader>G :grep! <cword><CR>:copen<CR>
