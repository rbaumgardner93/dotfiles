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
	--completion plugins
	{
		"hrsh7th/nvim-cmp",
		version = "*",
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
			"onsails/lspkind.nvim",
		},
	},
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"rafamadriz/friendly-snippets",
			config = function()
				require("luasnip/loaders/from_vscode").lazy_load()
			end,
		},
		opts = {
			history = true,
			delete_check_events = "TextChanged",
		},
		keys = {
			{
				"<tab>",
				function()
					return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
				end,
				expr = true,
				silent = true,
				mode = "i",
			},
			{
				"<tab>",
				function()
					require("luasnip").jump(1)
				end,
				mode = "s",
			},
			{
				"<s-tab>",
				function()
					require("luasnip").jump(-1)
				end,
				mode = "s",
			},
		},
	},

	--  LSP plugins
	{
		"neovim/nvim-lspconfig",
		event = "BufReadPre",
		config = function()
			require("rbaumgardner.lsp").setup()
		end,
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
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
		"williamboman/mason.nvim",
		cmd = "Mason",
		keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
	},
	{
		"stevearc/aerial.nvim",
		cmd = { "AerialToggle" },
		config = function()
			require("aerial").setup()
		end,
	},

	-- formatters
	{
		"jose-elias-alvarez/null-ls.nvim",
		event = "BufReadPre",
		dependencies = { "mason.nvim" },
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
