local status_ok, indent_blankline = pcall(require, "indent_blankline")
if not status_ok then
	return
end

indent_blankline.setup({
	char = "▏",
	filetype_exclude = { "lazy", "lspinfo", "checkhealth", "help", "alpha", "NvimTree" },
	show_trailing_blankline_indent = false,
	show_current_context = true,
	char_highlight_list = {
		"IndentBlanklineIndent",
	},
})

vim.cmd([[
    highlight IndentBlanklineContextChar guifg=#9d7cd8 gui=nocombine
    highlight IndentBlanklineIndent guifg=#414868 gui=nocombine
]])
