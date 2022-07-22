local M = {
	setup = function(opts)
		local lspconfig = require("lspconfig")

		lspconfig["eslint"].setup({
			root_dir = lspconfig.util.root_pattern(".eslintrc", ".eslintrc.js", ".eslintrc.json"),
			on_attach = function(client, bufnr)
				client.server_capabilities.documentFormattingProvider = true
				opts.on_attach(client, bufnr)
			end,
			capabilities = opts.capabilities,
			settings = {
				format = {
					enable = true,
				},
			},
			handlers = {
				["window/showMessageRequest"] = function(_, result)
					if result.message:find("ENOENT") then
						return vim.NIL
					end

					return vim.lsp.handlers["window/showMessageRequest"](nil, result)
				end,
			},
		})
	end,
}

return M
