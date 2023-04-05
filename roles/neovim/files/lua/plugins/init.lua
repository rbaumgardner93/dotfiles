return {
	"nathom/filetype.nvim", -- Faster filetype.vim
	"nvim-lua/plenary.nvim", -- Useful lua functions used ny lots of plugins
	{ "mbbill/undotree", cmd = "UndotreeToggle" },
	-- comments
	{ "JoosepAlviste/nvim-ts-context-commentstring", lazy = true },
	{
		"echasnovski/mini.nvim",
		event = "VeryLazy",
		config = function()
			require("mini.trailspace").setup({ only_in_normal_buffers = true })
			require("mini.comment").setup({
				hooks = {
					pre = function()
						require("ts_context_commentstring.internal").update_commentstring({})
					end,
				},
			})
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		dependencies = { "kyazdani42/nvim-web-devicons" },
		config = function()
			require("rbaumgardner.lualine")
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "BufReadPost",
		config = function()
			require("rbaumgardner.indent-blankline")
		end,
	},
	{
		"ellisonleao/glow.nvim",
		ft = "markdown",
		config = function()
			require("rbaumgardner.glow")
		end,
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		config = function()
			require("rbaumgardner.whichkey")
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
	"b0o/schemastore.nvim", -- simple access to json-language-server schema

	-- scheme evaluator
	{ "Olical/conjure", ft = "scheme" },

	-- colorschemes
	"folke/tokyonight.nvim",
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
	-- telescope requirements
	{
		"nvim-telescope/telescope.nvim",
		cmd = { "Telescope" },
		keys = { "<leader>f" },
		config = function()
			require("rbaumgardner.telescope")
		end,
		dependencies = {
			"nvim-lua/popup.nvim", -- An implementation of the Popup API from vim in Neovim
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
				cond = vim.fn.executable("make") == 1,
			},
			"nvim-telescope/telescope-file-browser.nvim",
			{
				"princejoogie/dir-telescope.nvim",
				config = function()
					require("dir-telescope").setup({
						hidden = true,
						respect_gitignore = true,
					})
				end,
			},
		},
	},

	-- treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		event = "BufReadPost",
		build = ":TSUpdate", -- We recommend updating the parsers on update
		keys = {
			{ "<c-space>", desc = "Increment selection" },
			{ "<bs>", desc = "Shrink selection", mode = "x" },
		},
		config = function()
			require("rbaumgardner.treesitter")
		end,
		dependencies = {
			{ "nvim-treesitter/playground", cmd = { "TSPlaygroundToggle" } },
			"nvim-treesitter/nvim-treesitter-context",
		},
	},

	-- git
	{
		"lewis6991/gitsigns.nvim",
		event = "BufReadPre",
		config = function()
			require("rbaumgardner.gitsigns")
		end,
	},
	-- ThePrimeagen plugins
	{ "ThePrimeagen/harpoon", keys = { [[ <C-e> ]] } },

	-- tpope plugins
	"tpope/vim-vinegar",
	"tpope/vim-sleuth",
	{ "tpope/vim-surround", event = "InsertEnter" },
	{ "tpope/vim-fugitive", event = "VeryLazy" },
	{ "tpope/vim-unimpaired", keys = { "[", "]" } },
	{ "tpope/vim-repeat", event = "InsertEnter" },
}
