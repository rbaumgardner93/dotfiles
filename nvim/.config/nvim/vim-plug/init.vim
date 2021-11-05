" Download vim-plug if not already installed and install packages
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('$HOME/.local/share/nvim/site/autoload/plugged')
Plug 'ap/vim-css-color'
Plug 'bbenzikry/snazzybuddy.nvim'
Plug 'elijahmanor/export-to-vscode.nvim'
Plug 'glepnir/lspsaga.nvim'
Plug 'glepnir/dashboard-nvim'

" completion plugins
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'mattn/emmet-vim'

" LSP plugins
Plug 'neovim/nvim-lspconfig'
Plug 'onsails/lspkind-nvim'
Plug 'creativenull/diagnosticls-configs-nvim'

" snippet plugins
Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'

Plug 'itchyny/lightline.vim'
Plug 'JoosepAlviste/nvim-ts-context-commentstring'
Plug 'justinmk/vim-dirvish'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'mbbill/undotree'
Plug 'ntpeters/vim-better-whitespace'

" telescope requirements
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " We recommend updating the parsers on update
Plug 'nvim-treesitter/playground'

Plug 'roginfarrer/vim-dirvish-dovish', {'branch': 'main'}
Plug 'tjdevries/colorbuddy.nvim'

" ThePrimeagen plugins
Plug 'ThePrimeagen/harpoon'

" tpope plugins
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sleuth'

Plug 'sgur/vim-editorconfig'
call plug#end()
