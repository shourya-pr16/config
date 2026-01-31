vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", vim.cmd.Ex, { desc = "Open explorer" })
vim.keymap.set("n", "<C-Tab>", "gt", { desc = "Next Tab" })
vim.keymap.set("n", "<C-S-Tab>", "gT", { desc = "Previous Tab" })

vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP Hover" })

vim.keymap.set("n", "<leader>cd", function()
	local newDir = vim.fn.input("Change Directory to > ")
	vim.fn.chdir(newDir) -- changing for global
end, { desc = " Change directory " })

vim.keymap.set({ "n", "v" }, "<C-S-c>", '"+y', { desc = "Copy to system clipboard " })
