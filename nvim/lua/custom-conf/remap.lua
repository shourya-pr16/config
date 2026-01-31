vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", vim.cmd.Ex, { desc = "Open explorer" })
vim.keymap.set("n", "<C-Tab>", "gt", { desc = "Next Tab" })
vim.keymap.set("n", "<C-S-Tab>", "gT", { desc = "Previous Tab" })
