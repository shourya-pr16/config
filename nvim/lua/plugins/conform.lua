-- lua/plugins/conform.lua
return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" }, -- format on save
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			sh = { "shfmt" },
			bash = { "shfmt" },
			zsh = { "shfmt" },
			go = { "gofumpt", "goimports" },
		},

		format_on_save = {
			timeout_ms = 1000,
			lsp_fallback = true,
		},
	},
}
