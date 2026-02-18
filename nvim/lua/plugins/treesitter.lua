--	{
--		"nvim-treesitter/nvim-treesitter",
--		build = ":TSUpdate",
--		lazy = false,
--		event = { "BufReadPost", "BufNewFile" },
--	},
return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		lazy = false,
	},
}
