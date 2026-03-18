vim.g.mapleader = " "
vim.keymap.set("n", "<M-Tab>", "gt", { desc = "Next Tab" })
vim.keymap.set("n", "<M-S-Tab>", "gT", { desc = "Previous Tab" })

vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP Hover" })

vim.keymap.set("n", "<leader>cd", function()
	local newDir = vim.fn.input("Change Directory to > ")
	vim.fn.chdir(newDir) -- changing for global
end, { desc = " Change directory " })

vim.keymap.set({ "n", "v" }, "<C-S-c>", '"+y', { desc = "Copy to system clipboard " })

-- Function to wrap visual selection with any pair of brackets
function WrapSelectionWith(char)
	-- Map of matching pairs
	local pairs = { ["{"] = "}", ["["] = "]", ["("] = ")", ["<"] = ">" }

	-- Get the visual selection range
	local start_pos = vim.fn.getpos("'<")
	local end_pos = vim.fn.getpos("'>")

	-- Get the start and end lines
	local start_line, start_col = start_pos[2], start_pos[3]
	local end_line, end_col = end_pos[2], end_pos[3]

	-- Get lines in the selection
	local lines = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)

	-- Wrap first and last line
	lines[1] = string.sub(lines[1], 1, start_col - 1) .. char .. string.sub(lines[1], start_col)
	lines[#lines] = string.sub(lines[#lines], 1, end_col) .. pairs[char] .. string.sub(lines[#lines], end_col + 1)

	-- Set lines back
	vim.api.nvim_buf_set_lines(0, start_line - 1, end_line, false, lines)
end

-- Wrap selection in brackets with leader key + bracket
vim.keymap.set("v", "<leader>{", ":lua WrapSelectionWith('{')<CR>", { noremap = true, silent = true })
vim.keymap.set("v", "<leader>[", ":lua WrapSelectionWith('[')<CR>", { noremap = true, silent = true })
vim.keymap.set("v", "<leader>(", ":lua WrapSelectionWith('(')<CR>", { noremap = true, silent = true })
vim.keymap.set("v", "<leader><", ":lua WrapSelectionWith('<')<CR>", { noremap = true, silent = true })
vim.keymap.set("v", '<leader>"', ":lua WrapSelectionWith('\"')<CR>", { noremap = true, silent = true })

-- window resizing
vim.keymap.set("n", "<M->>", "<C-w>>", { desc = "Resize window right" })
vim.keymap.set("n", "<M-<>", "<C-w><", { desc = "Resize window right" })
vim.keymap.set("n", "<M-=>", "<C-w>+", { desc = "Resize window right" })
vim.keymap.set("n", "<M-->", "<C-w>-", { desc = "Resize window right" })

-- Buffer Switching
-- vim.keymap.set("n", "<M-b>", ":Telescope buffers<CR>", { desc = "Open fuzzy search in buffers" })
vim.keymap.set("n", "<M-Right>", "<cmd>bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<M-Left>", "<cmd>bprevious<CR>", { desc = "Previous buffer" })

-- move lines
vim.keymap.set("n", "<M-Down>", "<cmd>move +1<cr>", { desc = "Move line down" })
vim.keymap.set("n", "<M-Up>", "<cmd>move -2<cr>", { desc = "Move line up" })
