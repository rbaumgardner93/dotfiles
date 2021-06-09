call plug#begin('~/.config/nvim/autoload/plugged')
Plug 'ap/vim-css-color'
Plug 'connorholyday/vim-snazzy'
Plug 'hrsh7th/nvim-compe'
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'machakann/vim-highlightedyank'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'preservim/nerdtree'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
call plug#end()
