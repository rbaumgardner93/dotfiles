source $HOME/.config/nvim/keys/mappings.vim
source $HOME/.config/nvim/general/colorscheme.vim
source $HOME/.config/nvim/plug-config/better-whitespace.vim
source $HOME/.config/nvim/plug-config/dashboard.vim
source $HOME/.config/nvim/plug-config/dirvish.vim
source $HOME/.config/nvim/plug-config/editor-config.vim
source $HOME/.config/nvim/plug-config/eunech.vim
source $HOME/.config/nvim/plug-config/fugitive.vim
source $HOME/.config/nvim/plug-config/harpoon.vim
source $HOME/.config/nvim/plug-config/lightline.vim
source $HOME/.config/nvim/plug-config/prettier.vim
source $HOME/.config/nvim/plug-config/undotree.vim
source $HOME/.config/nvim/plug-config/telescope.vim

lua require('rbaumgardner.options')
lua require('rbaumgardner.plugins')
lua require('rbaumgardner.lsp')
lua require('rbaumgardner.nvim-cmp')
lua require('rbaumgardner.treesitter')


