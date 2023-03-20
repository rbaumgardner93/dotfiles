local M = {}

local null_ls_sources = require("null-ls.sources")

local method = require("null-ls").methods.FORMATTING

M.autoformat = true

M.toggle = function()
	M.autoformat = not M.autoformat

	if M.autoformat then
		vim.notify("Enabled format on save", vim.log.levels.INFO, { title = "Formatting" })
	else
		vim.notify("Disabled format on save", vim.log.levels.WARN, { title = "Formatting" })
	end
end

M.format = function(bufnr)
	local ft = vim.api.nvim_buf_get_option(bufnr, "filetype")
	local have_nls = #null_ls_sources.get_available(ft, method) > 0

	vim.lsp.buf.format({
		filter = function(client)
			if have_nls then
				return client.name == "null-ls"
			end

			return client.name ~= "null-ls"
				and client.name ~= "tsserver"
				and client.name ~= "lua_ls"
				and client.name ~= "cssls"
		end,
		bufnr = bufnr,
	})
end

M.setup = function(client, bufnr)
	if client.supports_method("textDocument/formatting") then
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				M.format(bufnr)
			end,
		})
	end
end

return M
