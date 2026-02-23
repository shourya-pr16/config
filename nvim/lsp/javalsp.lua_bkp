return {
	"neovim/nvim-lspconfig",
	config = function()
		local lspconfig = require("lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local capabilities = cmp_nvim_lsp.default_capabilities()
		lspconfig.jdtls.setup({
			capabilities = capabilities,
			settings = {
				enable_inlay_hints = true,
				enable_snippets = true,
				warn_style = true,
			},
		})
	end,
}
