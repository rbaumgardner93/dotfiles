return {
	"nvim-treesitter/nvim-treesitter",
	event = "BufReadPost",
	build = ":TSUpdate", -- We recommend updating the parsers on update
	keys = {
		{ "<c-space>", desc = "Increment selection" },
		{ "<bs>", desc = "Shrink selection", mode = "x" },
	},
	config = function()
		local treesitter = require("nvim-treesitter.configs")

		treesitter.setup({
			autopairs = {
				enable = false,
			},
			autotag = {
				enable = false,
			},
			highlight = {
				enable = true, -- false will disable the whole extension
			},
			indent = {
				enable = true,
			},
			ensure_installed = {
				"bash",
				"css",
				"dockerfile",
				"gitignore",
				"go",
				"html",
				"javascript",
				"jsdoc",
				"json",
				"lua",
				"markdown",
				"markdown_inline",
				"python",
				"regex",
				"scss",
				"tsx",
				"typescript",
				"vim",
				"yaml",
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = "<nop>",
					node_decremental = "<bs>",
				},
			},
			query_linter = {
				enable = true,
				use_virtual_text = true,
				lint_events = { "BufWrite", "CursorHold" },
			},
			playground = {
				enable = true,
				disable = {},
				updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
				persist_queries = false, -- Whether the query persists across vim sessions
				keybindings = {
					toggle_query_editor = "o",
					toggle_hl_groups = "i",
					toggle_injected_languages = "t",
					toggle_anonymous_nodes = "a",
					toggle_language_display = "I",
					focus_language = "f",
					unfocus_language = "F",
					update = "R",
					goto_node = "<cr>",
					show_help = "?",
				},
			},
		})
	end,
	dependencies = {
		{ "nvim-treesitter/playground", cmd = { "TSPlaygroundToggle" } },
		"nvim-treesitter/nvim-treesitter-context",
	},
}
