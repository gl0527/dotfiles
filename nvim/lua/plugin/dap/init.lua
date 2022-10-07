local dap = require('dap')
local dapui = require("dapui")
local opts = { noremap = true, silent = true }

dapui.setup()

vim.keymap.set("n", "<F17>", dap.continue, opts) -- Shift + F5
vim.keymap.set("n", "<F41>", dap.run_last, opts) -- Ctrl + Shift + F5
vim.keymap.set("n", "<F18>", dap.pause, opts) -- Shift + F6
vim.keymap.set("n", "<F42>", dap.terminate, opts) -- Ctrl + Shift + F6
vim.keymap.set("n", "<F20>", dap.step_over, opts) -- Shift + F8
vim.keymap.set("n", "<F23>", dap.step_into, opts) -- Shift + F11
vim.keymap.set("n", "<F47>", dap.step_out, opts) -- Ctrl + Shift + F11
vim.keymap.set("n", "<F21>", dap.toggle_breakpoint, opts) -- Shift + F9
vim.keymap.set("n", "<F45>", dap.clear_breakpoints, opts) -- Ctrl + Shift + F9
vim.keymap.set("n", "<F19>", dap.up, opts) -- Shift + F7
vim.keymap.set("n", "<F43>", dap.down, opts) -- Ctrl + Shift + F7
vim.keymap.set("n", "<F24>", dapui.eval, opts) -- Shift + F12
vim.keymap.set("n", "<F48>", dapui.toggle, opts) -- Ctrl + Shift + F12

vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "Debug", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "➤", texthl = "DiagnosticInfo", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointCondition", { text = "鬒", texthl = "TSTodo", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointRejected", { text = " ", texthl = "TSError", linehl = "", numhl = "" })
vim.fn.sign_define("DapLogPoint", { text = " ", texthl = "DiagnosticHint", linehl = "", numhl = "" })
dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end
