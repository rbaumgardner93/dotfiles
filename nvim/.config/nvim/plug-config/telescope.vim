lua << EOF
require('telescope').setup{}
EOF

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd> lua require'telescope.builtin'.find_files{ hidden = true }<cr>
nnoremap <leader>fs <cmd> lua require'telescope.builtin'.file_browser{ cwd = vim.fn.expand('%:p:h') }<cr>
nnoremap <leader>fg <cmd> lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd> lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fgs <cmd> lua require'telescope.builtin'.git_status{}<cr>
nnoremap <leader>fgb <cmd> lua require'telescope.builtin'.git_branches{}<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

