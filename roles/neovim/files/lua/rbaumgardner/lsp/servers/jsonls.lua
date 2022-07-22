local M = {
	setup = function(opts)
		require("lspconfig").jsonls.setup({
			settings = {
				json = {
					schemas = require("schemastore").json.schemas(),
				},
			},
			on_attach = opts.on_attach,
			capabilities = opts.capabilities,
		})
	end,
}

return M
