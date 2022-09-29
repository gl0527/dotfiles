require("plugin.dap.cpp")

local nnoremap = require("core.keymap").nnoremap

nnoremap("<F4>", "<cmd>ClangdSwitchSourceHeader<CR>")
