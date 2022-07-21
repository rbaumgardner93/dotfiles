local fn = vim.fn

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
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use("kyazdani42/nvim-web-devicons")
	use({
		"mbbill/undotree",
		opt = true,
		cmd = { "UndotreeToggle" },
	})
	use({ "windwp/nvim-autopairs" }) -- autopairs integrates with both cmp and treesitter
	use({ "numToStr/Comment.nvim" }) -- easily comment stuff
	use({ "echasnovski/mini.nvim" })
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})
	use({ "goolord/alpha-nvim" })
	use("godlygeek/tabular")
	use("lewis6991/impatient.nvim")
	use({ "lukas-reineke/indent-blankline.nvim" })
	use({ "davidgranstrom/nvim-markdown-preview" })
	use({
		"j-hui/fidget.nvim",
		config = function()
			require("fidget").setup({
				text = {
					spinner = "dots_snake", -- animation shown when tasks are ongoing
					done = "✔", -- character shown when all tasks are complete
					commenced = "Started", -- message shown when task starts
					completed = "Completed", -- message shown when task completes
				},
			})
		end,
	})
	use({ "akinsho/toggleterm.nvim" })
	use({
		"kevinhwang91/nvim-ufo",
		requires = "kevinhwang91/promise-async",
	})
	use({ "folke/which-key.nvim" })
	use({
		"mrjones2014/legendary.nvim",
		config = function()
			require("legendary").setup({ auto_register_which_key = false })
		end,
		requires = { "stevearc/dressing.nvim" },
	})

	-- file Navigation
	use({ "tamago324/lir.nvim" })
	use({
		"tamago324/lir-git-status.nvim",
		config = function()
			require("lir.git_status").setup({
				show_ignored = false,
			})
		end,
	})
	use("Olical/conjure")

	-- colorschemes
	use("morhetz/gruvbox")
	use("folke/lsp-colors.nvim")
	use("sainnhe/sonokai")
	use("folke/tokyonight.nvim")
	use("norcalli/nvim-colorizer.lua")

	--completion plugins
	use({ "hrsh7th/nvim-cmp" }) -- The completion plugin
	use("hrsh7th/cmp-buffer") -- Buffer completions
	use("hrsh7th/cmp-path") -- Path completions
	use("hrsh7th/cmp-nvim-lsp") -- LSP completions
	use("hrsh7th/cmp-cmdline") -- Cmdlin completions
	use("hrsh7th/cmp-nvim-lua")
	use("saadparwaiz1/cmp_luasnip") -- Snippet completions

	-- snippet plugins
	use("L3MON4D3/LuaSnip")
	use("rafamadriz/friendly-snippets")

	--  LSP plugins
	use({
		"neovim/nvim-lspconfig",
		config = function()
			require("rbaumgardner.lsp").setup() -- enable LSP
		end,
	})
	use({
		"williamboman/nvim-lsp-installer",
		requires = {
			"neovim/nvim-lspconfig",
		},
	})
	use({
		"jose-elias-alvarez/null-ls.nvim", -- for formatters and linters
		requires = { "nvim-lua/plenary.nvim" },
	})
	use("creativenull/diagnosticls-configs-nvim")
	use("jose-elias-alvarez/nvim-lsp-ts-utils")
	use("folke/lua-dev.nvim")
	use({
		"SmiteshP/nvim-navic",
		requires = "neovim/nvim-lspconfig",
	})

	-- telescope requirements
	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope-github.nvim" },
			{ "nvim-telescope/telescope-packer.nvim" },
		},
	})
	use("nvim-telescope/telescope-fzy-native.nvim")
	use("nvim-telescope/telescope-file-browser.nvim")

	-- treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate", -- We recommend updating the parsers on update
	})
	use("nvim-treesitter/playground")

	-- git
	use({ "lewis6991/gitsigns.nvim" })

	-- ThePrimeagen plugins
	use("ThePrimeagen/harpoon")

	-- tpope plugins
	use("tpope/vim-surround")
	use("tpope/vim-fugitive")
	use("tpope/vim-unimpaired")

	-- debugger plugins
	use({
		"mfussenegger/nvim-dap",
		config = function()
			require("rbaumgardner.dap").setup()
		end,
	})
	use("Pocco81/DAPInstall.nvim")

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
