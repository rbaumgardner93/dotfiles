local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	sources = {
		-- cargo install stylua
		formatting.stylua,
		-- npm install -g eslint_d
		diagnostics.eslint_d,
		-- npm install -g write-good
		diagnostics.write_good,
	},
	debug = false,
	on_attach = function(client)
		if client.resolved_capabilities.document_formatting then
			vim.cmd([[
			  augroup LspFormatting
				autocmd! * <buffer>
				autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
			  augroup end
        	]])
		end
	end,
})
