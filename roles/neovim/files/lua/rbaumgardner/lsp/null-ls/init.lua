local M = {}

local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local hover = null_ls.builtins.hover
local code_actions = null_ls.builtins.code_actions

local with_diagnostics_code = function(builtin)
	return builtin.with({
		diagnostics_format = "#{m} [#{c}]",
	})
end

local sources = {
	-- formatting
	formatting.fixjson, -- :Mason install fixjson
	formatting.stylua, -- :Mason install stylua
	formatting.prettierd.with({
		filetypes = { "markdown" },
	}), -- :Mason install prettierd

	with_diagnostics_code(diagnostics.shellcheck), -- :Mason install shellcheck
	diagnostics.write_good, -- :Mason install write-good

	-- code actions
	code_actions.gitsigns,

	-- hover
	hover.dictionary,
}

function M.setup(opts)
	null_ls.setup({
		sources = sources,
		on_attach = opts.on_attach,
		debug = true,
	})
end

return M
