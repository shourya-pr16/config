vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1
vim.g.loaded_tutor_mode_plugin = 1
vim.env.PATH = vim.env.PATH .. ":" .. vim.fn.expand("~/.nvm/versions/node/*/bin")

require("custom-conf")
require("config.lazy")
require("config.dap-config")
require("config.plugin-mappings")
require("config.plugin-settings")
require("config.lsp-config")

-- LSP
vim.lsp.enable("luals")
vim.lsp.enable("golsp")
-- vim.lsp.enable("javalsp")
vim.lsp.enable("zls_lsp")
