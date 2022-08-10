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
		local luadev = require("lua-dev").setup({
			lspconfig = {
				on_attach = opts.on_attach,
				settings = settings,
				capabilities = opts.capabilities,
			}
		})

		require("lspconfig").sumneko_lua.setup(luadev)
	end
}

return M
