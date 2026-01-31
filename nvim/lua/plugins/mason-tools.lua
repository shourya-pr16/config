-- lua/plugins/mason-tools.lua
return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	dependencies = { "mason-org/mason.nvim" },
	config = function()
		require("mason-tool-installer").setup({
			ensure_installed = {
				"stylua", -- Lua formatter
				"shfmt", -- Shell formatter
				"gofumpt", -- Go formatter
				"goimports", -- Go imports
				"lua-language-server", -- Lua
			},
			run_on_start = true, -- install missing tools on startup
			auto_update = false,
		})
	end,
}
