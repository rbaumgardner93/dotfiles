local home = vim.env.HOME
local config = home .. "/.config/nvim"

-- TODO Does not seem to be feature to leave comments alone
-- https://github.com/JohnnyMorganz/StyLua/issues/252
-- stylua: ignore start

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.path:append { "**" }                                        -- search down into subfolders (provides tab-completion) for file related tasks
vim.opt.wildignore:append { "*/node_modules/*" }                    -- ignore node_modules
vim.opt.wildignorecase = true                                       -- tab file completion is case insensitive

vim.opt.number = true                                               -- show line numbers
vim.opt.relativenumber = true                                       -- Set numbers based off of cursor position

vim.opt.ruler = true                                                -- Show the cursor position all the time
vim.opt.scrolloff = 8                                               -- Offset scrolling up or down by 8 lines
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"                                          -- Keep column width consistent when using plugins with gutter icons
vim.opt.colorcolumn = "80"                                          -- Make it obvious where 80 characters is

vim.opt.tabstop = 4                                                 -- Use 4 spaces as tab character
vim.opt.autoindent = true                                           -- Good autoindent
vim.opt.smartindent = true                                          -- Makes indenting smart
vim.opt.smarttab = true                                             -- Makes tabbing smarter will realize you have 2 vs 4

vim.opt.hlsearch = false                                            -- Remove highlighting after search
vim.opt.incsearch = true                                            -- Highlight as you search for a word
vim.opt.ignorecase = true                                           -- Ignore case for searching
vim.opt.smartcase = true                                            -- ignore case when the pattern contains lowercase letters only
vim.opt.inccommand = "split"                                        -- shows partial off-screen results in a preview window.
vim.opt.iskeyword:append("-")

vim.opt.termguicolors = true                                        -- set term gui colors (most terminals support this)
vim.opt.background = "dark"                                         -- tell vim what that background color should be
vim.opt.completeopt = { "menuone", "noselect" }                     -- Recommended by nvim-compe
vim.opt.splitright = true                                           -- open vertical splits to the right of the current window
vim.opt.winbar = "%= %{%v:lua.require'nvim-navic'.get_location()%}"

vim.opt.updatetime = 300                                            -- Faster completion
vim.opt.timeoutlen = 500                                            -- Default timeoutlen is 1000ms
vim.opt.mouse = "n"                                                 -- Enable mouse for normal mode
vim.opt.wrap = false                                                -- Don't wrap long lines
vim.opt.laststatus = 3                                              -- Global status line

vim.opt.list = true                                                 -- Allows the additon of whitespace characters
vim.opt.listchars = {
	tab = "» ",
	nbsp = "•",
} -- Whitespace characters

vim.opt.swapfile = false                                            -- No swapfile
vim.opt.belloff = "all"                                             -- no more bells please
vim.opt.shada = { "!", "'1000", "<50", "s10", "h" }

-- undotree
vim.opt.undofile = true                                             -- enable persistent undo
vim.opt.undodir = config .. "/.undodir"                             -- location of undofiles

                                                                    -- https://github.com/amix/vimrc/blob/master/vimrcs/basic.vim
vim.opt.autoread = true                                             -- Set to auto read when a file is changed from the outside
vim.opt.lazyredraw = true                                           -- Don't redraw whle executing macros (good performance config)

vim.opt.foldlevelstart = 99                                         -- start unfolded
vim.opt.foldmethod = "indent"                                       -- lines with equal indent form a fold.
vim.opt.backupcopy = "yes"
