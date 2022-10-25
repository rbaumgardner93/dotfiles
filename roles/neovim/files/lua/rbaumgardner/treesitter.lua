local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

treesitter.setup({
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
		"rust",
		"scss",
		"tsx",
		"typescript",
		"vim",
		"yaml",
	},
	ignore_installed = { "" },
	autopairs = {
		enable = false,
	},
	autotag = {
		enable = false,
	},
	highlight = {
		enable = true, -- false will disable the whole extension
		additional_vim_regex_highlighting = true,
		disable = { "" },
	},
	indent = {
		enable = true,
	},
	query_linter = {
		enable = true,
		use_virtual_text = true,
		lint_events = { "BufWrite", "CursorHold" },
	},
	context_commenting = {
		enable = true,
		enable_autocmd = true,
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
