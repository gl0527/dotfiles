#!/bin/bash

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

ln -sfv $SCRIPT_DIR/bashrc $HOME/.bashrc
ln -sfv $SCRIPT_DIR/gitconfig $HOME/.gitconfig
ln -sfv $SCRIPT_DIR/tmux.conf $HOME/.tmux.conf
ln -sfv $SCRIPT_DIR/gdbinit $HOME/.gdbinit
ln -sfv $SCRIPT_DIR/vim/vimrc $HOME/.vimrc
ln -sfv $SCRIPT_DIR/vim/vimrc $HOME/.config/nvim/init.vim
ln -sfv $SCRIPT_DIR/vim/ftplugin/cpp.vim $HOME/.vim/ftplugin/cpp.vim
ln -sfv $SCRIPT_DIR/vim/ftplugin/cpp.vim $HOME/.config/nvim/ftplugin/cpp.vim
