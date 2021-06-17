nnoremap <leader>pl :Vex<CR>
nnoremap <leader><CR> :source $MYVIMRC<CR>
nnoremap <C-j> :cnext<CR>
nnoremap <C-k> :cprev<CR>
nnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG

nnoremap <CR> o<Esc>

" TAB in normal mode will move to next/prev text buffer
nnoremap <TAB> :bnext<CR>
nnoremap <S-TAB> :bprev<CR>

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

vnoremap <leader>p "_dP
vnoremap <leader>y "+y

" Move highlighted text up/down one line
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Better tabbing
vnoremap < <gv
vnoremap > >gv

