local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

treesitter.setup({
	ensure_installed = {
		"css",
		"go",
		"html",
		"javascript",
		"jsdoc",
		"json",
		"lua",
		"markdown",
		"scss",
		"rust",
		"tsx",
		"typescript",
		"vim",
		"yaml",
	},
	ignore_installed = { "" },
	autopairs = {
		enable = true,
	},
	autotag = {
		enable = true
	},
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "" },
	},
	indent = {
		enable = false,
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
