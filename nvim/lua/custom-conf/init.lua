require("custom-conf.remap")
require("custom-conf.terminal_toggle")

-- Startup options

-- vim.wo.rnu = true -- relative numbers in window are starting from 0
vim.opt.relativenumber = true
vim.opt.number = true

vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2

vim.cmd([[colorscheme habamax]])
