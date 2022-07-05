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
	formatting.stylua, -- carge install stylua
	formatting.fixjson, -- npm install -g fixjson

	-- diagnostics
	diagnostics.eslint_d, -- npm install -g eslint_d
	diagnostics.write_good, -- npm install -g write-good
	with_diagnostics_code(diagnostics.shellcheck), -- brew install shellcheck

	-- code actions
	code_actions.eslint_d,
	code_actions.gitsigns,
	code_actions.gitrebase,

	-- hover
	hover.dictionary,
}

function M.setup(opts)
	null_ls.setup({
		sources = sources,
		on_attach = opts.on_attach,
		debug = false,
	})
end

return M
