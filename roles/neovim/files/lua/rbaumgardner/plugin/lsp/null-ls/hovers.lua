local M = {}

local null_ls_utils = require("rbaumgardner.plugin.lsp.null-ls.utils")
local method = require("null-ls").methods.HOVER

M.list_registered = function(filetype)
	local registered_providers = null_ls_utils.list_registered_providers_name(filetype)

	return registered_providers[method] or {}
end

return M
