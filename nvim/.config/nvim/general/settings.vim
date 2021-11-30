let mapleader = " "

set path+=** " search down into subfolders (provides tab-completion) for file related tasks
set wildmenu " display all matching files when we tab complete
set wildignorecase " tab file completion is case insensitive
set wildignore+=**/node_modules/* " ignore node_modules
set number " show line numbers
set ruler " Show the cursor position all the time
set scrolloff=8 " Offset scrolling up or down by 8 lines
set relativenumber " Set numbers based off of cursor position
set noexpandtab " Use tab character instead of spaces
set shiftwidth=0 " Always use tab character
set tabstop=4 " Use 4 spaces as tab character
set autoindent " Good autoindent
set smartindent " Makes indenting smart
set smarttab " Makes tabbing smarter will realize you have 2 vs 4
set nohlsearch " Remove highlighting after search
set incsearch " Highlight as you search for a word
set ignorecase " Ignore case for searching
set smartcase " ignore case when the pattern contains lowercase letters only
set background=dark " tell vim what that background color should be
set completeopt=menuone,noselect " Recommended by nvim-compe
set cmdheight=2 " More space for displaying messages
set updatetime=300 " Faster completion
set timeoutlen=500 " Default timeoutlen is 1000ms
set mouse=a " Enable mouse
set nowrap " Don't wrap long lines
set laststatus=2 " Recommended from lightline
set noshowmode " Recommended from lightline
set signcolumn=yes " Keep column widht consistent when using plugins with gutter icons
set colorcolumn=80 " Make it obvious where 80 characters is
" from https://github.com/amix/vimrc/blob/master/vimrcs/basic.vim
set lazyredraw " Don't redraw whle executing macros (good performance config)
set autoread " Set to auto read when a file is changed from the outside
set list
set listchars=tab:»\ ,nbsp:•
set noswapfile

" folds credit to wincent: https://github.com/wincent/wincent/blob/c7edb6d6902d053af4d9e3928cfce281b7e625a6/aspects/nvim/files/.vim/plugin/settings.vim#L39
if has('folding')
  if has('windows')
    set fillchars=diff:∙                " BULLET OPERATOR (U+2219, UTF-8: E2 88 99)
    set fillchars+=fold:·               " MIDDLE DOT (U+00B7, UTF-8: C2 B7)
    set fillchars+=vert:┃               " BOX DRAWINGS HEAVY VERTICAL (U+2503, UTF-8: E2 94 83)
  endif

  set foldmethod=indent                 " not as cool as syntax, but faster
 " set foldlevelstart=1                 " start folded
   set foldlevelstart=99               	" start unfolded
  set foldtext=Foldtext()
endif

let g:netrw_liststyle = 3

" undotree
if has("persistent_undo")
	set undodir=$HOME/.undodir
	set undofile
endif

if (has("termguicolors"))
	set termguicolors " enable true colors support
endif

augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
augroup END

command! MakeTags !ctags -R .

" credit to wincent: https://github.com/wincent/wincent/blob/e64d036e0fda2262780a5145974c27d0a779b8b3/aspects/nvim/files/.vim/autoload/wincent/settings.vim
scriptencoding utf-8

let s:middot='·'
let s:raquo='»'
let s:small_l='ℓ'

" Override default `foldtext()`, which produces something like:
"
"   +---  2 lines: source $HOME/.config/nvim/pack/bundle/opt/vim-pathogen/autoload/pathogen.vim--------------------------------
"
" Instead returning:
"
"   »··[2ℓ]··: source $HOME/.config/nvim/pack/bundle/opt/vim-pathogen/autoload/pathogen.vim···································
"
function! Foldtext() abort
  let l:lines='[' . (v:foldend - v:foldstart + 1) . s:small_l . ']'
  let l:first=substitute(getline(v:foldstart), '\v *', '', '')
  let l:dashes=substitute(v:folddashes, '-', s:middot, 'g')
  return s:raquo . s:middot . s:middot . l:lines . l:dashes . ': ' . l:first
endfunction
