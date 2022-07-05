local nmap = require("rbaumgardner.utils.keymap").nmap
local vmap = require("rbaumgardner.utils.keymap").vmap
local imap = require("rbaumgardner.utils.keymap").imap
local tmap = require("rbaumgardner.utils.keymap").tmap

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal --
-- Better window navigation
nmap({ "<C-h>", "<C-w>h" })
nmap({ "<C-j>", "<C-w>j" })
nmap({ "<C-k>", "<C-w>k" })
nmap({ "<C-l>", "<C-w>l" })

nmap({ "<leader>\\", ":vsp<CR>" })
nmap({ "<leader>-", ":sp<CR>" })

-- Resize with arrows
nmap({ "<C-Up>", ":resize +2<CR>" })
nmap({ "<C-Down>", ":resize -2<CR>" })
nmap({ "<C-Left>", ":vertical resize -2<CR>" })
nmap({ "<C-Right>", ":vertical resize +2<CR>" })

nmap({ "<leader>y", '"+y' })
nmap({ "<leader>Y", '"gg+yG' })

nmap({ "<CR>", "o<Esc>" })

-- Fast saving
nmap({ "<leader>w", ":w!<CR>" })

-- Fast sourcing
nmap({ "<leader><CR>", ":luafile %<CR>" })

-- from ThePrimeagen (https://www.youtube.com/watch?v=hSHATqh8svM)
-- Highlight to the end of the line
nmap({ "Y", "y$" })

-- Keep it centered
nmap({ "n", "nzzzv" })
nmap({ "N", "Nzzzv" })
nmap({ "J", "mzJ`z" })

-- Moving text
nmap({ "<leader>j", ":m .+1<CR>==" })
nmap({ "<leader>k", ":m .-2<CR>==" })

nmap({ "<leader>ot", ":terminal<CR>" })

-- Plugins
-- Fugitive
nmap({ "<leader>gs", ":G<CR>" })
nmap({ "<leader>gj", ":diffget //3<CR>" })
nmap({ "<leader>gf", ":diffget //2<CR>" })
nmap({ "<leader>gd", ":Git diff<CR>" })
nmap({ "<leader>gb", ":Git blame<CR>" })

-- Harpoon
nmap({ "<leader>a", "<cmd>lua require('harpoon.mark').add_file()<CR>" })
nmap({ "<C-e>", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>" })
nmap({ "<leader>qm", "<cmd>lua require('harpoon.cmd-ui').toggle_quick_menu()<CR>" })

nmap({ "<leader>h", "<cmd>lua require('harpoon.ui').nav_file(1)<CR>" })
nmap({ "<leader>j", "<cmd>lua require('harpoon.ui').nav_file(2)<CR>" })
nmap({ "<leader>k", "<cmd>lua require('harpoon.ui').nav_file(3)<CR>" })
nmap({ "<leader>l", "<cmd>lua require('harpoon.ui').nav_file(4)<CR>" })

-- Undotree
nmap({ "<leader>ut", ":UndotreeToggle<CR>" })

-- Glow
nmap({ "<leader>md", ":Glow<CR>" })
nmap({ "gx", ":!open <C-r><C-a><CR>" })

-- ufo
nmap({ "zR", "<cmd>lua require('ufo').openAllFolds()<CR>" })
nmap({ "zM", "<cmd>lua require('ufo').closeAllFolds()<CR>" })

-- Visual --
vmap({ "J", ":m '>+1<CR>gv=gv" })
vmap({ "K", ":m '<-2<CR>gv=gv" })

vmap({ "<leader>p", "_dP" })
vmap({ "<leader>y", '"+y' })
vmap({ "y", "y']" })

-- Better tabbing
vmap({ "<", "<gv" })
vmap({ ">", ">gv" })

-- Insert --
-- Undo break points
imap({ ",", ",<c-g>u" })
imap({ ".", ".<c-g>u" })
imap({ "!", "!<c-g>u" })
imap({ "?", "?<c-g>u" })

-- Move highlighted text up/down one line
imap({ "<C-j>", "<esc>:m .+1<CR>==" })
imap({ "<C-k>", "<esc>:m .-2<CR>==" })

-- Terminal --
-- Escape terminal mode
tmap({ "<ESC>", "<C-\\><C-n>" })
tmap({ "ZZ", "<C-\\><C-n>" })
