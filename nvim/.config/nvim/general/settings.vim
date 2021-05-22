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
set list
set listchars=nbsp:_,tab:\|\->,space:•,trail:•,extends:>,precedes:< " Update neovim defaults for whitespace characters
set background=dark " tell vim what that background color should be
set nobackup " Recommended by coc
set nowritebackup " Recommended by coc
set cmdheight=2 " More space for displaying messages
set updatetime=300 " Faster completion
set timeoutlen=500 " Default timeoutlen is 1000ms
set clipboard=unnamedplus " Copy paste between vim and everything else
set mouse=a " Enable mouse
set laststatus=0 " Always show status line

if (has("termguicolors"))
	set termguicolors " enable true colors support
endif

