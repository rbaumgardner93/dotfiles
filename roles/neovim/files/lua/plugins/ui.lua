return {
	"folke/tokyonight.nvim",
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		dependencies = { "kyazdani42/nvim-web-devicons" },
		config = function()
			local icons = require("icons")
			local lualine = require("lualine")

			lualine.setup({
				options = {
					theme = "auto",
					disabled_filetypes = { "alpha", "dashboard", "lazy" },
					globalstatus = true,
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch" },
					lualine_c = {
						{
							"diagnostics",
							symbols = {
								error = icons.diagnostics.Error,
								warn = icons.diagnostics.Warning,
								info = icons.diagnostics.Information,
								hint = icons.diagnostics.Information,
							},
						},
						"filename",
						{
							function()
								return require("nvim-navic").get_location()
							end,
							cond = function()
								return package.loaded["nvim-navic"] and require("nvim-navic").is_available()
							end,
						},
					},
					lualine_x = { "encoding", "filetype", "fileformat" },
					lualine_y = {
						{ "progress", separator = "", padding = { left = 1, right = 0 } },
						{ "location", padding = { left = 0, right = 1 } },
					},
					lualine_z = {
						function()
							return " " .. os.date("%R")
						end,
					},
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = { "filename" },
					lualine_x = { "location" },
					lualine_y = {},
					lualine_z = {},
				},
				tabline = {},
				extensions = { "aerial", "fugitive", "quickfix" },
			})
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
