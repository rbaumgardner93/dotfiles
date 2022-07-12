local which_key = require("which-key")
local legendary = require("legendary")

local M = {}

local peekFoldedLinesUnderCursor = function()
	local winid = require("ufo").peekFoldedLinesUnderCursor()

	if not winid then
		vim.lsp.hover()
	end
end

local function lsp_keymaps(bufnr)
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
			d = { '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', "Go to prev diagnostic" },
		},
		["]"] = {
			d = { '<cmd>lua vim.diagnostic.goto_next({ border = "rounded"})<CR>', "Go to next diagnostic" },
		},
		g = {
			name = "+goto",
			d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Go to definition" },
			D = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "Go to declaration" },
			i = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Go to implementation" },
			l = { '<cmd>lua vim.diagnostic.open_float({ border = "rounded" })<CR>', "View line diagnostic" },
			r = { "<cmd>lua vim.lsp.buf.references()<CR>", "Go to references" },
		},
		K = { peekFoldedLinesUnderCursor, "Hover definition" },
		["<leader>"] = {
			c = {
				a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code action" },
			},
			D = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", "View type definition" },
			r = {
				n = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
			},
			v = {
				s = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "View signature help" },
			},
		},
	}

	which_key.register(keymaps, opts)
	legendary.bind_whichkey(keymaps, opts, false)
end

function M.setup(bufnr)
	lsp_keymaps(bufnr)
end

return M
