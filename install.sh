#!/bin/bash

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

ln -sf $SCRIPT_DIR/.bashrc $HOME/.bashrc
ln -sf $SCRIPT_DIR/.gitconfig $HOME/.gitconfig
ln -sf $SCRIPT_DIR/.vimrc $HOME/.nvimrc
ln -sf $SCRIPT_DIR/.vimrc $HOME/.vimrc
ln -sf $SCRIPT_DIR/.tmux.conf $HOME/.tmux.conf
ln -sf $SCRIPT_DIR/.gdbinit $HOME/.gdbinit
