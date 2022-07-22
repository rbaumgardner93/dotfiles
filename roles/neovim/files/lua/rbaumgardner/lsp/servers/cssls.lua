local M = {
	setup = function(opts)
		require("lspconfig").cssls.setup({
			on_attach = opts.on_attach,
			capabilities = opts.capabilities,
		})
	end,
}

return M
