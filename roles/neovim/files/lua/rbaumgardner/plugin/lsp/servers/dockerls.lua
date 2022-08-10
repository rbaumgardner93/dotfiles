local M = {
	setup = function(opts)
		require("lspconfig").dockerls.setup({
			on_attach = opts.on_attach,
			capabilities = opts.capabilities,
		})
	end,
}

return M
