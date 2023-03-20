local settings = {
	Lua = {
		diagnostics = {
			globals = { "vim" },
		},
		workspace = {
			library = {
				[vim.fn.expand("$VIMRUNTIME/lua")] = true,
				[vim.fn.stdpath("config") .. "/lua"] = true,
			},
			maxPreload = 2000,
			preloadFileSize = 50000,
		},
		completion = { callSnippet = "Both" },
		telemetry = { enable = false },
	},
}

local M = {
	setup = function(opts)
		require("neodev").setup({})
		require("lspconfig").lua_ls.setup({
			settings,
			on_attach = function(client, bufnr)
				require("nvim-navic").attach(client, bufnr)

				opts.on_attach(client, bufnr)
			end,
			capabilities = opts.capabilities,
		})
	end,
}

return M
