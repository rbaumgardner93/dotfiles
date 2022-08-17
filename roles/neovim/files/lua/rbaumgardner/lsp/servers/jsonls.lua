local M = {
	setup = function(opts)
		require("lspconfig").jsonls.setup({
			settings = {
				json = {
					schemas = require("schemastore").json.schemas(),
				},
			},
			on_attach = function(client, bufnr)
				require("nvim-navic").attach(client, bufnr)

				opts.on_attach(client, bufnr)
			end,
			capabilities = opts.capabilities,
		})
	end,
}

return M
