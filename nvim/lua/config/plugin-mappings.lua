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

--harpoon

local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

vim.keymap.set("n", "<C-1>", function()
	ui.nav_file(1)
end)
vim.keymap.set("n", "<C-2>", function()
	ui.nav_file(2)
end)
vim.keymap.set("n", "<C-3>", function()
	ui.nav_file(3)
end)
vim.keymap.set("n", "<C-4>", function()
	ui.nav_file(4)
end)

-- explorer
vim.keymap.set("n", "<leader>e", "<cmd>:Neotree toggle<CR>", { desc = "Open explorer" })
vim.keymap.set("n", "P", "<cmd>:Neotree toggle_preview<CR>", { desc = "Toggle preview" })
