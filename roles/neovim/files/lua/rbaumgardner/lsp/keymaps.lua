local which_key = require("which-key")
local legendary = require("legendary")
local action = require("lspsaga.codeaction")
local diagnostic = require("lspsaga.diagnostic")

local M = {}

local peekFoldedLinesUnderCursor = function()
	local winid = require("ufo").peekFoldedLinesUnderCursor()

	if not winid then
		vim.lsp.hover()
	end
end

local normal_keymaps = {
	setup = function(bufnr)
		local opts = {
			mode = "n",
			prefix = "",
			buffer = bufnr,
			noremap = true,
			nowait = false,
		}

		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local keymaps = {
			["["] = {
				d = { diagnostic.goto_prev, "Go to prev diagnostic" },
			},
			["]"] = {
				d = { diagnostic.goto_next, "Go to next diagnostic" },
			},
			["<C-f"] = {
				function()
					action.smart_scroll_with_saga(1)
				end,
				"LSPSAGA: scroll forward in hover doc",
			},
			["<C-b"] = {
				function()
					action.smart_scroll_with_saga(1)
				end,
				"LSPSAGA: scroll backward in hover doc",
			},
			f = {
				a = {
					require("lspsaga.finder").lsp_finder,
					"LSPSAGA: find definition and references",
				},
			},
			g = {
				name = "+goto",
				d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Go to definition" },
				D = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "Go to declaration" },
				i = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Go to implementation" },
				l = { diagnostic.show_line_diagnostics, "View line diagnostic" },
				r = { "<cmd>lua vim.lsp.buf.references()<CR>", "Go to references" },
			},
			K = { require("lspsaga.hover").render_hover_doc, "Hover definition" },
			["<leader>"] = {
				c = {
					a = { action.code_action, "Code action" },
				},
				D = { require("lspsaga.definition").preview_definition, "View type definition" },
				K = { peekFoldedLinesUnderCursor, "Peek folded lines under cursor" },
				r = {
					n = { require("lspsaga.rename").lsp_rename, "Rename" },
				},
				v = {
					s = { require("lspsaga.signaturehelp").signature_help, "View signature help" },
					o = { "<cmd>LSoutlineToggle<CR>", "View file outline" },
				},
			},
		}

		which_key.register(keymaps, opts)
		legendary.bind_whichkey(keymaps, opts, false)
	end,
}

local visual_keymaps = {
	setup = function(bufnr)
		local opts = {
			mode = "v",
			prefix = "",
			buffer = bufnr,
			noremap = true,
			nowait = false,
		}

		local range_code_action = function()
			vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-U>", true, false, true))
			action.range_code_action()
		end

		local keymaps = {
			["<leader>"] = {
				c = {
					a = { range_code_action, "Code action" },
				},
			},
		}

		which_key.register(keymaps, opts)
		legendary.bind_whichkey(keymaps, opts, false)
	end,
}

local function lsp_keymaps(bufnr)
	normal_keymaps.setup(bufnr)
	visual_keymaps.setup(bufnr)
end

function M.setup(bufnr)
	lsp_keymaps(bufnr)
end

return M
