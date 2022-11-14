# Dotfiles

## Installation

* Install neovim v.0.7.0+.
* Install `clangd` and `pyright` on your system. These are the language servers for C++ and Python respectively.
* Run [install.sh](/install.sh).
* Install package manager for neovim. In this setup, [Packer](https://github.com/wbthomason/packer.nvim#quickstart) is used for that purpose.
* Execute `:PackerSync` in neovim to install all the plugins defined in the Packer file.
