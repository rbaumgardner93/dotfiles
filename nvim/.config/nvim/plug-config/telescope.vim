lua << EOF
require('telescope').setup{}
EOF

" Find files using Telescope command-line sugar.
nnoremap <leader>ff :lua require'telescope.builtin'.find_files{ hidden = true }<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <Leader>fgs :lua require'telescope.builtin'.git_status{}<cr>

