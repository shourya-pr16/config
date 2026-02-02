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

-- vim.cmd([[colorscheme tokyonight]])
vim.diagnostic.config({
	virtual_text = true, -- shows error text inline
	signs = true,
	underline = false,
	update_in_insert = false,
	severity_sort = true,
})

vim.keymap.set("n", "<leader>dg", vim.diagnostic.open_float, { desc = "Line diagnostics" })

vim.api.nvim_create_autocmd("CursorHold", {
	callback = function()
		vim.diagnostic.open_float(nil, { focusable = false })
	end,
})
