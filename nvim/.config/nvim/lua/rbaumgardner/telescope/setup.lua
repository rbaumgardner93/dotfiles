local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

local set_prompt_to_entry_value = function(prompt_bufnr)
	local entry = action_state.get_selected_entry()
	if not entry or not type(entry) == "table" then
		return
	end

	action_state.get_current_picker(prompt_bufnr):reset_prompt(entry.ordinal)
end

telescope.setup({
	defaults = {
		prompt_prefix = " ",
		selection_caret = " ",
		path_display = { "smart" },
		file_ignore_patterns = { "%.spec.js" },
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

		mappings = {
			i = {
				["<C-y>"] = set_prompt_to_entry_value,
			},
		},

		file_previewer = require("telescope.previewers").vim_buffer_cat.new,
		grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
		qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
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
telescope.load_extension("packer")

if vim.fn.executable("gh") == 1 then
	telescope.load_extension("gh")
end
