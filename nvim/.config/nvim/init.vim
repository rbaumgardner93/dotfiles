source $HOME/.config/nvim/plug-config/better-whitespace.vim
source $HOME/.config/nvim/plug-config/dashboard.vim
source $HOME/.config/nvim/plug-config/editor-config.vim
source $HOME/.config/nvim/plug-config/lightline.vim
source $HOME/.config/nvim/plug-config/prettier.vim

lua require('rbaumgardner.options')
lua require('rbaumgardner.plugins')
lua require('rbaumgardner.keymaps')
lua require('rbaumgardner.colorscheme')
lua require('rbaumgardner.lsp')
lua require('rbaumgardner.nvim-cmp')
lua require('rbaumgardner.telescope')
lua require('rbaumgardner.treesitter')


