local M = {}

M.setup = function(servers, options)
	local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
	if not status_ok then
		return
	end
	local lspconfig = require("lspconfig")
	local icons = require("rbaumgardner.icons")

	lsp_installer.setup({
		ensure_installed = vim.tbl_keys(servers),
		ui = {
			icons = {
				server_installed = icons.lsp.server_installed,
				server_pending = icons.lsp.server_pending,
				server_uninstalled = icons.lsp.server_uninstalled,
			},
		},
	})

	for ls, _ in pairs(servers) do
		local opts = vim.tbl_deep_extend("force", options, servers[ls] or {})

		if ls == "sumneko_lua" then
			opts = require("lua-dev").setup({ lspconfig = opts })
		end

		lspconfig[ls].setup(opts)
	end
end

return M
