-- telescope related mappings
require("telescope")
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })

vim.keymap.set("n", "<C-f>", builtin.git_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", function()
	local search_str = vim.fn.input("Grep > ")
	builtin.grep_string({
		search = search_str,
		cwd = vim.fn.getcwd(),
		path_display = { "truncate" },
	})
end)

-- undotree mapping
vim.keymap.set("n", "<leader>u", require("undotree").toggle, { noremap = true, silent = true })

-- lazy mapping
vim.keymap.set({ "n", "v" }, "<leader>l", "<cmd>:Lazy<CR>")

-- lazy git mapping
vim.keymap.set({ "n" }, "<leader>~", "<cmd>:LazyGit<CR>")
