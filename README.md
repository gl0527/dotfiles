# Dotfiles

## Installation

1 Install neovim v.0.7.0+.
1 Install `clangd` and `pyright` on your system. These are the language servers for C++ and Python respectively.
1 Run [install.sh](/install.sh).
1 Install package manager for neovim. In this setup, [Packer](https://github.com/wbthomason/packer.nvim#quickstart) is used for that purpose.
1 Execute `:PackerSync` in neovim to install all the plugins defined in the Packer file.
