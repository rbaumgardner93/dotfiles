lua << EOF

local actions = require("telescope.actions")

require("telescope").setup({
  pickers = {
    buffers = {
      show_all_buffers = true,
      sort_lastused = true,
      mappings = {
        i = {
          ["<C-x>"] = "delete_buffer",
          ["<C-q>"] = actions.send_to_qflist
        }
      },
      extensions = {
        fzy_native = {
          override_generic_sorter = false,
          override_file_sorter = true
        }
      }
    }
  }
})

require("telescope").load_extension("fzy_native")
EOF

" Find files using Telescope command-line sugar.
nnoremap <leader>ff :lua require('telescope.builtin').find_files{ hidden = true }<CR>
nnoremap <leader>fs :lua require('telescope.builtin').file_browser{ cwd = vim.fn.expand('%:p:h') }<CR>
nnoremap <leader>fg :lua require('telescope.builtin').live_grep()<CR>
nnoremap <leader>fb  :lua require('telescope.builtin').buffers()<CR>
nnoremap <leader>fgc :lua require('telescope.builtin').git_commits()<CR>
nnoremap <leader>fgs :lua require('telescope.builtin').git_status()<CR>
nnoremap <leader>fgb :lua require('telescope.builtin').git_branches()<CR>
nnoremap <leader>fst :lua require('telescope.builtin').git_stash()<CR>
nnoremap <leader>fh :lua require('telescope.builtin').help_tags()<CR>
nnoremap <leader>tr :Telescope resume<CR>
