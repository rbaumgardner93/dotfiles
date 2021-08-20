nnoremap <leader>pl :Vex<CR>
nnoremap <leader><CR> :source $MYVIMRC<CR>
nnoremap <C-n> :cnext<CR>
nnoremap <C-p> :cprev<CR>
nnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG
nnoremap <CR> o<Esc>
" Fast saving
nnoremap <leader>w :w!<CR>

" TAB in normal mode will move to next/prev text buffer
nnoremap <TAB> :bnext<CR>
nnoremap <S-TAB> :bprev<CR>

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <leader>\ :vsp<CR>
nnoremap <leader>- :sp<CR>

" from ThePrimeagen (https://www.youtube.com/watch?v=hSHATqh8svM)
" Highlight to the end of the line
nnoremap Y y$
" Keep it centered
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" Undo break points
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

" Jumplist mutations
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

" Moving test
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==
" Move highlighted text up/down one line
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
inoremap <C-j> <esc>:m .+1<CR>==
inoremap <C-k> <esc>:m .-2<CR>==

vnoremap <leader>p "_dP
vnoremap <leader>y "+y


" Better tabbing
vnoremap < <gv
vnoremap > >gv

" Escape terminal mode
tnoremap <Esc> <C-\><C-n>
tnoremap ZZ <C-\><C-n>
nnoremap <leader>ot :terminal<CR>

" https://stackoverflow.com/questions/7236315/how-to-list-the-file-paths-of-all-buffers-open-in-vim/7236867#7236867
function! OpenBuffersInVSCode()
  silent execute "!code " . join(map(filter(range(0,bufnr('$')), 'buflisted(v:val)'), 'fnamemodify(bufname(v:val), ":p")'))
endfunction
nnoremap <silent> <leader>code :call OpenBuffersInVSCode()<CR>

