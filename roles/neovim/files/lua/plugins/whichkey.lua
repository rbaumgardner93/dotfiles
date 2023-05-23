return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	config = function()
		local which_key = require("which-key")

		local setup_normal_keymaps = function()
			local opts = {
				mode = "n", -- NORMAL mode
				prefix = "",
				buffer = nil,
				silent = true,
				noremap = true,
				nowait = false,
			}

			local keymaps = {
				["]"] = {
					h = { "<cmd>Gitsigns next_hunk<CR>", "Gitsigns: next hunk" },
				},
				["["] = {
					h = { "<cmd>Gitsigns prev_hunk<CR>", "Gitsigns: prev hunk" },
				},
				g = {
					x = { ":!open <C-r><C-a><CR>", "Open url under cursor" },
				},
				-- [[
				-- from ThePrimeagen (https://www.youtube.com/watch?v=hSHATqh8svM)
				["J"] = { "mzJ`z", "Move line above and keep centered" },
				["n"] = { "nzzzv", "Keep centered when navigating forward" },
				["N"] = { "Nzzzv", "Keep centered when navigating backward" },
				["Y"] = { "y$", "Yank to end of line" },
				-- ]]
				["<C-e>"] = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", "Harpoon: toggle quick menu" },
				["<C-d>"] = { "<C-d>zz", "Keep it centered when moving down a file" },
				["<C-u>"] = { "<C-u>zz", "Keep it centered when moving up a file" },
				["<leader>"] = {
					["<CR>"] = { ":luafile %<CR>", "Fast sourcing" },
					a = { "<cmd>lua require('harpoon.mark').add_file()<CR>", "Harpoon: add file" },
					f = {
						name = "+navigating",
						b = {
							"<cmd>lua require('utils.telescope').file_browser()<cr>",
							"Telescope: File Browser",
						},
						c = { "<cmd>lua require('telescope.builtin').buffers()<cr>", "Telescope: Find open buffers" },
						f = {
							"<cmd>lua require('utils.telescope').find_files()<cr>",
							"Telescope: Find Files",
						},
						g = {
							"<cmd>lua require('utils.telescope').live_grep()<cr>",
							"Telescope: Grep Word",
						},
						k = { "<cmd>lua require('telescope.builtin').keymaps()<CR>", "Telescope: find keymaps" },
						h = {
							"<cmd>lua require('telescope.builtin').help_tags( { show_version = true } )<cr>",
							"Telescope: Find Help",
						},
						n = {
							"<cmd>lua require('utils.telescope').edit_neovim()<cr>",
							"Telescope: Find neovim",
						},
						r = {
							"<cmd>lua require('telescope.builtin').resume{}<cr>",
							"Telescope: Resume previous search",
						},
						s = {
							"<cmd>lua require('telescope.builtin').grep_string()<cr>",
							"Telescope: Find string under cursor",
						},
						t = {
							"<cmd>lua require('utils.telescope').curbuf()<cr>",
							"Telescope: Find in current buffer",
						},
						w = {
							"<cmd>lua require('utils.telescope').grep_string()<cr>",
							"Telescope: Find word",
						},
					},
					g = {
						name = "+git",
						a = { "<cmd>lua require('gitsigns').stage_buffer()<cr>", "Gitsigns: stage buffer" },
						b = {
							"<cmd>lua require('gitsigns').toggle_current_line_blame()<CR>",
							"Gitsigns: toggle current line blame",
						},
						B = { "<cmd>Git blame<CR>", "Fugitive: Git blame" },
						d = { "<cmd>Git diff<CR>", "Fugitive: Git diff" },
						h = { "<cmd>diffget //2<CR>", "Fugitive: Diff get left hand side" },
						l = { "<cmd>diffget //3<CR>", "Fugitive: Diff get right hand side" },
						p = { "<cmd>lua require('gitsigns).prev_hunk()<CR>", "Gitsigns: Preview hunk" },
						P = { "<cmd>Git push<CR>", "Fugitive: Git push" },
						r = { "<cmd>Gitsigns reset_hunk<CR>", "Gitsigns: reset hunk" },
						R = { "<cmd>lua require('gitsigns').reset_buffer()<CR>", "Gitsigns: reset buffer" },
						s = { "<cmd>G<CR>", "Fugitive: Git status" },
						S = { "<cmd>Gitsigns stage_hunk<CR>", "Gitsigns: stage hunk" },
						u = { "<cmd>lua require('gitsigns').undo_stage_hunk()<CR>", "Gitsigns: undo stage hunk" },
					},
					h = { "<cmd>lua require('harpoon.ui').nav_file(1)<CR>", "Harpoon: navigate to first file" },
					j = { "<cmd>lua require('harpoon.ui').nav_file(2)<CR>", "Harpoon: navigate to second file" },
					J = { ":m .+1<CR>==", "Move line down" },
					k = { "<cmd>lua require('harpoon.ui').nav_file(3)<CR>", "Harpoon: navigate to third file" },
					K = { ":m .-2<CR>==", "Move line up" },
					l = { "<cmd>lua require('harpoon.ui').nav_file(4)<CR>", "Harpoon: navigate to fourth file" },
					m = {
						d = { "<cmd>Glow<CR>", "Preview markdown" },
					},
					p = {
						name = "+project view",
						v = { ":Explore<CR>", "Open project view" },
					},
					q = {
						m = {
							"<cmd>lua require('harpoon.cmd-ui').toggle_quick_menu()<CR>",
							"Harpoon: toggle quick menu",
						},
					},
					t = {
						name = "+terminal",
						t = { ":term<CR>", "Open terminal" },
						g = { "<cmd>edit term://lazygit<CR>", "Lazygit toggle" },
					},
					u = {
						name = "+undotree",
						t = { "<cmd>UndotreeToggle<CR>", "Toggle undotree" },
					},
					w = { ":w!<CR>", "Save file" },
				},
			}

			which_key.register(keymaps, opts)
		end

		local setup_visual_keymaps = function()
			local opts = {
				mode = "v", -- VISUAL mode
				prefix = "",
				buffer = nil,
				silent = true,
				noremap = true,
				nowait = false,
			}

			local keymaps = {
				J = { ":m '>+1<CR>gv=gv", "Move selected line down" },
				K = { ":m '<-2<CR>gv=gv", "Move selected line up" },
				y = { "y']", "Yank to register" },
				[">"] = { ">gv", "Indent" },
				["<"] = { "<gv", "Dedent" },
				["<leader>"] = {
					g = {
						name = "+git",
						r = { "<cmd>Gitsigns reset_hunk<CR>", "Gitsigns: reset hunk" },
						s = { "<cmd>Gitsigns stage_hunk<CR>", "Gitsigns: stage hunk" },
					},
					p = { "_dP", "Paste below" },
					y = { '"+y', "Yank to system clipboard" },
				},
			}

			which_key.register(keymaps, opts)
		end

		local setup_terminal_keymaps = function()
			local opts = {
				mode = "t", --  TERMINAL mode
				prefix = "",
				buffer = nil,
				silent = true,
				noremap = true,
				nowait = false,
			}

			local keymaps = {
				["<ESC>"] = { "<C-\\><C-n>", "Close terminal" },
				Z = {
					Z = { "<C-\\><C-n>", "Close terminal" },
				},
			}

			which_key.register(keymaps, opts)
		end

		which_key.setup({
			plugins = { spelling = true },
		})

		setup_normal_keymaps()
		setup_visual_keymaps()
		setup_terminal_keymaps()
	end,
}
