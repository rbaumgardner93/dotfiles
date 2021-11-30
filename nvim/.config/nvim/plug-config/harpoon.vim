nnoremap <leader>a :lua require("harpoon.mark").add_file()<CR>
nnoremap <C-e> :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <leader>qm :lua require("harpoon.cmd-ui").toggle_quick_menu()<CR>

nnoremap <leader>h :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <leader>j :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <leader>k :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <leader>l :lua require("harpoon.ui").nav_file(4)<CR>
