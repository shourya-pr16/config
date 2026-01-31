-- telescope related mappings
require("telescope")
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<C-f>', builtin.git_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', function() 
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)


-- undotree mapping
vim.keymap.set('n', '<leader>u', require('undotree').toggle, { noremap = true, silent = true })

-- lazy mapping
vim.keymap.set({ 'n', 'v', 't' }, '<leader>l', "<cmd>:Lazy<CR>")

-- lazy git mappings
-- " setup mapping to call :LazyGit
-- nnoremap <silent> <leader>gg :LazyGit<CR>
-- vim.api.nvim_set_keymap()
