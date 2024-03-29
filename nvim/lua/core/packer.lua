-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use {'wbthomason/packer.nvim'}
    -- Speed up loading Lua modules to improve startup time.
    use {'lewis6991/impatient.nvim'}
    -- Fancy color scheme.
    use {'folke/tokyonight.nvim', config = "vim.cmd('colorscheme tokyonight')"}
    -- Configurations for nvim LSP.
    use {'neovim/nvim-lspconfig', config = "require('plugin.nvim-lspconfig')"}
    -- Highly extendable fuzzy finder.
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        requires = {
            {'nvim-lua/plenary.nvim'},
            {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}
        },
        config = "require('plugin.telescope')"
    }
    -- Commenter.
    use {'preservim/nerdcommenter'}
end)
