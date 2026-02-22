vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1
vim.g.loaded_tutor_mode_plugin = 1
vim.env.PATH = vim.env.PATH .. ":" .. vim.fn.expand("~/.nvm/versions/node/*/bin")

require("custom-conf")
require("config.lazy")
require("config.dap-config")
require("config.plugin-mappings")
require("config.plugin-settings")

-- LSP
vim.lsp.enable("luals")
vim.lsp.enable("golsp")
vim.lsp.enable("javalsp")
vim.lsp.enable("zls_lsp")

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local bufnr = args.buf
		local opts = { buffer = bufnr, silent = true }

		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "<leader>f", function()
			vim.lsp.buf.format({ async = true })
		end, opts)
	end,
})
