local M = {
	setup = function(opts)
		require("lspconfig").bashls.setup({
			on_attach = opts.on_attach,
			capabilities = opts.capabilities,
		})
	end,
}

return M
