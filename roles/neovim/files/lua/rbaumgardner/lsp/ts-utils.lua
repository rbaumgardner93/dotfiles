local M = {}

local status_ok, ts_utils = pcall(require, "nvim-lsp-ts-utils")
if not status_ok then
	return
end

M.setup = function(client)
	ts_utils.setup({
		eslint_bin = "eslint_d",
		eslint_enable_diagnostics = true,
		eslint_enable_disable_comments = true,
	})

	ts_utils.setup_client(client);
end

return M
