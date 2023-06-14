local icons = require("icons")

return {
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		lazy = true,
		dependencies = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{ "williamboman/mason.nvim" }, -- Optional
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{ "L3MON4D3/LuaSnip" }, -- Required
		},
		config = function()
			-- This is where you modify the settings for lsp-zero
			-- Note: autocompletion settings will not take effect

			require("lsp-zero.settings").preset({})
		end,
	},
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
		config = function()
			local mason = require("mason")

			mason.setup({
				ui = {
					icons = {
						package_installed = icons.lsp.server_installed,
						package_pending = icons.lsp.server_pending,
						package_uninstalled = icons.lsp.server_uninstalled,
					},
				},
			})
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
	--  LSP plugins
	{
		"neovim/nvim-lspconfig",
		event = "BufReadPre",
		config = function()
			local lsp = require("lsp-zero")

			lsp.on_attach(function(client, bufnr)
				lsp.default_keymaps({ buffer = bufnr })

				local which_key = require("which-key")
				local opts = {
					mode = "n",
					prefix = "",
					buffer = bufnr,
					noremap = true,
					nowait = false,
				}
				local keymaps = {
					["["] = {
						d = { "<cmd>lua vim.diagnostic.goto_prev()<CR>", "Go to prev diagnostic" },
					},
					["]"] = {
						d = { "<cmd>lua vim.diagnostic.goto_next()<CR>", "Go to next diagnostic" },
					},
					g = {
						name = "+goto",
						d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Go to definition" },
						D = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "Go to declaration" },
						i = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Go to implementation" },
						l = { "<cmd>lua vim.diagnostic.open_float()<CR>", "View line diagnostic" },
						r = { "<cmd>lua vim.lsp.buf.references()<CR>", "Go to references" },
					},
					K = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover definition" },
					["<leader>"] = {
						c = {
							a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code action" },
						},
						r = {
							n = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
						},
						v = {
							s = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "View signature help" },
						},
					},
				}

				which_key.register(keymaps, opts)

				if client.server_capabilities.colorProvider then
					require("document-color").buf_attach(bufnr)
				end

				if client.server_capabilities.documentSymbolProvider then
					require("nvim-navic").attach(client, bufnr)
				end

				if client.server_capabilities.documentHighlightProvider then
					vim.api.nvim_exec(
						[[
					  augroup lsp_document_highlight
						autocmd! * <buffer>
						autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
						autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
					  augroup END
					]],
						false
					)
				end
			end)

			lsp.set_server_config({
				capabilities = {
					textDocument = {
						foldingRange = {
							dynamicRegistration = false,
							lineFoldingOnly = true,
						},
						completion = {
							completionItem = {
								snippetSupport = true,
								resolveSupport = {
									properties = {
										"documentation",
										"detail",
										"additionalTextEdits",
									},
								},
							},
						},
						colorProvider = {
							dynamicRegistration = true,
						},
					},
				},
			})

			lsp.set_sign_icons({
				error = icons.diagnostics.Error,
				warn = icons.diagnostics.Warning,
				hint = icons.diagnostics.Hint,
				info = icons.diagnostics.Information,
			})

			-- lsp diagnostic config
			vim.diagnostic.config({
				virtual_text = { severity = vim.diagnostic.severity.ERROR },
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
			})

			lsp.format_on_save({
				format_opts = {
					async = false,
					timeout_ms = 10000,
				},
				servers = {
					["null-ls"] = {
						"lua",
						"javascript",
						"javascriptreact",
						"json",
						"typescript",
						"typescriptreact",
						"yaml",
					},
				},
			})

			lsp.ensure_installed({
				"bashls",
				"cssls",
				"dockerls",
				"gopls",
				"html",
				"jsonls",
				"marksman",
				"lua_ls",
				"tsserver",
				"yamlls",
			})

			lsp.skip_server_setup({ "tsserver" })

			lsp.setup_servers({ "bashls", "cssls", "dockerls", "gopls", "html", "marksman", "yamlls" })

			lsp.configure("jsonls", {
				settings = {
					json = {
						schemas = require("schemastore").json.schemas(),
					},
				},
			})

			lsp.configure("lua_ls", lsp.nvim_lua_ls())

			lsp.setup()

			require("typescript").setup({
				server = {
					on_attach = function(client, bufnr)
						-- You can find more commands in the documentation:
						-- https://github.com/jose-elias-alvarez/typescript.nvim#commands

						vim.keymap.set("n", "<leader>ci", "<cmd>TypescriptAddMissingImports<cr>", { buffer = bufnr })
					end,
				},
			})
		end,
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			{
				"SmiteshP/nvim-navic",
				config = function()
					require("nvim-navic").setup({
						highlight = true,
						separator = icons.ui.ChevronRight,
					})
				end,
			},
			{
				"j-hui/fidget.nvim",
				tag = "legacy",
				config = function()
					local fidget = require("fidget")
					fidget.setup({
						text = {
							spinner = "dots_snake", -- animation shown when tasks are ongoing
							done = "✔", -- character shown when all tasks are complete
							commenced = "Started", -- message shown when task starts
							completed = "Completed", -- message shown when task completes
						},
					})
				end,
			},
			"folke/neodev.nvim",
			"jose-elias-alvarez/typescript.nvim",
		},
	},
	{
		"stevearc/aerial.nvim",
		cmd = { "AerialToggle" },
		config = function()
			require("aerial").setup()
		end,
	},
	-- formatters
	{
		"jose-elias-alvarez/null-ls.nvim",
		event = "BufReadPre",
		dependencies = { "mason.nvim" },
		config = function()
			local null_ls = require("null-ls")
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
				formatting.prettierd, -- :Mason install prettierd

				with_diagnostics_code(diagnostics.shellcheck), -- :Mason install shellcheck
				diagnostics.write_good, -- :Mason install write-good
				diagnostics.eslint_d,

				-- code actions
				code_actions.gitsigns,

				-- hover
				hover.dictionary,
			}

			null_ls.setup({
				sources = sources,
				debug = true,
			})
		end,
	},
}
