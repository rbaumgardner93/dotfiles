local which_key = require("which-key")
local legendary = require("legendary")

local M = {}

local dap_keymaps = function()
	local opts = {
		mode = "n", -- NORMAL mode
		prefix = "",
		buffer = nil,
		silent = true,
		noremap = true,
		nowait = false,
	}

	local keymaps = {
		["<F5>"] = { "<cmd>lua require'dap'.continue()<CR>", "Debug continue" },
		["<F10>"] = { "<cmd>lua require'dap'.step_over()<CR>", "Debug step over" },
		["<F11>"] = { "<cmd>lua require'dap'.step_into()<CR>", "Debug step into" },
		["<F12>"] = { "<cmd>lua require'dap'.step_out()<CR>", "Debug step out" },
		["<leader>"] = {
			d = {
				name = "+debug",
				b = { "<cmd>lua require'dap'.toggle_breakpoint()<CR>", "Toggle breakpoint" },
				B = {
					"<cmd>lua require'dap'.toggle_breakpoint(vim.fn.input('Breakpoint condition: ')<CR>",
					"Toggle breakpoint with condition",
				},
				l = { "<cmd>lua require'dap'.run_last()<CR>", "Debug last" },
				m = {
					"<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')<CR>",
					"Set breakpoint message",
				},
				r = { "<cmd>lua require'dap'.repl.open()<CR>", "Debug repl" },
			},
		}
	}

	which_key.register(keymaps, opts)
	legendary.bind_whichkey(keymaps, opts, false)
end

M.setup = function()
	dap_keymaps()
end

return M
