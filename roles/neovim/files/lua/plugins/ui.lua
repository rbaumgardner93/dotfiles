return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		config = function()
			require("catppuccin").setup({
				transparent_background = true,
			})

			vim.cmd([[
				colorscheme catppuccin
				highlight ColorColumn guibg=#292e42
			]])
		end,
		priority = 1000,
	},
	{
		"folke/tokyonight.nvim",
		enabled = false,
		config = function()
			require("tokyonight").setup({
				style = "night",
				transparent = true,
				styles = {
					functions = "italic",
					-- Background styles. Can be "dark", "transparent", or "normal"
					sidebars = "transparent",
					floats = "transparent",
				},
				sidebars = { "qf", "vista_kind", "terminal", "packer" },
			})

			vim.cmd([[
				colorscheme tokyonight
				highlight ColorColumn guibg=#292e42
			]])
		end,
	},
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
		"stevearc/dressing.nvim",
		event = "VeryLazy",
		init = function()
			---@diagnostic disable-next-line: duplicate-set-field
			vim.ui.select = function(...)
				require("lazy").load({ plugins = { "dressing.nvim" } })
				return vim.ui.select(...)
			end

			---@diagnostic disable-next-line: duplicate-set-field
			vim.ui.input = function(...)
				require("lazy").load({ plugins = { "dressing.nvim" } })
				return vim.ui.select(...)
			end
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
	{
		"mrshmllow/document-color.nvim",
		config = function()
			require("document-color").setup({
				mode = "background",
			})
		end,
	},
}
