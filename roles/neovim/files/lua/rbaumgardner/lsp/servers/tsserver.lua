local M = {
	setup = function(opts)
		require("typescript").setup({
			server = {
				on_attach = function(client, bufnr)
					opts.on_attach(client, bufnr)
				end,
				capabilities = opts.capabilities,
			}
		})
	end,
}

return M
