local themes = require("telescope.themes")
local sorter = require("telescope.sorters")
local telescope = require("telescope")

local M = {}

local format_path = function(_, path)
	local tail = require("telescope.utils").path_tail(path)
	return string.format("%s (%s)", tail, path)
end

-- from TJ https://github.com/tjdevries/config_manager/blob/master/xdg_config/nvim/lua/tj/telescope/init.lua
-- [[
function M.edit_neovim()
	local opts_with_preview, opts_without_preview

	opts_with_preview = {
		prompt_title = "~ dotfiles ~",
		cwd = "~/.config/nvim",
		path_display = format_path,
		shorten_path = false,
		layout_strategy = "flex",
		layout_config = {
			width = 0.9,
			height = 0.8,

			horizontal = {
				width = { padding = 0.15 },
			},
			vertical = {
				preview_height = 0.75,
			},
		},
	}

	opts_without_preview = vim.deepcopy(opts_with_preview)
	opts_without_preview.previewer = false

	require("telescope.builtin").find_files(opts_with_preview)
end

function M.grep_string()
	local opts = {
		search = vim.fn.input("Grep for > "),
		short_path = false,
		path_display = format_path,
		word_match = "-w",
		only_sort_text = true,
		layout_strategy = "vertical",
		sorter = sorter.get_fzy_sorter(),
	}

	require("telescope.builtin").grep_string(opts)
end

function M.live_grep()
	require("telescope.builtin").live_grep({
		fzf_seperator = "|>",
		path_display = format_path,
	})
end

function M.curbuf()
	local opts = themes.get_dropdown({
		winblend = 0,
		border = true,
		previewer = false,
		shorten_path = false,
	})

	require("telescope.builtin").current_buffer_fuzzy_find(opts)
end

-- ]]

function M.find_files()
	local opts = {
		hidden = true,
		path_display = format_path,
	}

	require("telescope.builtin").find_files(opts)
end

function M.file_browser()
	local opts = {
		path = vim.fn.expand("%:p:h"),
		cwd = vim.fn.expand("%:p:h"),
		respect_gitignore = false,
		hidden = true,
		grouped = true,
		previewer = false,
		initial_mode = "normal",
		layout_config = { height = 40 },
	}

	telescope.extensions.file_browser.file_browser(opts)
end

return M
