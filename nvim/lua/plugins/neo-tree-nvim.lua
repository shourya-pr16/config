-- init.lua or plugins.lua
return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			close_if_last_window = true,
			popup_border_style = "rounded",
			-- enable_git_status = true,
			filesystem = {
				filtered_items = {
					hide_dotfiles = false,
					hide_gitignored = true,
				},
				follow_current_file = true,
				use_libuv_file_watcher = true,
			},
			window = {
				width = 40,
				mappings = {
					["<space>"] = "toggle_node",
					["<cr>"] = "open",
					["P"] = { "toggle_preview", config = { use_float = true } },
				},
			},
		})
	end,
}
