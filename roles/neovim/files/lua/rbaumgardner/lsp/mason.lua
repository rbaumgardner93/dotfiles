local M = {}

M.setup = function(options)
	local mason = require("mason")
	local mason_lsp = require("mason-lspconfig")
	local icons = require("rbaumgardner.icons")
	local servers = {
		"bashls",
		"cssls",
		"eslint",
		"dockerls",
		"gopls",
		"html",
		"jsonls",
		"sumneko_lua",
		"tsserver",
		"yamlls",
	}

	mason.setup({
		ui = {
			icons = {
				package_installed = icons.lsp.server_installed,
				package_pending = icons.lsp.server_pending,
				package_uninstalled = icons.lsp.server_uninstalled,
			},
		},
	})

	mason_lsp.setup({
		ensure_installed = servers,
		automatic_installation = true,
	})

	for _, server in ipairs(servers) do
		require("rbaumgardner.lsp.servers." .. server).setup(options)
	end
end

return M
