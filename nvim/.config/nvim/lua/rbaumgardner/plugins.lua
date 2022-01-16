local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use 'glepnir/dashboard-nvim'
  use 'itchyny/lightline.vim'
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use 'kyazdani42/nvim-web-devicons'
  use 'mbbill/undotree'
  use 'ntpeters/vim-better-whitespace'
  use 'sgur/vim-editorconfig'

  -- file Navigation
  use 'justinmk/vim-dirvish'
  use { 'roginfarrer/vim-dirvish-dovish', branch ='main' }

  -- colorschemes
  use 'bbenzikry/snazzybuddy.nvim'
  use 'morhetz/gruvbox'

  --completion plugins
  use 'hrsh7th/nvim-cmp' -- The completion plugin
  use 'hrsh7th/cmp-buffer' -- Buffer completions
  use 'hrsh7th/cmp-path' -- Path completions
  use 'hrsh7th/cmp-nvim-lsp' -- LSP compltions
  use 'hrsh7th/cmp-cmdline' -- Cmdlin completions
  use 'hrsh7th/cmp-nvim-lua'
  use 'saadparwaiz1/cmp_luasnip' -- Snippet completions

  -- snippet plugins
  use 'L3MON4D3/LuaSnip'
  use 'rafamadriz/friendly-snippets'

  --  LSP plugins
  use 'neovim/nvim-lspconfig' -- enable LSP
  use 'williamboman/nvim-lsp-installer' -- simple to use language server istaller
  use 'jose-elias-alvarez/null-ls.nvim' -- for formatters and linters
  use 'onsails/lspkind-nvim'
  use 'creativenull/diagnosticls-configs-nvim'
  use 'glepnir/lspsaga.nvim'

  -- telescope requirements
  use { 'nvim-telescope/telescope.nvim', requires = { { 'nvim-lua/plenary.nvim' } } }
  use 'nvim-telescope/telescope-fzy-native.nvim'
  use { "nvim-telescope/telescope-file-browser.nvim" }

  -- treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' } -- We recommend updating the parsers on update
  use 'nvim-treesitter/playground'

  -- tj plugins
  use 'tjdevries/colorbuddy.nvim'
  use 'tjdevries/gruvbuddy.nvim'

  -- ThePrimeagen plugins
  use 'ThePrimeagen/harpoon'

  -- tpope plugins
  use 'tpope/vim-commentary'
  use 'tpope/vim-surround'
  use 'tpope/vim-eunuch'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-sleuth'

   -- Automatically set up your configuration after cloning packer.nvim
   -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

