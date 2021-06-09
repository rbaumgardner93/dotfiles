let mapleader = " "

set number " show line numbers
set ruler " Show the cursor position all the time
set scrolloff=8 " Offset scrolling up or down by 8 lines
set relativenumber " Set numbers based off of cursor position
set tabstop=4 " Insert 4 spaces for a tab
set shiftwidth=4 " Change number of space characters inserted for indentation
set noexpandtab " Don't turn tabs to spaces
set autoindent " Good autoindent
set smartindent " Makes indenting smart
set smarttab " Makes tabbing smarter will realize you have 2 vs 4
set nohlsearch " Remove highlighting after search
set incsearch " Highlight as you search for a word
set ignorecase " Ignore case for searching
set smartcase " ignore case when the pattern contains lowercase letters only
set list
set listchars=nbsp:_,tab:\|\->,space:•,trail:•,extends:>,precedes:< " Update neovim defaults for whitespace characters
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

if (has("termguicolors"))
	set termguicolors " enable true colors support
endif

if exists('+colorcolumn')
  " Highlight up to 255 columns (this is the current Vim max) beyond 'textwidth'
  let &l:colorcolumn='+' . join(range(0, 254), ',+')
endif
