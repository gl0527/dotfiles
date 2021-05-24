#!/bin/bash

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

ln -sfv $SCRIPT_DIR/bashrc $HOME/.bashrc
ln -sfv $SCRIPT_DIR/gitconfig $HOME/.gitconfig
ln -sfv $SCRIPT_DIR/vimrc $HOME/.nvimrc
ln -sfv $SCRIPT_DIR/vimrc $HOME/.vimrc
ln -sfv $SCRIPT_DIR/tmux.conf $HOME/.tmux.conf
ln -sfv $SCRIPT_DIR/gdbinit $HOME/.gdbinit
