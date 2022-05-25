local M = {}

-- TODO: backfill this to template
M.setup = function()
	local signs = {
		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	local config = {
		-- disable virtual text
		virtual_text = false,
		-- show signs
		signs = {
			active = signs,
		},
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = false,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	}

	vim.diagnostic.config(config)

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
	})

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
	})
end

local function lsp_highlight_document(client)
	-- Set autocommands conditional on server_capabilities
	if client.server_capabilities.document_highlight then
		vim.api.nvim_exec([[
		  augroup lsp_document_highlight
			autocmd! * <buffer>
			autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
			autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
		  augroup END
		]], false)
	end
end

local function lsp_keymaps(bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end

	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	-- Enable completion triggered by <c-x><c-o>
	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	local opts = { noremap = true, silent = true }

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	buf_set_keymap("n", "<leader>vs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	buf_set_keymap("n", "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	buf_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	buf_set_keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	buf_set_keymap("n", "gl", '<cmd>lua vim.diagnostic.open_float({ border = "rounded" })<CR>', opts)
	buf_set_keymap("n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
	buf_set_keymap("n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded"})<CR>', opts)
end

local function on_attach(client, bufnr)
	if client.name == "tsserver" then
		client.server_capabilities.document_formatting = false
	end

	if client.name == "eslint" then
		client.server_capabilities.document_formatting = true
	end

	lsp_keymaps(bufnr)
	lsp_highlight_document(client)
end

local function make_config()
	local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
	if not status_ok then
		return
	end

	local capabilities = cmp_nvim_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())
	capabilities.textDocument.completion.completionItem.snippetSupport = true
	capabilities.textDocument.completion.completionItem.resolveSupport = {
		properties = {
			'documentation',
			'detail',
			'additionalTextEdits'
		}
	}

	return {
		-- enable snippet support
		capabilities = capabilities,
		-- map buffer local keybindings when the language server attaches
		on_attach = on_attach
	}
end

M.init = function()
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
		"yamlls"
	}

	for _, server in pairs(lspconfig_servers) do
		local config = make_config()

		require'lspconfig'[server].setup(config)
	end

	for _, server in pairs(lspcontainer_servers) do
		local config = make_config()

		require("rbaumgardner.lsp.lspcontainers").setup(config, server)

		require'lspconfig'[server].setup(config)
	end
end

return M
