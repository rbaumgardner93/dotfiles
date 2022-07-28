local status_ok, gitsigns = pcall(require, "gitsigns")
if not status_ok then
	return
end

gitsigns.setup({
	signs = {
		add = { hl = "GitSignsAdd", text = "▎", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
		change = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
		delete = { hl = "GitSignsDelete", text = "▎", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
		topdelete = { hl = "GitSignsDelete", text = "▎", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
		changedelete = {
			hl = "GitSignsChange",
			text = "▎",
			numhl = "GitSignsChangeNr",
			linehl = "GitSignsChangeLn",
		},
	},
	signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
	numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
	linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
	word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
	watch_gitdir = {
		interval = 1000,
		follow_files = true,
	},
	attach_to_untracked = true,
	current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
	current_line_blame_opts = {
		virt_text = true,
		virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
		delay = 1000,
		ignore_whitespace = false,
	},
	current_line_blame_formatter_opts = {
		relative_time = false,
	},
	sign_priority = 6,
	update_debounce = 100,
	status_formatter = nil, -- Use default
	max_file_length = 40000,
	preview_config = {
		-- Options passed to nvim_open_win
		border = "single",
		style = "minimal",
		relative = "cursor",
		row = 0,
		col = 1,
	},
	yadm = {
		enable = false,
	},
	on_attach = function(bufnr)
		local gs = require("gitsigns")
		local whichkey = require("which-key")
		local legendary = require("legendary")

		local next_hunk = function()
			if vim.wo.diff then
				return "]c"
			end
			vim.schedule(function()
				gs.next_hunk()
			end)
			return "<Ignore>"
		end

		local prev_hunk = function()
			if vim.wo.diff then
				return "[c"
			end
			vim.schedule(function()
				gs.prev_hunk()
			end)
			return "<Ignore>"
		end

		local options = {
			mode = "n",
			prefix = "",
			buffer = bufnr,
			silent = true,
			noremap = true,
			nowait = false,
		}

		local keymaps = {
			-- Navigation
			[ "]c" ] = { next_hunk, "Gitsigns: next hunk"},
			[ "[c" ] = { prev_hunk, "Gitsigns: prev hunk"},

			-- Actions
			["<leader>"] = {
				h = {
					name = "+hunks",
					b = {
						function()
							gs.blame_line({ full = true })
						end,
						"Gitsigns: blame line full"
					},
					d = { gs.diffthis, "Gitsigns: diff this" },
					D = {
						function()
							gs.diffthis("~")
						end,
						"Gitsigns: diff this with arg"
					},
					p = { gs.preview_hunk, "Gitsigns: preview hunk" },
					s = { "<cmd>Gitsigns stage_hunk<CR>", "Gitsigns: stage hunk" },
					S = { gs.stage_buffer, "Gitsigns: stage buffer" },
					r = { "<cmd>Gitsigns reset_hunk<CR>", "Gitsigns: reset_hunk hunk" },
					R = { gs.reset_buffer, "Gitsigns: reset buffer" },
					u = { gs.undo_stage_hunk, "Gitsigns: undo stage hunk" },
				},
				t = {
					name = "+toggle",
					b = { gs.toggle_current_line_blame, "Gitsigns: toggle current line blame" },
					d = { gs.toggle_deleted, "Gitsigns: toggle deleted" }
				}
			},
		}

		whichkey.register(keymaps, options)
		legendary.bind_whichkey(keymaps, options, false)
	end,
})
