return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
}
--
-- lua/plugins/treesitter.lua
-- return {
--  "nvim-treesitter/nvim-treesitter",
--  build = ":TSUpdate",
--  event = { "BufReadPost", "BufNewFile" },
--  opts = {
--    ensure_installed = {
--      "lua",
--      "bash",
--      "sh",
--      "json",
--      "yaml",
--      "markdown",
--      "go",
--      "java",
--    },
--    highlight = { enable = true },
--    indent = { enable = true },
--  },
--  config = function(_, opts)
--    require("nvim-treesitter.configs").setup(opts)
--  end,
--}
