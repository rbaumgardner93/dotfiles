local themes = require("telescope.themes")
local sorter = require("telescope.sorters")

local M = {}

-- from TJ https://github.com/tjdevries/config_manager/blob/master/xdg_config/nvim/lua/tj/telescope/init.lua
-- [[
function M.edit_neovim()
	local opts_with_preview, opts_without_preview

	opts_with_preview = {
		prompt_title = "~ dotfiles ~",
		shorten_path = false,
		cwd = "~/.config/nvim",

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
		short_path = false,
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
	})
end

function M.curbuf()
	local opts = themes.get_dropdown({
		winblend = 10,
		border = true,
		previewer = false,
		shorten_path = false,
	})

	require("telescope.builtin").current_buffer_fuzzy_find(opts)
end

-- ]]

return M
