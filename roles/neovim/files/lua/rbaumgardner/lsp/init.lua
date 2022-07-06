local M = {}

local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

M.on_attach = function(client, bufnr)
	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	-- Enable completion triggered by <c-x><c-o>
	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Use LSP as the handler for formatexpr.
	-- See `:help formatexpr` for more information.
	vim.api.nvim_buf_set_option(bufnr, "formatexpr", "v:lua.vim.lsp.formatexpr()")

	-- tagfunc
	if client.server_capabilities.definitionProvider then
		vim.api.nvim_buf_set_option(bufnr, "tagfunc", "v:lua.vim.lsp.tagfunc")
	end

	-- configure lsp keymaps
	require("rbaumgardner.lsp.keymaps").setup(bufnr)

	-- configure lsp highlighting
	require("rbaumgardner.lsp.highlight").setup(client)

	-- configure formatting
	require("rbaumgardner.lsp.null-ls.formatters").setup(client, bufnr)

	-- configure ts utils
	if client.name == "tsserver" then
		require("rbaumgardner.lsp.ts-utils").setup(client)
	end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
	properties = {
		"documentation",
		"detail",
		"additionalTextEdits",
	},
}
capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
}

M.capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities) -- for nvim-cmp

local opts = {
	-- enable snippet support
	capabilities = M.capabilities,
	-- map buffer local keybindings when the language server attaches
	on_attach = M.on_attach,
}

require("rbaumgardner.lsp.handlers").setup()

function M.setup()
	require("rbaumgardner.lsp.null-ls").setup(opts)

	local lspconfig_servers = {
		"cssls",
		"eslint",
	}

	local lspcontainer_servers = {
		"bashls",
		"dockerls",
		"gopls",
		"html",
		"jsonls",
		"rust_analyzer",
		"sumneko_lua",
		"tsserver",
		"yamlls",
	}

	for _, server in pairs(lspconfig_servers) do
		require("lspconfig")[server].setup(opts)
	end

	for _, server in pairs(lspcontainer_servers) do
		require("rbaumgardner.lsp.lspcontainers").setup(opts, server)

		require("lspconfig")[server].setup(opts)
	end
end

return M
