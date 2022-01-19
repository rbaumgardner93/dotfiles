local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local keymap = vim.api.nvim_set_keymap

vim.g.mapleader = " "

-- Modes
--  normal_mode = "n"
--  insert_mode = "i"
--  visual_mode = "v"
--  visual_block_mode = "x"
--  term_mode = "t"
--  command_mode = "c"

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "<leader>\\", ":vsp<CR>", opts)
keymap("n", "<leader>-", ":sp<CR>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- nnoremap <leader><CR> :source $MYVIMRC<CR>

keymap("n", "<leader>pl", ":Vex<CR>", opts)
keymap("n", "<leader>pv", ":Explore<CR>", opts)

keymap("n", "<C-n>", ":cnext<CR>", opts)
keymap("n", "<C-p>", ":cprev<CR>", opts)

keymap("n", "<leader>y", "+y", opts)
keymap("n", "<leader>Y", "gg+yG", opts)

keymap("n", "<CR>", "o<Esc>", opts)

keymap("n", "<leader>nrn", "set nornu", opts)
keymap("n", "<leader>rnu", "set relativenumber", opts)

-- Fast saving
keymap("n", "<leader>w", ":w!<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprev<CR>", opts)

-- from ThePrimeagen (https://www.youtube.com/watch?v=hSHATqh8svM)
-- Highlight to the end of the line
keymap("n", "Y", "y$", opts)

-- Keep it centered
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)
keymap("n", "J", "mzJ`z", opts)

-- Moving text
keymap("n", "<leader>j", ":m .+1<CR>==", opts)
keymap("n", "<leader>k", ":m .-2<CR>==", opts)

keymap("n", "<leader>ot", ":terminal<CR>", opts)

-- Plugins
-- Telescope
keymap("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files({ hidden = true })<cr>", opts)
keymap("n", "<leader>fs", "<cmd>lua require('telescope').extensions.file_browser.file_browser( { path = vim.fn.expand('%:p:h') } )<cr>", opts)
keymap("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", opts)
keymap("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", opts)
keymap("n", "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>", opts)
keymap("n", "<leader>fr", "<cmd>lua require('telescope.builtin').resume{}<cr>", opts)
keymap("n", "<leader>ps", "<cmd>lua require('telescope.builtin').grep_string( { search = vim.fn.input('Grep for > ') } )<cr>", opts)

-- Eunech
keymap("n", "<leader>R", ":Rename<CR>", opts)

-- Fugitive
keymap("n", "<leader>gs", ":G<CR>", opts)
keymap("n", "<leader>gj", ":diffget //3<CR>", opts)
keymap("n", "<leader>gf", ":diffget //2<CR>", opts)
keymap("n", "<leader>gd", ":Git diff<CR>", opts)
keymap("n", "<leader>gb", ":Git blame<CR>", opts)

-- Gitsigns
keymap("n", "<leader>ph", ":Gitsigns preview_hunk<CR>", opts)
keymap("n", "<leader>jh", ":Gitsigns next_hunk<CR>", opts)
keymap("n", "<leader>kh", ":Gitsigns prev_hunk<CR>", opts)

-- Harpoon
keymap("n", "<leader>a", "<cmd>lua require('harpoon.mark').add_file()<CR>", opts)
keymap("n", "<C-e>", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", opts)
keymap("n", "<leader>qm", "<cmd>lua require('harpoon.cmd-ui').toggle_quick_menu()<CR>", opts)

keymap("n", "<leader>h", "<cmd>lua require('harpoon.ui').nav_file(1)<CR>", opts)
keymap("n", "<leader>j", "<cmd>lua require('harpoon.ui').nav_file(2)<CR>", opts)
keymap("n", "<leader>k", "<cmd>lua require('harpoon.ui').nav_file(3)<CR>", opts)
keymap("n", "<leader>l", "<cmd>lua require('harpoon.ui').nav_file(4)<CR>", opts)

-- Undotree
keymap("n", "<leader>ut", ":UndotreeToggle<CR>", opts)

-- Visual --
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)

keymap("v", "<leader>p", "_dP", opts)
keymap("v", "<leader>y", "+y", opts)
keymap("v", "y", "y']", opts)

-- Better tabbing
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Visual --
-- Undo break points
keymap("i", ",", ",<c-g>u", opts)
keymap("i", ".", ".<c-g>u", opts)
keymap("i", "!", "!<c-g>u", opts)
keymap("i", "?", "?<c-g>u", opts)

-- Move highlighted text up/down one line
keymap("i", "<C-j>", "<esc>:m .+1<CR>==", opts)
keymap("i", "<C-k>", "<esc>:m .-2<CR>==", opts)

-- Terminal --
-- Escape terminal mode
keymap("t", "<ESC>", "<C-\\><C-n>", term_opts)
keymap("t", "ZZ", "<C-\\><C-n>", term_opts)
