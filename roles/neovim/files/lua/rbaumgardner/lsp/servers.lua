local json_settings = require("rbaumgardner.lsp.settings.jsonls")
local lua_settings = require("rbaumgardner.lsp.settings.sumneko_lua")

local servers = {
	bashls = {},
	cssls = {},
	eslint = {},
	dockerls = {},
	html = {},
	jsonls = json_settings,
	sumneko_lua = {
		settings = lua_settings,
	},
	tsserver = {},
	yamlls = {},
}

return servers
