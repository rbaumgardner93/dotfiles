local status_ok, navic = pcall(require, "nvim-navic")
if not status_ok then
	return
end
local icons = require("icons")

local M = {}

M.setup = function()
	navic.setup({
		highlight = true,
		separator = icons.ui.ChevronRight,
	})
end

return M
