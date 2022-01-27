local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

local actions = require("telescope.actions")

telescope.setup({
	defaults = {
		prompt_prefix = " ",
		selection_caret = " ",
		path_display = { "smart" },
		file_ignore_patterns = { "%.spec.js" },
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
telescope.load_extension("gh")
telescope.load_extension("packer")
