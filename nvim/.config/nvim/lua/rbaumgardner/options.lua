local home = vim.env.HOME
local config = home .. "/.config/nvim"

-- TODO Does not seem to be feature to leave comments alone
-- https://github.com/JohnnyMorganz/StyLua/issues/252
-- stylua: ignore start

-- disabled netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- vim.g.netrw_liststyle = 3

local options = {
	wildmenu = true,                         -- display all matching files when we tab complete
	wildignorecase = true,                   -- tab file completion is case insensitive
	wildignore = { "*/node_modules/*" },     -- ignore node_modules
	number = true,                           -- show line numbers
	ruler = true,                            -- Show the cursor position all the time
	scrolloff = 8,                           -- Offset scrolling up or down by 8 lines
	relativenumber = true,                   -- Set numbers based off of cursor position
	expandtab = false,                       -- Use tab character instead of spaces
	shiftwidth = 0,                          -- Always use tab character
	tabstop = 4,                             -- Use 4 spaces as tab character
	autoindent = true,                       -- Good autoindent
	smartindent = true,                      -- Makes indenting smart
	smarttab = true,                         -- Makes tabbing smarter will realize you have 2 vs 4
	hlsearch = false,                        -- Remove highlighting after search
	incsearch = true,                        -- Highlight as you search for a word
	ignorecase = true,                       -- Ignore case for searching
	smartcase = true,                        -- ignore case when the pattern contains lowercase letters only
	background = "dark",                     -- tell vim what that background color should be
	completeopt = { "menuone", "noselect" }, -- Recommended by nvim-compe
	cmdheight = 2,                           -- More space for displaying messages
	updatetime = 300,                        -- Faster completion
	timeoutlen = 500,                        -- Default timeoutlen is 1000ms
	mouse = "a",                             -- Enable mouse
	wrap = false,                            -- Don't wrap long lines
	laststatus = 3,                        	 -- Global status line
	showmode = false,                        -- Recommended from lightline
	signcolumn = "yes",                      -- Keep column widht consistent when using plugins with gutter icons
	colorcolumn = "80",                      -- Make it obvious where 80 characters is
	list = true,                             -- Allows the additon of whitespace characters
	listchars = { tab = "» ", nbsp = "•" },  -- Whitespace characters
	swapfile = false,                        -- Creates a swapfile
	termguicolors = true,                    -- set term gui colors (most terminals support this)
	path = ".,**",                           -- search down into subfolders (provides tab-completion) for file related tasks

	-- undotree
	undofile = true,                         -- enable persistent undo
	undodir = config .. '/.undodir',         -- location of undofiles

	                                         -- https://github.com/amix/vimrc/blob/master/vimrcs/basic.vim
	autoread = true,                         -- Set to auto read when a file is changed from the outside
	lazyredraw = true,                       -- Don't redraw whle executing macros (good performance config)

	 -- folds credit to wincent: https://github.com/wincent/wincent/blob/c7edb6d6902d053af4d9e3928cfce281b7e625a6/aspects/nvim/files/.vim/plugin/settings.vim#L39
	fillchars = {
		diff = "∙",
		fold = "∙",
		vert = "┃",
	},
	foldmethod = "indent",
	foldlevel = 1,
}
-- stylua: ignore end
vim.opt.iskeyword:append("-")

for k, v in pairs(options) do
	vim.opt[k] = v
end
