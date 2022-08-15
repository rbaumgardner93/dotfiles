local status_ok, navic = pcall(require, "nvim-navic")
if not status_ok then
	return
end
local icons = require("icons")

local M = {}

M.setup = function(client, bufnr)
	if client.server_capabilities.documentSymbolProvider then
		navic.setup({
			highlight = true,
			separator = icons.ui.ChevronRight,
		})

		navic.attach(client, bufnr)
	end
end

return M
