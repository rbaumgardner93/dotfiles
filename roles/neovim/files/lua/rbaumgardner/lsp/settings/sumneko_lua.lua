local opts = {
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

return opts
