local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

local nmap = require("rbaumgardner.utils.keymap").nmap
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

-- Keymaps
nmap({ "<leader>en", "<cmd>lua require('rbaumgardner.plugins.telescope').edit_neovim()<cr>" })
nmap({ "<leader>ff", "<cmd>lua require('telescope.builtin').find_files({ hidden = true })<cr>" })
nmap({
	"<leader>fb",
	"<cmd>lua require('telescope').extensions.file_browser.file_browser( { path = vim.fn.expand('%:p:h'), hidden = true } )<cr>",
})
nmap({ "<leader>fg", "<cmd>lua require('rbaumgardner.plugins.telescope').live_grep()<cr>" })
nmap({ "<leader>fs", "<cmd>lua require('rbaumgardner.plugins.telescope').grep_string()<cr>" })
nmap({ "<leader>fc", "<cmd>lua require('telescope.builtin').buffers()<cr>" })
nmap({
	"<leader>fh",
	"<cmd>lua require('telescope.builtin').help_tags( { show_version = true } )<cr>",
})
nmap({ "<leader>fr", "<cmd>lua require('telescope.builtin').resume{}<cr>" })
nmap({
	"<leader>gw",
	"<cmd>lua require('telescope.builtin').grep_string( { path_display = { 'shorten' }, search = vim.fn.input('Grep for > ') } )<cr>",
})
nmap({ "<leader>cb", "<cmd>lua require('rbaumgardner.plugins.telescope').curbuf()<cr>" })
nmap({ "<leader>fp", ":Telescope packer<cr>" })
