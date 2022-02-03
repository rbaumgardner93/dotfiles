vim.cmd([[
  augroup _general
    autocmd!
    autocmd FileType qf,help,man,lspinfo,fugitive nnoremap <silent> <buffer> q :close<CR>
    autocmd TextYankPost * silent! lua require('vim.highlight').on_yank({higroup="IncSearch", timeout=500})
    autocmd BufWinEnter * :set formatoptions-=cro
  augroup end

  augroup _git
    autocmd!
    autocmd FileType gitcommit setlocal spell
    autocmd FileType fugitive setlocal nofoldenable " Disable folding on fugitive buffer
  augroup end

  augroup _markdown
    autocmd!
    autocmd FileType markdown setlocal spell
  augroup end

  augroup _alpha
    autocmd!
    autocmd FileType alpha setlocal nofoldenable " Disable folding on alpha buffer
  augroup end

  augroup _treesitter
    autocmd!
    autocmd FileType tsplayground setlocal nofoldenable
  augroup end

  augroup _packer
    autocmd!
    autocmd BufWritePost */plugins/init.lua source <afile> | PackerSync
  augroup end
]])
