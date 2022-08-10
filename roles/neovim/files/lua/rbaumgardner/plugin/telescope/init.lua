local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

local actions = require("telescope.actions")
local icons = require("rbaumgardner.icons")

telescope.setup({
	defaults = {
		prompt_prefix = icons.ui.Telescope,
		selection_caret = icons.ui.ArrowRight,
		path_display = function(_, path)
			local tail = require("telescope.utils").path_tail(path)
			return string.format("%s (%s)", tail, path)
		end,
		file_ignore_patterns = { "yarn.lock" },
		winblend = 0,
		layout_strategy = "horizontal",
		layout_config = {
			width = 0.95,
			height = 0.85,
			prompt_position = "top",
		},
		vertical = {
			width = 0.9,
			height = 0.95,
			preview_height = 0.5,
		},
		selection_strategy = "reset",
		sorting_strategy = "descending",
		scroll_strategy = "cycle",
		color_devicons = true,
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
	},
	pickers = {},
})

telescope.load_extension("fzy_native")
telescope.load_extension("file_browser")

