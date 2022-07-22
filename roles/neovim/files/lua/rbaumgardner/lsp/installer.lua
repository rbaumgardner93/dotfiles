local M = {}

M.setup = function(options)
	local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
	if not status_ok then
		return
	end
	local icons = require("rbaumgardner.icons")
	local servers = {
		"bashls",
		"cssls",
		"eslint",
		"dockerls",
		"html",
		"jsonls",
		"sumneko_lua",
		"tsserver",
		"yamlls",
	}

	lsp_installer.setup({
		ensure_installed = servers,
		automatic_installation = true,
		ui = {
			icons = {
				server_installed = icons.lsp.server_installed,
				server_pending = icons.lsp.server_pending,
				server_uninstalled = icons.lsp.server_uninstalled,
			},
		},
	})

	for _, server in ipairs(servers) do
		require("rbaumgardner.lsp.servers." .. server).setup(options)
	end
end

return M
