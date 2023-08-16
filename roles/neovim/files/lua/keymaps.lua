vim.api.nvim_set_keymap("n", "]h", "<cmd>Gitsigns next_hunk<CR>", { noremap = true, desc = "Gitsigns: next hunk" })

vim.api.nvim_set_keymap("n", "[h", "<cmd>Gitsigns prev_hunk<CR>", { noremap = true, desc = "Gitsigns: prev hunk" })

vim.api.nvim_set_keymap("n", "gx", ":!open <C-r><C-a><CR>", { noremap = true, desc = "Open url under cursor" })

-- [[
-- from ThePrimeagen (https://www.youtube.com/watch?v=hSHATqh8svM)
vim.api.nvim_set_keymap("n", "J", "mzJ`z", { noremap = true, desc = "Move line above and keep centered" })
vim.api.nvim_set_keymap("n", "n", "nzzzv", { noremap = true, desc = "Keep centered when navigating forward" })
vim.api.nvim_set_keymap("n", "N", "Nzzzv", { noremap = true, desc = "Keep centered when navigating backward" })
vim.api.nvim_set_keymap("n", "Y", "y$", { noremap = true, desc = "Yank to end of line" })
-- ]]

vim.api.nvim_set_keymap(
	"n",
	"<C-e>",
	"<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>",
	{ noremap = true, desc = "Harpoon: toggle quick menu" }
)
vim.api.nvim_set_keymap("n", "<C-d>", "<C-d>zz", { noremap = true, desc = "Keep it centered when moving down a file" })

vim.api.nvim_set_keymap("n", "<C-u>", "<C-u>zz", { noremap = true, desc = "Keep it centered when moving up a file" })

vim.api.nvim_set_keymap("n", "<leader><CR>", ":luafile %<CR>", { noremap = true, desc = "Fast sourcing" })
vim.api.nvim_set_keymap(
	"n",
	"<leader>a",
	"<cmd>lua require('harpoon.mark').add_file()<CR>",
	{ noremap = true, desc = "Harpoon: add file" }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>fb",
	"<cmd>lua require('utils.telescope').file_browser()<cr>",
	{ noremap = true, desc = "Telescope: File Browser" }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>fc",
	"<cmd>lua require('telescope.builtin').buffers()<cr>",
	{ noremap = true, desc = "Telescope: Find open buffers" }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>ff",
	"<cmd>lua require('utils.telescope').find_files()<cr>",
	{ noremap = true, desc = "Telescope: Find Files" }
)

vim.api.nvim_set_keymap(
	"n",
	"<leader>fg",
	"<cmd>lua require('utils.telescope').live_grep()<cr>",
	{ noremap = true, desc = "Telescope: Grep Word" }
)

vim.api.nvim_set_keymap(
	"n",
	"<leader>fk",
	"<cmd>lua require('telescope.builtin').keymaps()<CR>",
	{ noremap = true, desc = "Telescope: Find Keymaps" }
)

vim.api.nvim_set_keymap(
	"n",
	"<leader>fh",
	"<cmd>lua require('telescope.builtin').help_tags( { show_version = true } )<cr>",
	{ noremap = true, desc = "Telescope: Find Help" }
)

vim.api.nvim_set_keymap(
	"n",
	"<leader>fn",
	"<cmd>lua require('utils.telescope').edit_neovim()<cr>",
	{ noremap = true, desc = "Telescope: Find neovim" }
)

vim.api.nvim_set_keymap(
	"n",
	"<leader>fr",
	"<cmd>lua require('telescope.builtin').resume{}<cr>",
	{ noremap = true, desc = "Telescope: Resume previous search" }
)

vim.api.nvim_set_keymap(
	"n",
	"<leader>fs",
	"<cmd>lua require('telescope.builtin').grep_string()<cr>",
	{ noremap = true, desc = "Telescope: Find string under cursor" }
)

vim.api.nvim_set_keymap(
	"n",
	"<leader>ft",
	"<cmd>lua require('utils.telescope').curbuf()<cr>",
	{ noremap = true, desc = "Telescope: Find in current buffer" }
)

vim.api.nvim_set_keymap(
	"n",
	"<leader>fw",
	"<cmd>lua require('utils.telescope').grep_string()<cr>",
	{ noremap = true, desc = "Telescope: Find word" }
)

vim.api.nvim_set_keymap(
	"n",
	"<leader>a",
	"<cmd>lua require('harpoon.mark').add_file()<CR>",
	{ noremap = true, desc = "Harpoon: Add file" }
)

vim.api.nvim_set_keymap(
	"n",
	"<leader>ga",
	"<cmd>lua require('gitsigns').stage_buffer()<cr>",
	{ noremap = true, desc = "Gitsigns: stage buffer" }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>gb",
	"<cmd>lua require('gitsigns').toggle_current_line_blame()<CR>",
	{ noremap = true, desc = "Gitsigns: toggle current line blame" }
)

vim.api.nvim_set_keymap("n", "<leader>gB", "<cmd>Git blame<CR>", { noremap = true, desc = "Fugitive: Git blame" })

vim.api.nvim_set_keymap("n", "<leader>gd", "<cmd>Git diff<CR>", { noremap = true, desc = "Fugitive: Git diff" })
vim.api.nvim_set_keymap(
	"n",
	"<leader>gh",
	"<cmd>diffget //2<CR>",
	{ noremap = true, desc = "Fugitive: Diff get left hand side" }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>gl",
	"<cmd>diffget //3<CR>",
	{ noremap = true, desc = "Fugitive: Diff get right hand side" }
)

vim.api.nvim_set_keymap(
	"n",
	"<leader>gp",
	"<cmd>lua require('gitsigns).prev_hunk()<CR>",
	{ noremap = true, desc = "Gitsigns: Preview hunk" }
)

vim.api.nvim_set_keymap(
	"n",
	"<leader>gr",
	"<cmd>Gitsigns reset_hunk<CR>",
	{ noremap = true, desc = "Gitsigns: Reset hunk" }
)

vim.api.nvim_set_keymap(
	"n",
	"<leader>gR",
	"<cmd>lua require('gitsigns').reset_buffer()<CR>",
	{ noremap = true, desc = "Gitsigns: Reset buffer" }
)

vim.api.nvim_set_keymap("n", "<leader>gs", "<cmd>G<CR>", { noremap = true, desc = "Fugitive: Git status" })

vim.api.nvim_set_keymap(
	"n",
	"<leader>gS",
	"<cmd>Gitsigns stage_hunk<CR>",
	{ noremap = true, desc = "Gitsigns: stage hunk" }
)

vim.api.nvim_set_keymap(
	"n",
	"<leader>gu",
	"<cmd>lua require('gitsigns').undo_stage_hunk()<CR>",
	{ noremap = true, desc = "Gitsigns: undo stage hunk" }
)

vim.api.nvim_set_keymap(
	"n",
	"<leader>h",
	"<cmd>lua require('harpoon.ui').nav_file(1)<CR>",
	{ noremap = true, desc = "Harpoon: navigate to first file" }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>j",
	"<cmd>lua require('harpoon.ui').nav_file(2)<CR>",
	{ noremap = true, desc = "Harpoon: navigate to second file" }
)
vim.api.nvim_set_keymap("n", "<leader>J", ":m .+1<CR>==", { noremap = true, desc = "Move line down" })

vim.api.nvim_set_keymap(
	"n",
	"<leader>k",
	"<cmd>lua require('harpoon.ui').nav_file(3)<CR>",
	{ noremap = true, desc = "Harpoon: navigate to third file" }
)

vim.api.nvim_set_keymap("n", "<leader>K", ":m .-2<CR>==", { noremap = true, desc = "Move line up" })

vim.api.nvim_set_keymap(
	"n",
	"<leader>l",
	"<cmd>lua require('harpoon.ui').nav_file(4)<CR>",
	{ noremap = true, desc = "Harpoon: navigate to fourth file" }
)

vim.api.nvim_set_keymap("n", "<leader>md", "<cmd>Glow<CR>", { noremap = true, desc = "Glow: Preview markdown" })
vim.api.nvim_set_keymap("n", "<leader>ut", "<cmd>UndotreeToggle<CR>", { noremap = true, desc = "UndoTree: Toggle" })

vim.api.nvim_set_keymap("n", "<leader>w", ":w!<CR>", { noremap = true, desc = "Save file" })

vim.api.nvim_set_keymap("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, desc = "Move selected line down" })
vim.api.nvim_set_keymap("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, desc = "Move selected line up" })
vim.api.nvim_set_keymap("v", "y", "y']", { noremap = true, desc = "Yank to register" })
vim.api.nvim_set_keymap("v", ">", ">gv", { noremap = true, desc = "Indent" })
vim.api.nvim_set_keymap("v", "<", "<gv", { noremap = true, desc = "Dedent" })
vim.api.nvim_set_keymap(
	"v",
	"<leader>gr",
	"<cmd>Gitsigns reset_hunk<CR>",
	{ noremap = true, desc = "Gitsigns: reset hunk" }
)
vim.api.nvim_set_keymap(
	"v",
	"<leader>gs",
	"<cmd>Gitsigns stage_hunk<CR>",
	{ noremap = true, desc = "Gitsigns: stage hunk" }
)
vim.api.nvim_set_keymap("v", "<leader>p", "_dP", { noremap = true, desc = "Paste below" })
vim.api.nvim_set_keymap("v", "<leader>y", '"+y', { noremap = true, desc = "Yank to system clipboard" })

vim.api.nvim_set_keymap("t", "<ESC>", "<C-\\><C-n>", { noremap = true, desc = "Close terminal" })
