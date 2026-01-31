-- lua/plugins/completion.lua
return {
	-- Autocomplete engine
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp", -- LSP source
		"L3MON4D3/LuaSnip", -- Snippet engine
		"saadparwaiz1/cmp_luasnip", -- Snippet source
		"hrsh7th/cmp-path", -- File paths
		"hrsh7th/cmp-buffer", -- Buffer words
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-n>"] = cmp.mapping.select_next_item(),
				["<C-p>"] = cmp.mapping.select_prev_item(),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
				["<C-Space>"] = cmp.mapping.complete(),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "path" },
			}),
		})

		-- LSP capabilities for nvim-cmp
		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		return capabilities
	end,
}
