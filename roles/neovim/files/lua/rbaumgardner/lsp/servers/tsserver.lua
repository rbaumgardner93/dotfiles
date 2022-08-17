local M = {
	setup = function(opts)
		require("typescript").setup({
			server = {
				on_attach = function(client, bufnr)
					require("nvim-navic").attach(client, bufnr)

					opts.on_attach(client, bufnr)
				end,
				capabilities = opts.capabilities,
			}
		})
	end,
}

return M
