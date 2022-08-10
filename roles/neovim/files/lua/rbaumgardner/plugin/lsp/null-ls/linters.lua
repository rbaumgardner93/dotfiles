local M = {}

local null_ls_utils = require("rbaumgardner.plugin.lsp.null-ls.utils")
local null_ls_sources = require("null-ls.sources")

local method = require("null-ls").methods.DIAGNOSTICS

M.list_registered = function(filetype)
	local registered_providers = null_ls_utils.list_registered_providers_name(filetype)

	return registered_providers[method] or {}
end

M.list_supported = function(filetype)
	local supported_linters = null_ls_sources.get_supported(filetype, "diagnostics")
	table.sort(supported_linters)

	return supported_linters
end

return M
