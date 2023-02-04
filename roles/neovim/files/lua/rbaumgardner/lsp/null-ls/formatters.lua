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

M.format = function()
	if M.autoformat then
		vim.lsp.buf.format({
			filter = function(client)
				return client.name ~= "tsserver" and client.name ~= "sumneko_lua" and client.name ~= "cssls"
			end,
		})
	end
end

M.has_formatter = function(filetype)
	local available = null_ls_sources.get_available(filetype, method)

	return #available > 0
end

M.setup = function(client, bufnr)
	local filetype = vim.api.nvim_buf_get_option(bufnr, "filetype")

	local enable = false
	if M.has_formatter(filetype) then
		enable = client.name == "null-ls"
	else
		enable = not (client.name == "null-ls")
	end

	client.server_capabilities.documentFormattingProvider = enable
	client.server_capabilities.documentRangeFormattingProvider = enable
	if client.server_capabilities.documentFormattingProvider then
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				M.format()
			end,
		})
	end
end

return M
