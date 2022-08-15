local M = {}

M.setup = function()
	local download_packer = function()
		local fn = vim.fn

		if fn.input("Download packer.nvim? (y for yes)" ~= "y") then
			return
		end

		-- Automatically install packer
		local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
		if fn.empty(fn.glob(install_path)) > 0 then
			PACKER_BOOTSTRAP = fn.system({
				"git",
				"clone",
				"--depth",
				"1",
				"https://github.com/wbthomason/packer.nvim",
				install_path,
			})

			print(install_path)
			print("Installing packer close and reopen Neovim...")
			vim.cmd([[packadd packer.nvim]])
			vim.cmd([[qa]])
		end
	end

	local config = {
		display = {
			open_fn = function()
				return require("packer.util").float({ border = "rounded" })
			end,
		},
		profile = {
			enable = true,
			threshold = 0,
		},
	}

	-- My plugins here
	local plugins = function(use)
		use("wbthomason/packer.nvim") -- Have packer manage itself

		-- Performance
		use("lewis6991/impatient.nvim")

		-- Faster filetype.vim
		use("nathom/filetype.nvim")

		use({ "nvim-lua/plenary.nvim", module = "plenary" }) -- Useful lua functions used ny lots of plugins

		use({
			"mbbill/undotree",
			cmd = { "UndotreeToggle" },
		})

		-- autopairs integrates with both cmp and treesitter
		use({
			"windwp/nvim-autopairs",
			event = "InsertEnter",
			wants = "nvim-treesitter",
			module = { "nvim-autopairs.completion.cmp", "nvim-autopairs" },
			config = function()
				require("rbaumgardner.plugin.nvim-autopairs")
			end,
		})

		-- easily comment stuff
		use({
			"numToStr/Comment.nvim",
			keys = { "gc", "gcc", "gbc" },
			config = function()
				require("rbaumgardner.plugin.comment")
			end,
		})

		use({
			"echasnovski/mini.nvim",
			event = "BufReadPre",
			config = function()
				require("mini.trailspace").setup({ only_in_normal_buffers = true })
			end,
		})

		use({
			"nvim-lualine/lualine.nvim",
			opt = true,
			event = "BufReadPre",
			after = "nvim-treesitter",
			requires = { "kyazdani42/nvim-web-devicons", opt = true },
			config = function()
				require("rbaumgardner.plugin.lualine")
			end,
		})

		use({
			"goolord/alpha-nvim",
			config = function()
				require("rbaumgardner.plugin.alpha")
			end,
		})

		use({
			"godlygeek/tabular",
			event = "BufReadPre",
		})

		use({
			"lukas-reineke/indent-blankline.nvim",
			event = "BufReadPre",
			config = function()
				require("rbaumgardner.plugin.indent-blankline")
			end,
		})

		use({
			"davidgranstrom/nvim-markdown-preview",
			ft = { "markdown" },
		})

		use({
			"folke/which-key.nvim",
			event = "VimEnter",
			config = function()
				require("rbaumgardner.plugin.whichkey")
			end,
		})

		use({
			"mrjones2014/legendary.nvim",
			opt = true,
			keys = { "<C-p>" },
			module = { "legendary" },
			cmd = { "Legendary" },
			config = function()
				require("legendary").setup({ auto_register_which_key = false })
			end,
			requires = { "stevearc/dressing.nvim" },
		})

		-- simple access to json-language-server schema
		use({
			"b0o/schemastore.nvim",
			module = "schemastore",
		})

		-- scheme evaluator
		use({
			"Olical/conjure",
			ft = { "scheme" },
		})

		-- colorschemes
		use("folke/tokyonight.nvim")

		use({
			"norcalli/nvim-colorizer.lua",
			cmd = "ColorizerToggle",
			config = function()
				require("colorizer").setup()
			end,
		})

		--completion plugins
		use({
			"hrsh7th/nvim-cmp",
			opt = true,
			event = "InsertEnter",
			wants = {
				"lspkind.nvim",
			},
			config = function()
				require("rbaumgardner.plugin.nvim-cmp")
			end,
			requires = {
				"hrsh7th/cmp-buffer", -- Buffer completions
				"hrsh7th/cmp-path", -- Path completions
				"hrsh7th/cmp-nvim-lsp", -- LSP completions
				"hrsh7th/cmp-cmdline", -- Cmdline completions
				"hrsh7th/cmp-nvim-lua",
				"saadparwaiz1/cmp_luasnip", -- Snippet completions
				-- snippet plugins
				{
					"L3MON4D3/LuaSnip",
					wants = { "friendly-snippets" },
				},
				"rafamadriz/friendly-snippets",
				{ "onsails/lspkind.nvim", module = { "lspkind" } },
			},
		})

		--  LSP plugins
		use({
			"neovim/nvim-lspconfig",
			opt = true,
			event = { "BufRead", "BufWinEnter", "BufNewFile" },
			wants = {
				"mason.nvim",
				"mason-lspconfig.nvim",
				"null-ls.nvim",
				"nvim-navic",
				"nvim-ufo",
				"fidget.nvim",
				"lua-dev.nvim",
				"typescript.nvim",
			},
			config = function()
				require("rbaumgardner.plugin.lsp").setup()
			end,
			requires = {
				"williamboman/mason.nvim",
				"williamboman/mason-lspconfig.nvim",
				"jose-elias-alvarez/null-ls.nvim", -- for formatters and linters
				"SmiteshP/nvim-navic",
				{ "kevinhwang91/nvim-ufo", requires = { "kevinhwang91/promise-async" } },
				{
					"j-hui/fidget.nvim",
					config = function()
						require("rbaumgardner.plugin.fidget")
					end,
				},
				"folke/lua-dev.nvim",
				"jose-elias-alvarez/typescript.nvim",
			},
		})

		use({
			"glepnir/lspsaga.nvim",
			module = { "lspsaga.codeaction", "lspsaga.diagnostic" },
			config = function()
				require("lspsaga").init_lsp_saga()
			end,
		})

		-- telescope requirements
		use({
			"nvim-telescope/telescope.nvim",
			opt = true,
			cmd = { "Telescope" },
			module = { "telescope", "telescope.builtin" },
			keys = { "<leader>f" },
			wants = {
				"plenary.nvim",
				"popup.nvim",
				"telescope-fzy-native.nvim",
				"telescope-file-browser.nvim",
			},
			config = function()
				require("rbaumgardner.plugin.telescope")
			end,
			requires = {
				"nvim-lua/popup.nvim", -- An implementation of the Popup API from vim in Neovim
				"nvim-lua/plenary.nvim",
				"nvim-telescope/telescope-fzy-native.nvim",
				"nvim-telescope/telescope-file-browser.nvim",
			},
		})

		-- treesitter
		use({
			"nvim-treesitter/nvim-treesitter",
			event = "BufReadPre",
			run = ":TSUpdate", -- We recommend updating the parsers on update
			config = function()
				require("rbaumgardner.plugin.treesitter")
			end,
			requires = {
				{ "nvim-treesitter/playground", cmd = { "TSPlaygroundToggle" } },
				{ "JoosepAlviste/nvim-ts-context-commentstring", event = "BufReadPre" },
			},
		})

		-- git
		use({
			"lewis6991/gitsigns.nvim",
			event = "BufReadPre",
			wants = "plenary.nvim",
			requires = { "nvim-lua/plenary.nvim" },
			config = function()
				require("rbaumgardner.plugin.gitsigns")
			end,
		})

		-- ThePrimeagen plugins
		use({
			"ThePrimeagen/harpoon",
			keys = { [[ <C-e> ]] },
			module = { "harpoon", "harpoon.cmd-ui", "harpoon.mark", "harpoon.term" },
			wants = { "telescope.nvim" },
		})

		-- tpope plugins
		use("tpope/vim-vinegar")

		use({
			"tpope/vim-surround",
			event = "InsertEnter",
		})

		use({
			"tpope/vim-fugitive",
			cmd = { "G" },
		})

		use({
			"tpope/vim-unimpaired",
			event = "BufReadPre",
		})

		use({
			"tpope/vim-repeat",
			event = "InsertEnter",
		})
	end

	-- Use a protected call so we don't error out on first use
	local status_ok, packer = pcall(require, "packer")
	if not status_ok then
		download_packer()
	end

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end

	pcall(require, "impatient")

	-- Have packer use a popup window
	packer.init(config)

	-- Install your plugins here
	packer.startup(plugins)
end

return M
