return {
	"nvim-telescope/telescope.nvim",
	cmd = { "Telescope" },
	keys = { "<leader>f" },
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local icons = require("icons")
		local fb_actions = require("telescope").extensions.file_browser.actions

		telescope.setup({
			defaults = {
				prompt_prefix = icons.ui.Telescope,
				selection_caret = icons.ui.ArrowRight,
				file_ignore_patterns = { "yarn.lock" },
				winblend = 0,
				layout_strategy = "horizontal",
				layout_config = {
					prompt_position = "top",
				},
				selection_strategy = "reset",
				sorting_strategy = "descending",
				scroll_strategy = "cycle",
				color_devicons = true,
				mappings = {
					n = {
						["q"] = actions.close,
					},
				},
			},
			buffers = {
				show_all_buffers = true,
				sort_lastused = true,
				mappings = {
					i = {
						["<C-x>"] = "delete_buffer",
						["<C-q>"] = actions.send_to_qflist,
					},
				},
			},
			extensions = {
				file_browser = {
					theme = "dropdown",
					mappings = {
						["n"] = {
							["%"] = fb_actions.create,
							["-"] = fb_actions.goto_parent_dir,
							["/"] = function()
								vim.cmd("startinsert")
							end,
						},
					},
				},
			},
			pickers = {},
		})

		-- Enable telescope fzf native, if installed
		telescope.load_extension("fzf")
		telescope.load_extension("file_browser")
	end,
	dependencies = {
		"nvim-lua/popup.nvim", -- An implementation of the Popup API from vim in Neovim
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = vim.fn.executable("make") == 1,
		},
		"nvim-telescope/telescope-file-browser.nvim",
	},
}
