" Download vim-plug if not already installed and install packages
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('$HOME/.local/share/nvim/site/autoload/plugged')
Plug 'ap/vim-css-color'
Plug 'bbenzikry/snazzybuddy.nvim'
Plug 'editorconfig/editorconfig-vim'
Plug 'glepnir/lspsaga.nvim'
Plug 'glepnir/dashboard-nvim'
Plug 'hrsh7th/nvim-compe'
Plug 'itchyny/lightline.vim'
Plug 'justinmk/vim-dirvish'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'machakann/vim-highlightedyank'
Plug 'mbbill/undotree'
Plug 'neovim/nvim-lspconfig'
Plug 'ntpeters/vim-better-whitespace'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " We recommend updating the parsers on update
Plug 'nvim-treesitter/playground'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'roginfarrer/vim-dirvish-dovish', {'branch': 'main'}
Plug 'tjdevries/colorbuddy.nvim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sleuth'
Plug 'windwp/nvim-autopairs'
call plug#end()
