#!/bin/bash

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

ln -sfv $SCRIPT_DIR/bashrc $HOME/.bashrc

# Install gdb config
if command -v gdb &> /dev/null
then
    ln -sfv $SCRIPT_DIR/gdbinit $HOME/.gdbinit
else
    echo "gdb not found"
fi

# Install git config
if command -v git &> /dev/null
then
    ln -sfv $SCRIPT_DIR/gitconfig $HOME/.gitconfig
else
    echo "git not found"
fi

# Install tmux config
if command -v tmux &> /dev/null
then
    ln -sfv $SCRIPT_DIR/tmux.conf $HOME/.tmux.conf
else
    echo "tmux not found"
fi

# Install vim config
if command -v vim &> /dev/null
then
    mkdir -p $HOME/.vim/{colors,ftplugin}
    ln -sfv $SCRIPT_DIR/vim/vimrc $HOME/.vimrc
    ln -sfv $SCRIPT_DIR/vim/ftplugin/cpp.vim $HOME/.vim/ftplugin/cpp.vim
    ln -sfv $SCRIPT_DIR/vim/colors/badwolf.vim $HOME/.vim/colors/badwolf.vim
    ln -sfv $SCRIPT_DIR/vim/colors/zenburn.vim $HOME/.vim/colors/zenburn.vim
else
    echo "vim not found"
fi

# Install nvim config
if command -v nvim &> /dev/null
then
    mkdir -p $HOME/.config/nvim/{colors,ftplugin}
    ln -sfv $SCRIPT_DIR/vim/vimrc $HOME/.config/nvim/init.vim
    ln -sfv $SCRIPT_DIR/vim/ftplugin/cpp.vim $HOME/.config/nvim/ftplugin/cpp.vim
    ln -sfv $SCRIPT_DIR/vim/colors/badwolf.vim $HOME/.config/nvim/colors/badwolf.vim
    ln -sfv $SCRIPT_DIR/vim/colors/zenburn.vim $HOME/.config/nvim/colors/zenburn.vim
else
    echo "nvim not found"
fi
