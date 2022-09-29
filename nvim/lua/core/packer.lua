-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use {'wbthomason/packer.nvim'}                                      
    -- Speed up loading Lua modules to improve startup time.
    use {'lewis6991/impatient.nvim'}
    -- Replacement for filetype.vim, which is very slow on startup.
    use {'nathom/filetype.nvim'}
    -- Fancy color scheme.
    use {'folke/tokyonight.nvim', config = "vim.cmd('colorscheme tokyonight')"}
    -- Configurations for nvim LSP.
    use {'neovim/nvim-lspconfig', config = "require('plugin.nvim-lspconfig')"}
    -- Highly extendable fuzzy finder.
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = {
            {'nvim-lua/plenary.nvim'},
            {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}
        },
        config = "require('plugin.telescope')"
    }
    -- Statusline written in lua.
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        event = "BufWinEnter",
        config = "require('plugin.lualine')"
    }
    -- A completion engine written in lua.
    use {
        'hrsh7th/nvim-cmp',
        event = "InsertEnter",
        config = "require('plugin.nvim-cmp')"
    }
    use {'hrsh7th/cmp-buffer', after = "nvim-cmp"}
    use {'hrsh7th/cmp-nvim-lsp', after = "nvim-cmp"}
    -- Snippet engine.
    use {'SirVer/ultisnips'}
    use {'quangnguyen30192/cmp-nvim-ultisnips', after = "nvim-cmp"}
    -- Commenter.
    use {'preservim/nerdcommenter'}
    -- Debug Adapter Protocol implementation in lua.
    use {
        'rcarriga/nvim-dap-ui',
        requires = {'mfussenegger/nvim-dap'},
        config = "require('plugin.dap.init')"
    }
    -- Parser for syntax highlighting.
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
        event = "BufRead",
        config = "require('plugin.nvim-treesitter')"
    }
end)
