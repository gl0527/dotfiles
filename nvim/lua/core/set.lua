vim.g.mapleader = " "

vim.opt.autoindent = true
vim.opt.backup = false
vim.opt.errorbells = false
vim.opt.expandtab = true
vim.opt.foldenable = false
vim.opt.guicursor = ""
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.lazyredraw = true
vim.opt.nu = true
vim.opt.rnu = true
vim.opt.scrolljump = 5
vim.opt.shiftwidth = 4
vim.opt.showmode = false
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.softtabstop = 4
vim.opt.swapfile = false
vim.opt.synmaxcol = 180
vim.opt.tabstop = 4
vim.opt.wrap = false
vim.opt.writebackup = false

-- Disable unused built-in plugins.
local disabled_built_ins = {
    "2html_plugin",
    "getscript",
    "getscriptPlugin",
    "gzip",
    "logipat",
    "matchit",
    "matchparen",
    "netrw",
    "netrwFileHandlers",
    "netrwPlugin",
    "netrwSettings",
    "remote_plugins",
    "rrhelper",
    "shada_plugin",
    "spellfile_plugin",
    "tar",
    "tarPlugin",
    "tutor_mode_plugin",
    "vimball",
    "vimballPlugin",
    "zip",
    "zipPlugin",
}

for _, plugin in pairs(disabled_built_ins) do
    vim.g["loaded_" .. plugin] = 1
end
