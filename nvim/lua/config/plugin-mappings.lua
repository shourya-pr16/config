-- telescope related mappings
require("telescope")
-- Enable Telescope extensions if they are installed
pcall(require("telescope").load_extension, "fzf")
pcall(require("telescope").load_extension, "ui-select")

-- See `:help telescope.builtin`
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
vim.keymap.set({ "n", "v" }, "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
vim.keymap.set("n", "<leader>sc", builtin.commands, { desc = "[S]earch [C]ommands" })
vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })

-- Same mapping at line:8 sf
-- vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })

vim.keymap.set("n", "<C-f>", builtin.git_files, { desc = "Telescope find files" })
-- vim.keymap.set("n", "<leader>fg", function()
--	local search_str = vim.fn.input("Grep > ")
--	builtin.grep_string({
--		search = search_str,
--		cwd = vim.fn.getcwd(),
--		path_display = { "truncate" },
--	})
--end)

-- undotree mapping
vim.keymap.set("n", "<leader>u", require("undotree").toggle, { noremap = true, silent = true })

-- lazy mapping
vim.keymap.set({ "n", "v" }, "<leader>l", "<cmd>:Lazy<CR>")

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
