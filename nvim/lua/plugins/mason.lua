-- lua/plugins/mason.lua
return {
	"mason-org/mason.nvim",
	config = function()
		require("mason").setup({
			-- optional settings
			PATH = "prepend", -- ensures Neovim sees installed binaries
		})
	end,
}
