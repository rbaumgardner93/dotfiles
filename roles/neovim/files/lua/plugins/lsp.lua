local icons = require("icons")

return {
	{
		"neovim/nvim-lspconfig",
		event = "BufReadPre",
		dependencies = {
			{ "williamboman/mason.nvim", config = true },
			{ "williamboman/mason-lspconfig.nvim", config = true },
			{
				"j-hui/fidget.nvim",
				tag = "legacy",
				opts = {
					text = {
						spinner = "dots_snake", -- animation shown when tasks are ongoing
						done = icons.lsp.server_installed, -- character shown when all tasks are complete
						commenced = "Started", -- message shown when task starts
						completed = "Completed", -- message shown when task completes
					},
				},
			},
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "L3MON4D3/LuaSnip" },
			"folke/neodev.nvim",
		},
		config = function()
			vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { desc = "Go to prev diagnostic" })
			vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", { desc = "Go to next diagnostic" })

			local lsp_formatting = function(bufnr)
				require("conform").format({ bufnr = bufnr })
			end

			local on_attach = function(client, bufnr)
				vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"

				vim.keymap.set(
					"n",
					"gd",
					"<cmd>lua vim.lsp.buf.definition()<CR>",
					{ buffer = bufnr, desc = "LSP: Go to definition" }
				)
				vim.keymap.set(
					"n",
					"gD",
					"<cmd>lua vim.lsp.buf.declaration()<CR>",
					{ buffer = bufnr, desc = "LSP: Go to declaration" }
				)
				vim.keymap.set(
					"n",
					"gi",
					"<cmd>lua vim.lsp.buf.implementation()<CR>",
					{ buffer = bufnr, desc = "LSP: Go to implementation" }
				)
				vim.keymap.set(
					"n",
					"gl",
					"<cmd>lua vim.diagnostic.open_float()<CR>",
					{ buffer = bufnr, desc = "LSP: View line diagnostic" }
				)
				vim.keymap.set(
					"n",
					"gr",
					"<cmd>lua vim.lsp.buf.references()<CR>",
					{ buffer = bufnr, desc = "LSP: Go to references" }
				)
				vim.keymap.set(
					"n",
					"K",
					"<cmd>lua vim.lsp.buf.hover()<CR>",
					{ buffer = bufnr, desc = "LSP: Hover definition" }
				)
				vim.keymap.set(
					"n",
					"<leader>ca",
					"<cmd>lua vim.lsp.buf.code_action()<CR>",
					{ buffer = bufnr, desc = "LSP: Code action" }
				)
				vim.keymap.set(
					"n",
					"<leader>rn",
					"<cmd>lua vim.lsp.buf.rename()<CR>",
					{ buffer = bufnr, desc = "LSP: Rename" }
				)
				vim.keymap.set(
					"n",
					"<leader>vs",
					"<cmd>lua vim.lsp.buf.signature_help()<CR>",
					{ buffer = bufnr, desc = "LSP: View signature help" }
				)

				if client.supports_method("textDocument/formatting") then
					local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							lsp_formatting(bufnr)
						end,
					})
				end

				if client.server_capabilities.documentHighlightProvider then
					local augroup = vim.api.nvim_create_augroup("LspDocumentHighlighting", {})
					vim.api.nvim_create_autocmd("CursorHold", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.document_highlight()
						end,
					})
					vim.api.nvim_create_autocmd("CursorMoved", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.clear_references()
						end,
					})
				end
			end

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

			local lspconfig = require("lspconfig")
			local servers = {
				bashls = {},
				cssls = {},
				jsonls = {
					json = {
						schemas = require("schemastore").json.schemas(),
					},
				},
				marksman = {},
				lua_ls = {
					Lua = {
						format = false,
						diagnostics = {
							globals = { "vim" },
						},
						workspace = { checkThirdParty = false },
						telemetry = { enable = false },
					},
				},
				tsserver = {},
				yamlls = {},
			}

			-- initialize before server setup
			require("neodev").setup()

			for server_name, _ in pairs(servers) do
				lspconfig[server_name].setup({
					capabilities = capabilities,
					on_attach = on_attach,
					settings = servers[server_name],
				})
			end
		end,
	},
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"rafamadriz/friendly-snippets",
			config = function()
				require("luasnip/loaders/from_vscode").lazy_load()
			end,
		},
		opts = {
			history = true,
			delete_check_events = "TextChanged",
		},
	},
}
