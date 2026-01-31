-- lua/plugins/mason-lsp.lua
return {
	"williamboman/mason-lspconfig.nvim", -- still use this for lspconfig integration
	dependencies = { "mason-org/mason.nvim", "neovim/nvim-lspconfig" },
	config = function()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"gopls",
				"lua_ls",
				"jdtls",
				"zls",
			}, -- install LSP
			automatic_installation = true, -- auto install if missing
		})
	end,
}
