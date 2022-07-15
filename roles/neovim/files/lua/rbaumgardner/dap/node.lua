local dap_status_ok, dap = pcall(require, "dap")
if not dap_status_ok then
	return
end

local M = {}

M.setup = function()
	dap.adapters.node2 = {
		type = "executable",
		command = "node",
		args = {
			vim.fn.stdpath("data") .. "/dap/" .. "/vscode-node-debug2/out/src/nodeDebug.js",
		},
	}

	dap.adapters.chrome = {
		type = "executable",
		command = "node",
		args = {
			vim.fn.stdpath("data") .. "/dap/" .. "/vscode-chrome-debug/out/src/chromeDebug.js",
		},
	}

	-- dap.configurations.javascript = {
	-- 	{
	-- 		name = "Launch",
	-- 		type = "node2",
	-- 		request = "launch",
	-- 		program = "${file}",
	-- 		cwd = vim.fn.getcwd(),
	-- 		sourceMaps = true,
	-- 		protocol = "inspector",
	-- 		console = "integratedTerminal",
	-- 	},
	-- 	{
	-- 		-- For this to work you need to make sure the node process is started with the `--inspect` flag.
	-- 		name = "Attach to process",
	-- 		type = "node2",
	-- 		request = "attach",
	-- 		processId = require("dap.utils").pick_process,
	-- 	},
	-- }

	dap.configurations.javascript = { -- change this to javascript if needed
		{
			type = "chrome",
			request = "attach",
			program = "${file}",
			cwd = vim.fn.getcwd(),
			sourceMaps = true,
			protocol = "inspector",
			port = 9222,
			webRoot = "${workspaceFolder}",
		},
	}

	dap.configurations.typescriptreact = { -- change to typescript if needed
		{
			type = "chrome",
			request = "attach",
			program = "${workspaceFolder}/${file}",
			cwd = vim.fn.getcwd(),
			sourceMaps = true,
			protocol = "inspector",
			port = 9222,
			webRoot = "${workspaceFolder}",
		},
	}
end


return M
