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
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use 'kyazdani42/nvim-web-devicons'
  use 'mbbill/undotree'
  use 'windwp/nvim-autopairs' -- autopairs integrates with both cmp and treesitter
  use 'numToStr/Comment.nvim' -- easily comment stuff
  use 'mcauley-penney/tidy.nvim' -- clean up whitespace
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use {
    'goolord/alpha-nvim',
    config = function ()
      local dashboard = require('alpha.themes.dashboard')

      local function pick_color()
        local colors = { "String", "Identifier", "Keyword", "Number" }
        return colors[math.random(#colors)]
      end

      local function footer()
        local total_plugins = #vim.tbl_keys(packer_plugins)
        local datetime = os.date(" %m-%d-%Y  %H:%M:%S")
        return "\n"
          .. datetime
          .. "  "
          .. total_plugins
          .. " plugins"
          .. "  v"
          .. vim.version().major
          .. "."
          .. vim.version().minor
          .. "."
          .. vim.version().patch
      end

      dashboard.section.header.val = {
        [[     / | / /__  ____| |  / (_)___ ___   ]],
        [[    /  |/ / _ \/ __ \ | / / / __ `__ \  ]],
        [[   / /|  /  __/ /_/ / |/ / / / / / / /  ]],
        [[  /_/ |_/\___/\____/|___/_/_/ /_/ /_/   ]],
        [[                                        ]],
        [[         [ @rbaumgardner93 ]            ]],
        [[                                        ]]
      }

      dashboard.section.header.opts.hl = pick_color()

      dashboard.section.buttons.val = {
        dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
        dashboard.button("-", "  File Explorer"),
        dashboard.button("<Leader>ff", "  Find File"),
        dashboard.button("<Leader>fg", "  Find Word"),
        dashboard.button("<Leader>ps", "  Settings", ":e $MYVIMRC<CR>"),
        dashboard.button("<Leader>fo", "  Recent Files", ":Telescope oldfiles<CR>"),
        dashboard.button("q", "  Quit", ":qa<cr>"),
      }

      dashboard.section.footer.val = footer()
      dashboard.section.footer.opts.hl = "Constant"

      require('alpha').setup(dashboard.opts)
    end
  }

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
