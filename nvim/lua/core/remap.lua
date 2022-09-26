local nnoremap = require("core.keymap").nnoremap

-- Toggle spell checking (OFF by default).
nnoremap("<leader><TAB>", "<cmd>setlocal spell!<CR>")
