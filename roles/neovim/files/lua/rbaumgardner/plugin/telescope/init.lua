local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

local actions = require("telescope.actions")
local icons = require("rbaumgardner.icons")
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
		fzy_native = {
			override_generic_sorter = false,
			override_file_sorter = true,
		},
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

telescope.load_extension("fzy_native")
telescope.load_extension("file_browser")
