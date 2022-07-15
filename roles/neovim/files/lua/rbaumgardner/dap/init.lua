local dap_status_ok, dap = pcall(require, "dap")
if not dap_status_ok then
	return
end

local M = {}

M.setup = function()
	require("rbaumgardner.dap.keymaps").setup()
	require("rbaumgardner.dap.node").setup()

	dap.set_log_level("DEBUG")

	vim.fn.sign_define("DapBreakpoint", { text = " ", texthl = "", linehl = "", numhl = "" })

	local load_launchjs = function()
		require("dap.ext.vscode").load_launchjs()
	end

	if not pcall(load_launchjs) then
		vim.notify("Failed to parse launch.json", "warn")
	end
end

return M
