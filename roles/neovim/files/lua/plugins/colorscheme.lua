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
}
