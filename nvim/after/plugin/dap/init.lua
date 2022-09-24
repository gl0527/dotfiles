local dap = require('dap')
local dapui = require("dapui")
local opts = { noremap = true, silent = true }

dapui.setup({
  icons = { expanded = "", collapsed = "" },
  floating = { border = nil },
  windows = { indent = 2 },
  expand_lines = false,
  layouts = {
    --{
    --  elements = {
    --    "console",
    --    --"repl"
    --  },
    --  size = 0.3,
    --  position = "left",
    --},
    {
      elements = {
        "scopes",
        --"breakpoints",
        --"stacks",
        --"watches",
      },
      size = 0.3,
      position = "bottom",
    },
  },
  --mappings = {
  --  expand = { "<cr>", "<2-LeftMouse>" },
  --  open = "o",
  --  remove = "d",
  --  edit = "e",
  --  repl = "r",
  --  toggle = "t",
  --},
})

vim.keymap.set("n", "<leader>C", dap.continue, opts)
vim.keymap.set("n", "<leader>c", dap.step_over, opts)
vim.keymap.set("n", "<leader>v", dap.step_into, opts)
vim.keymap.set("n", "<leader>V", dap.step_out, opts)
vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, opts)
vim.keymap.set("n", "<leader>B", dap.clear_breakpoints, opts)
vim.keymap.set("n", "<leader>x", dap.reverse_continue, opts)
vim.keymap.set("n", "<leader>X", dap.terminate, opts)
vim.keymap.set("n", "<leader>e", dapui.eval, opts)
vim.keymap.set("n", "<leader>E", dapui.toggle, opts)
vim.keymap.set("n", "<leader>p", dap.pause, opts)
vim.keymap.set("n", "<leader>r", dap.repl.toggle, opts)
vim.keymap.set("n", "<leader>R", dap.run_last, opts)
vim.keymap.set("n", "<leader>u", dap.up, opts)
vim.keymap.set("n", "<leader>d", dap.down, opts)
vim.keymap.set("n", "X", function()
      dapui.float_element("console", {
      width = vim.api.nvim_get_option("columns"),
      height = vim.api.nvim_get_option("lines"),
      enter = false
    })
    end,
    { noremap = false, silent = true })
local widgets = require("dap.ui.widgets")
vim.keymap.set("n", "<leader>h", widgets.hover, opts)
vim.keymap.set("n", "<C-x>", function()
  widgets.centered_float(widgets.scopes)
end, opts)

vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "Debug", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "➤", texthl = "DiagnosticInfo", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointCondition", { text = "鬒", texthl = "TSTodo", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointRejected", { text = " ", texthl = "TSError", linehl = "", numhl = "" })
vim.fn.sign_define("DapLogPoint", { text = " ", texthl = "DiagnosticHint", linehl = "", numhl = "" })
dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end
