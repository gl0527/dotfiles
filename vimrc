" Core & leader settings
let mapleader = " "                          " Set the <leader> key to space (must be defined first!)
set encoding=utf-8                           " Prevent character encoding issues
set updatetime=2000                          " Set the idle time trigger (2 seconds)
set autoread                                 " Automatically read a file if it was changed outside of Vim

" Tell standard Vim to listen to tmux/xterm focus escape sequences
if !has('nvim') && has('terminal')
  let &t_fe = "\<Esc>[?1004h"                " Enable focus-gained escape sequence
  let &t_fd = "\<Esc>[?1004l"                " Enable focus-lost escape sequence
  execute "set <FocusGained>=\<Esc>[I"       " Set focus gained sequence
  execute "set <FocusLost>=\<Esc>[O"         " Set focus lost sequence
endif

" Trigger autoread when changing buffers or holding the cursor still
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * silent! checktime

" Filetype support (combines detection, plugins, and indent)
filetype plugin indent on                   " Enable filetype support

" Turn on syntax highlighting
syntax on                                   " Enable syntax highlighting

" Performance & history
set viminfo='0,:0,<0,@0,f0                 " Do not keep any history, backups, or swapfiles
set nobackup                                " Disable backups
set nowb                                    " Disable write backup
set noswapfile                              " Disable swap files
set hidden                                  " Don't lose unsaved changes when opening a new file
set lazyredraw                              " Don't update the display while executing macros
set noerrorbells                            " Disable bells
set novisualbell                            " Disable visual bell
set t_vb=                                   " Clear terminal visual bell setting

" UI & colors
set t_Co=256                                " Use 256 colors
set termguicolors                           " Enable truecolor support
set background=dark                          " Use dark background
colorscheme catppuccin                       " Set color scheme

set laststatus=2                            " Always show statusline
set ruler                                   " Show cursor position
set cursorline                              " Highlight current line
set colorcolumn=120                         " Highlight column 120
set wrap                                    " Wrap long lines

" Show absolute and relative line numbers together (hybrid line numbers)
set number                                  " Show line numbers
set relativenumber                          " Show relative numbers

" Visual autocomplete for command menu
set wildmenu wildoptions=pum                " Enable visual autocomplete for command menu

" Text formatting & indentation
set tabstop=4                              " Width of a tab
set shiftwidth=4                           " Number of spaces for each indent level
set softtabstop=4                          " Number of spaces to insert for a tab
set expandtab                               " Use spaces instead of tabs

" Smart indentation
set autoindent                              " Copy indentation from previous line
set smartindent                             " Smartly indent new lines

" Search & matches
set ignorecase                              " Ignore case in searches
set smartcase                               " Override ignorecase if pattern contains uppercase
set hlsearch                                " Highlight search matches
set incsearch                               " Search as you type
set showmatch                               " Jump to matching bracket briefly
set matchpairs=(:),\[:\],{:},<:>            " Set matching pairs
set backspace=indent,eol,start              " Allow backspace over indentation, EOL, and start

" Set up ripgrep if available
if executable('rg')
  set grepprg=rg\ --vimgrep\ --smart-case\ --hidden    " Use rg for :grep
  set grepformat=%f:%l:%c:%m,%f:%l:%m                   " Set grep output format
endif

" Whitespace & visuals
set list                                   " Make non-printable characters visible
set listchars=tab:▶—,space:·,trail:␣,nbsp:+,extends:>,precedes:<   " Set visible whitespace characters

" Style whitespace characters
highlight SpecialKey ctermfg=238 guifg=#444444     " Style special key characters
highlight NonText ctermfg=238 guifg=#444444        " Style non-text characters

" Highlight trailing whitespaces with red background
highlight TrailingWhiteSpace ctermbg=red guibg=red  " Highlight trailing spaces in red
autocmd BufWinEnter * call clearmatches() | call matchadd('TrailingWhiteSpace', '\s\+$')

" Autocommands & compiler
" Treat colons as keywords only in C++
autocmd FileType cpp setlocal iskeyword+=:          " Include ':' in C++ keywords

" Set compiler
compiler gcc                               " Use gcc as the default compiler

" Show command in the last line of the screen
set showcmd                                " Show command in status line

" Key mappings
" Place search result to the middle of the screen
nnoremap n nzz                             " Next search result in center
nnoremap N Nzz                             " Previous search result in center

" Move by visual lines rather than logical lines (great for wrapped lines)
nnoremap j gj                              " Move down by visual line
nnoremap k gk                              " Move up by visual line

" Toggle visible whitespace characters easily
nnoremap <leader>l :set list!<CR>          " Toggle whitespace display

" Grep
nnoremap <leader>g :grep!  \| copen<C-Left><C-Left><Left>  " Grep project and open quickfix

" Grep word under cursor
nnoremap <leader>G :grep! <cword><CR>:copen<CR>        " Grep word under cursor and open quickfix
