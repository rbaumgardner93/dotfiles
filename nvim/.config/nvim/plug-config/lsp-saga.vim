lua << EOF
	local saga = require 'lspsaga'
	saga.init_lsp_saga()
EOF

" lsp provider to find the cursor word definition and reference
nnoremap <silent> gh :Lspsaga lsp_finder<CR>
" code action
nnoremap <silent><leader>ca :Lspsaga code_action<CR>
vnoremap <silent><leader>ca :<C-U>Lspsaga range_code_action<CR>
" show hover doc
nnoremap <silent>K :Lspsaga hover_doc<CR>
" scroll down hover doc or scroll in definition preview
nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
" scroll up hover doc
nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>
" show signature help
nnoremap <silent> gs :Lspsaga signature_help<CR>
" rename
nnoremap <silent>rn :Lspsaga rename<CR>
" diagnostics
nnoremap <silent> <leader>ld :Lspsaga show_line_diagnostics<CR>
nnoremap <silent> [e :Lspsaga diagnostic_jump_next<CR>
nnoremap <silent> ]e :Lspsaga diagnostic_jump_prev<CR>
" float terminal also you can pass the cli command in open_float_terminal
nnoremap <silent> <A-d> :Lspsaga open_floaterm<CR>
tnoremap <silent> <A-d> <C-\><C-n>:Lspsaga close_floaterm<CR>
