local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end
local icons = require("icons")

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
