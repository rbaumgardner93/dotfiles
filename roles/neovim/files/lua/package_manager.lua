local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

local plugins = {
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
						require("ts_context_commentstring.internal").update_commentstring()
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
		event = "BufWinEnter",
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
		event = "VimEnter",
		config = function()
			require("rbaumgardner.whichkey")
		end,
	},
	{
		"mrjones2014/legendary.nvim",
		dependencies = { "stevearc/dressing.nvim" },
		config = function()
			require("legendary").setup({ which_key = { auto_register = true } })
		end,
	},
	"b0o/schemastore.nvim", -- simple access to json-language-server schema

	-- scheme evaluator
	{
		"Olical/conjure",
		ft = "scheme",
	},

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
	--completion plugins
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		config = function()
			require("rbaumgardner.nvim-cmp")
		end,
		dependencies = {
			"hrsh7th/cmp-buffer", -- Buffer completions
			"hrsh7th/cmp-path", -- Path completions
			"hrsh7th/cmp-nvim-lsp", -- LSP completions
			"hrsh7th/cmp-cmdline", -- Cmdline completions
			"hrsh7th/cmp-nvim-lua",
			"saadparwaiz1/cmp_luasnip", -- Snippet completions
			-- snippet plugins
			{ "L3MON4D3/LuaSnip", dependencies = { "friendly-snippets" } },
			"rafamadriz/friendly-snippets",
			"onsails/lspkind.nvim",
		},
	},

	--  LSP plugins
	{
		"neovim/nvim-lspconfig",
		event = { "BufRead", "BufWinEnter", "BufNewFile" },
		config = function()
			require("rbaumgardner.lsp").setup()
		end,
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"jose-elias-alvarez/null-ls.nvim", -- for formatters and linters
			{
				"SmiteshP/nvim-navic",
				config = function()
					require("rbaumgardner.navic")
				end,
			},
			{
				"j-hui/fidget.nvim",
				config = function()
					require("rbaumgardner.fidget")
				end,
			},
			"folke/neodev.nvim",
			"jose-elias-alvarez/typescript.nvim",
		},
	},
	{
		"glepnir/lspsaga.nvim",
		config = function()
			require("lspsaga").setup({})
		end,
	},

	{
		"stevearc/aerial.nvim",
		cmd = { "AerialToggle" },
		config = function()
			require("aerial").setup()
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
		event = "BufWinEnter",
		build = ":TSUpdate", -- We recommend updating the parsers on update
		config = function()
			require("rbaumgardner.treesitter")
		end,
		dependencies = {
			{ "nvim-treesitter/playground", cmd = { "TSPlaygroundToggle" } },
			{ "JoosepAlviste/nvim-ts-context-commentstring", event = "BufWinEnter" },
			"nvim-treesitter/nvim-treesitter-context",
		},
	},

	-- git
	{
		"lewis6991/gitsigns.nvim",
		event = "BufWinEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("rbaumgardner.gitsigns")
		end,
	},

	{ "sindrets/diffview.nvim", dependencies = "nvim-lua/plenary.nvim" },

	-- ThePrimeagen plugins
	{ "ThePrimeagen/harpoon", keys = { [[ <C-e> ]] } },

	-- tpope plugins
	"tpope/vim-vinegar",
	"tpope/vim-sleuth",
	{ "tpope/vim-surround", event = "InsertEnter" },
	{ "tpope/vim-fugitive", cmd = { "G" } },
	{ "tpope/vim-unimpaired", keys = { "[", "]" } },
	{ "tpope/vim-repeat", event = "InsertEnter" },
}

require("lazy").setup(plugins)
