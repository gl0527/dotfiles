" ==========================================
" CORE & LEADER SETTINGS
" ==========================================
" Set the <leader> key to space (Must be defined first!)
let mapleader = " "

" Prevent character encoding issues
set encoding=utf-8

" Disable modelines to prevent arbitrary code execution from untrusted files
set nomodeline

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

" Filetype support (Combines detection, plugins, and indent)
filetype plugin indent on

" Turn on syntax highlighting
syntax on

" ==========================================
" PERFORMANCE, RECOVERY & HISTORY
" ==========================================
" Do not keep any history, backups, or swapfiles
set viminfo='0,:0,<0,@0,f0
set nobackup
set nowb
set noswapfile

" Enable safe persistent undo instead of messy swapfiles
if has('undofile')
  " Create the directory if it doesn't exist (~/.vim/undo)
  call mkdir(expand('~/.vim/undo'), 'p', 0700)
  set undodir=~/.vim/undo
  set undofile
endif

" Don't lose unsaved changes when opening a new file
set hidden

" Don't update the display while executing macros
set lazyredraw

" Assume a fast terminal connection
set ttyfast

" Turn off syntax hightlighting for lines longer than 500 characters
set synmaxcol=500

" Disable bells
set noerrorbells
set novisualbell
set t_vb=

" ==========================================
" UI & COLORS
" ==========================================
set t_Co=256
if has('termguicolors')
  set termguicolors
endif
set background=dark

" Safely load catppuccin (prevents crash if colorscheme is missing)
silent! colorscheme catppuccin

" Always show statusline & command bar space
set laststatus=2
set showcmd

" Show cursor position
set ruler

" Highlight current line
set cursorline

" Mark line length limit
set colorcolumn=120

" Wrap long lines
set wrap

" Show absolute and relative line numbers together (Hybrid line numbers)
set number
set relativenumber

" Visual autocomplete for command menu
set wildmenu
set wildoptions=pum

" Make splitting behavior feel natural
set splitright
set splitbelow

" ==========================================
" TEXT FORMATTING & INDENTATION
" ==========================================
" Smart tab handling (4 spaces)
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent

" ==========================================
" SEARCH & MATCHES
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
" WHITESPACE & VISUALS
" ==========================================
" Make non-printable characters visible
set list
set listchars=tab:▶—,space:·,trail:␣,nbsp:+,extends:>,precedes:<

" Style whitespace characters
highlight SpecialKey ctermfg=238 guifg=#444444
highlight NonText ctermfg=238 guifg=#444444

" Highlight trailing whitespaces with red background
highlight TrailingWhiteSpace ctermbg=red guibg=red

" Match trailing whitespaces
match TrailingWhiteSpace /\s\+$/

" ==========================================
" AUTOCOMMANDS (Wrapped safely in groups)
" ==========================================
augroup MyVimrcAutocommands
  autocmd!

  " Trigger autoread when changing buffers or holding the cursor still
  autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * nested silent! checktime

  " Treat colons as keywords ONLY in C++
  autocmd FileType cpp setlocal iskeyword+=:

  " Set build environment for C/C++
  autocmd FileType c,cpp compiler gcc
augroup END

" ==========================================
" KEY MAPPINGS
" ==========================================
" Keep search results centered on the screen
nnoremap n nzzzv
nnoremap N Nzzzv

" Move by visual lines rather than logical lines (great for wrapped lines)
nnoremap j gj
nnoremap k gk

" Clear search highlights
nnoremap <silent> <leader>h :noh<CR>

" Toggle visible whitespace characters easily
nnoremap <leader>l :set list!<CR>

" Grep shortcuts with quickfix window focus fixes
nnoremap <leader>g :grep! -F '' \| botright copen 5<C-Left><C-Left><C-Left><C-Left><C-Left><Right>
nnoremap <leader>G :grep! -F <cword><CR>:botright copen 5<CR>

" Quickfix navigation
nnoremap ]q :cnext<CR>
nnoremap [q :cprev<CR>
nnoremap ]Q :clast<CR>
nnoremap [Q :cfirst<CR>
nnoremap ]f :cnfile<CR>
nnoremap [f :cNfile<CR>

" Toggle the quickfix window open/closed entirely using leader+q
nnoremap <expr> <leader>q empty(filter(getwininfo(), 'v:val.quickfix')) ? ':copen 5<CR>' : ':cclose<CR>'
