return {
	{
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "BufReadPost",
		config = function()
			require("indent_blankline").setup({
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
		end,
	},
	{
		"norcalli/nvim-colorizer.lua",
		cmd = "ColorizerToggle",
		config = function()
			require("colorizer").setup({
				"*",
				-- Disable for files that support colorProvider
				"!css",
				"!html",
				"!tsx",
			})
		end,
	},
}
