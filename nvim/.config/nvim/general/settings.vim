let mapleader = " "

set path+=** " search down into subfolders (provides tab-completion) for file related tasks
set wildmenu " display all matching files when we tab complete
set wildignore+=**/node_modules/* " ignore node_modules
set number " show line numbers
set ruler " Show the cursor position all the time
set scrolloff=8 " Offset scrolling up or down by 8 lines
set relativenumber " Set numbers based off of cursor position
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
set laststatus=0 " Always show status line
set nowrap " Don't wrap long lines
set colorcolumn=80 " Show bar at 80 characters
set laststatus=2 " Recommended from lightline
set noshowmode " Recommended from lightline
set signcolumn=yes " Keep column widht consistent when using plugins with gutter icons
set colorcolumn=80 " Make it obvious where 80 characters is
" from https://github.com/amix/vimrc/blob/master/vimrcs/basic.vim
set lazyredraw " Don't redraw whle executing macros (good performance config)
set autoread " Set to auto read when a file is changed from the outside

let g:netrw_liststyle = 3

" undotree
if has("persistent_undo")
	set undodir="$HOME/.undodir"
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
