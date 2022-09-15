#!/bin/bash

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

# Install bashrc
test -f $HOME/.bashrc && echo -e "\nsource $SCRIPT_DIR/bashrc" >> $HOME/.bashrc
test -f $HOME/.zshrc && echo -e "\nsource $SCRIPT_DIR/bashrc" >> $HOME/.zshrc

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

# Install nvim config
if command -v nvim &> /dev/null
then
    ln -sfv $SCRIPT_DIR/nvim $HOME/.config/nvim
else
    echo "nvim not found"
fi
