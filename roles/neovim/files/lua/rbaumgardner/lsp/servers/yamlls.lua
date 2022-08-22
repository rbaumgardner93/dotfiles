local M = {
	setup = function(opts)
		require("lspconfig").yamlls.setup({
			settings = {
				yaml = {
					format = {
						enable = false,
					}
				}
			},
			on_attach = opts.on_attach,
			capabilities = opts.capabilities,
		})
	end,
}

return M
