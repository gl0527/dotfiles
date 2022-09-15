-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'                                      -- Package manager.
  use 'folke/tokyonight.nvim'                                       -- Fancy color scheme.
  use 'neovim/nvim-lspconfig'                                       -- Configurations for nvim LSP.
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }   -- Fuzzy finder.
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  }                                                                 -- Highly extendable fuzzy finder.
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }                                                                 -- Statusline written in lua.
  use 'hrsh7th/cmp-nvim-lsp'                                        -- A completion engine written in lua.
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'SirVer/ultisnips'                                            -- Snippet engine.
  use 'quangnguyen30192/cmp-nvim-ultisnips'
end)
