return {
	"neovim/nvim-lspconfig",
	config = function()
		local lspconfig = require("lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local capabilities = cmp_nvim_lsp.default_capabilities()
		lspconfig.gopls.setup({
			capabilities = capabilities,
			settings = {
				gopls = {
					gofumpt = true, -- stricter formatting
					staticcheck = true, -- better diagnostics
					analyses = {
						unusedparams = true,
						shadow = true,
					},
				},
			},
		})
	end,
}
