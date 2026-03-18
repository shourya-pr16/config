--treesitter
require("nvim-treesitter").setup({
	-- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
	install_dir = vim.fn.stdpath("data") .. "/site",
})

require("nvim-treesitter").install({
	"rust",
	"java",
	"zig",
	"go",
	"yaml",
	"json",
	"bash",
	"gomod",
	"gowork",
	"javascript",
	"typescript",
	"html",
})

vim.cmd([[colorscheme habamax]])

require("telescope").setup({
	-- You can put your default mappings / updates / etc. in here
	--  All the info you're looking for is in `:help telescope.setup()`
	--
	-- defaults = {
	--   mappings = {
	--     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
	--   },
	-- },
	-- pickers = {}
	extensions = {
		["ui-select"] = { require("telescope.themes").get_dropdown() },
	},
})
