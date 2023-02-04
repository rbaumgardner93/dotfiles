local which_key = require("which-key")

local M = {}

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
	end,
}

local function lsp_keymaps(bufnr)
	normal_keymaps.setup(bufnr)
end

function M.setup(bufnr)
	lsp_keymaps(bufnr)
end

return M
