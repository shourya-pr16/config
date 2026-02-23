local mason_dap = require("mason-nvim-dap")
local dap = require("dap")
local dap_ui = require("dapui")
local dap_virtual_text = require("nvim-dap-virtual-text")

-- virtual text
dap_virtual_text.setup()

mason_dap.setup({
	ensure_installed = { "delve", "java-debug-adapter" },
	automatic_installation = true,
	handlers = {
		function(config)
			require("mason-nvim-dap").default_setup(config)
		end,
	},
})

-- ======================
-- GO
-- ======================

dap.adapters.delve = function(callback, config)
	if config.mode == "remote" and config.request == "attach" then
		callback({
			type = "server",
			host = config.host or "127.0.0.1",
			port = config.port or "38697",
		})
	else
		callback({
			type = "server",
			port = "${port}",
			executable = {
				command = "dlv",
				args = { "dap", "-l", "127.0.0.1:${port}", "--log", "--log-output=dap" },
				detached = vim.fn.has("win32") == 0,
			},
		})
	end
end

dap.configurations.go = {

	{
		type = "delve",
		name = "Debug",
		request = "launch",
		program = "${workspaceFolder}",
		buildFlags = "-gcflags=all=-N ",
	},
	{
		type = "delve",
		name = "Debug test", -- configuration for debugging test files
		request = "launch",
		mode = "test",
		program = "${file}",
	},
	-- works with go.mod packages and sub packages
	{
		type = "delve",
		name = "Debug test (go.mod)",
		request = "launch",
		mode = "test",
		program = "./${relativeFileDirname}",
	},
}

-- ======================
-- JAVA
-- ======================

-- Enable DAP
-- local jdtls = require("jdtls")
-- jdtls.setup_dap({ hotcodereplace = "auto" })

-- Basic launch configuration
dap.configurations.java = {
	{
		type = "java",
		request = "attach",
		name = "Attach to Java (port 5005)",
		hostName = "127.0.0.1",
		port = function()
			return tonumber(vim.fn.input("Enter Debug Port: "))
		end,
	},
}

-- Dap UI

dap_ui.setup()

vim.fn.sign_define("DapBreakpoint", { text = "🐞" })

dap.listeners.before.attach.dapui_config = function()
	dap_ui.open()
end
dap.listeners.before.launch.dapui_config = function()
	dap_ui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
	dap_ui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
	dap_ui.close()
end
