local status_ok, indent_blankline = pcall(require, "indent_blankline")
if not status_ok then
	return
end

vim.cmd([[
    highlight IndentBlanklineContextChar guifg=#fe8019 gui=nocombine
]])

indent_blankline.setup({
	enabled = true,
	char = "▏",
	char_list = {},
	highlight_list = {},
	space_char_blankline = " ",
	space_char_highlight_list = {},
	space_char_blankline_highlight_list = {},
	use_treesitter = true,
	indent_level = 10,
	max_indent_increase = 10,
	show_first_indent_level = true,
	show_trailing_blankline_indent = true,
	show_end_of_line = false,
	show_foldtext = true,
	disable_with_nolist = false,
	filetype = {},
	filetype_exclude = { "lspinfo", "packer", "checkhealth", "help", "alpha", "NvimTree" },
	buftype_exclue = { "terminal", "nofile" },
	bufname_exclude = {},
	strict_tabs = false,
	show_current_context = true,
	show_current_context_start = true,
	show_current_context_start_on_current_line = true,
	context_char = "▏",
	context_char_list = {},
	context_highlight_list = {},
	context_patterns = {
		"class",
		"^func",
		"method",
		"^if",
		"while",
		"for",
		"with",
		"try",
		"except",
		"arguments",
		"argument_list",
		"object",
		"dictionary",
		"element",
		"table",
		"tuple",
	},
	context_pattern_highlight = {},
	viewport_buffer = 10,
	disable_warning_message = false,
	debug = false,
})
