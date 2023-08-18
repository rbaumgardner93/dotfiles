vim.keymap.set("n", "]h", "<cmd>Gitsigns next_hunk<CR>", { desc = "Gitsigns: next hunk" })

vim.keymap.set("n", "[h", "<cmd>Gitsigns prev_hunk<CR>", { desc = "Gitsigns: prev hunk" })

vim.keymap.set("n", "gx", ":!open <C-r><C-a><CR>", { desc = "Open url under cursor" })

-- [[
-- from ThePrimeagen (https://www.youtube.com/watch?v=hSHATqh8svM)
vim.keymap.set("n", "J", "mzJ`z", { desc = "Move line above and keep centered" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Keep centered when navigating forward" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Keep centered when navigating backward" })
vim.keymap.set("n", "Y", "y$", { desc = "Yank to end of line" })
-- ]]

vim.keymap.set(
	"n",
	"<C-e>",
	"<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>",
	{ desc = "Harpoon: toggle quick menu" }
)
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Keep it centered when moving down a file" })

vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Keep it centered when moving up a file" })

vim.keymap.set("n", "<leader><CR>", ":luafile %<CR>", { desc = "Fast sourcing" })
vim.keymap.set("n", "<leader>a", "<cmd>lua require('harpoon.mark').add_file()<CR>", { desc = "Harpoon: add file" })
vim.keymap.set(
	"n",
	"<leader>fb",
	"<cmd>lua require('utils.telescope').file_browser()<cr>",
	{ desc = "Telescope: [F]ile [B]rowser" }
)
vim.keymap.set(
	"n",
	"<leader>fc",
	"<cmd>lua require('telescope.builtin').buffers()<cr>",
	{ desc = "Telescope: Find open buffers" }
)
vim.keymap.set(
	"n",
	"<leader>ff",
	"<cmd>lua require('utils.telescope').find_files()<cr>",
	{ desc = "Telescope: [F]ind [F]iles" }
)

vim.keymap.set(
	"n",
	"<leader>fg",
	"<cmd>lua require('utils.telescope').live_grep()<cr>",
	{ desc = "Telescope: Grep Word" }
)

vim.keymap.set(
	"n",
	"<leader>fk",
	"<cmd>lua require('telescope.builtin').keymaps()<CR>",
	{ desc = "Telescope: [F]ind [K]eymaps" }
)

vim.keymap.set(
	"n",
	"<leader>fh",
	"<cmd>lua require('telescope.builtin').help_tags( { show_version = true } )<cr>",
	{ desc = "Telescope: [F]ind [H]elp" }
)

vim.keymap.set(
	"n",
	"<leader>fn",
	"<cmd>lua require('utils.telescope').edit_neovim()<cr>",
	{ desc = "Telescope: [F]ind [n]eovim" }
)

vim.keymap.set(
	"n",
	"<leader>fr",
	"<cmd>lua require('telescope.builtin').resume{}<cr>",
	{ desc = "Telescope: Resume previous search" }
)

vim.keymap.set(
	"n",
	"<leader>fs",
	"<cmd>lua require('telescope.builtin').grep_string()<cr>",
	{ desc = "Telescope: [F]ind [s]tring under cursor" }
)

vim.keymap.set(
	"n",
	"<leader>ft",
	"<cmd>lua require('utils.telescope').curbuf()<cr>",
	{ desc = "Telescope: [F]ind [t]ext in current buffer" }
)

vim.keymap.set(
	"n",
	"<leader>fw",
	"<cmd>lua require('utils.telescope').grep_string()<cr>",
	{ desc = "Telescope: [F]ind [w]ord" }
)

vim.keymap.set("n", "<leader>a", "<cmd>lua require('harpoon.mark').add_file()<CR>", { desc = "Harpoon: Add file" })

vim.keymap.set(
	"n",
	"<leader>ga",
	"<cmd>lua require('gitsigns').stage_buffer()<cr>",
	{ desc = "Gitsigns: stage buffer" }
)
vim.keymap.set(
	"n",
	"<leader>gb",
	"<cmd>lua require('gitsigns').toggle_current_line_blame()<CR>",
	{ desc = "Gitsigns: toggle current line blame" }
)

vim.keymap.set("n", "<leader>gB", "<cmd>Git blame<CR>", { desc = "Fugitive: Git blame" })

vim.keymap.set("n", "<leader>gd", "<cmd>Git diff<CR>", { desc = "Fugitive: Git diff" })
vim.keymap.set("n", "<leader>gh", "<cmd>diffget //2<CR>", { desc = "Fugitive: Diff get left hand side" })
vim.keymap.set("n", "<leader>gl", "<cmd>diffget //3<CR>", { desc = "Fugitive: Diff get right hand side" })

vim.keymap.set("n", "<leader>gp", "<cmd>lua require('gitsigns).prev_hunk()<CR>", { desc = "Gitsigns: Preview hunk" })

vim.keymap.set("n", "<leader>gr", "<cmd>Gitsigns reset_hunk<CR>", { desc = "Gitsigns: Reset hunk" })

vim.keymap.set(
	"n",
	"<leader>gR",
	"<cmd>lua require('gitsigns').reset_buffer()<CR>",
	{ desc = "Gitsigns: Reset buffer" }
)

vim.keymap.set("n", "<leader>gs", "<cmd>G<CR>", { desc = "Fugitive: Git status" })

vim.keymap.set("n", "<leader>gS", "<cmd>Gitsigns stage_hunk<CR>", { desc = "Gitsigns: stage hunk" })

vim.keymap.set(
	"n",
	"<leader>gu",
	"<cmd>lua require('gitsigns').undo_stage_hunk()<CR>",
	{ desc = "Gitsigns: undo stage hunk" }
)

vim.keymap.set(
	"n",
	"<leader>h",
	"<cmd>lua require('harpoon.ui').nav_file(1)<CR>",
	{ desc = "Harpoon: navigate to first file" }
)
vim.keymap.set(
	"n",
	"<leader>j",
	"<cmd>lua require('harpoon.ui').nav_file(2)<CR>",
	{ desc = "Harpoon: navigate to second file" }
)
vim.keymap.set("n", "<leader>J", ":m .+1<CR>==", { desc = "Move line down" })

vim.keymap.set(
	"n",
	"<leader>k",
	"<cmd>lua require('harpoon.ui').nav_file(3)<CR>",
	{ desc = "Harpoon: navigate to third file" }
)

vim.keymap.set("n", "<leader>K", ":m .-2<CR>==", { desc = "Move line up" })

vim.keymap.set(
	"n",
	"<leader>l",
	"<cmd>lua require('harpoon.ui').nav_file(4)<CR>",
	{ desc = "Harpoon: navigate to fourth file" }
)

vim.keymap.set("n", "<leader>md", "<cmd>Glow<CR>", { desc = "Glow: Preview markdown" })
vim.keymap.set("n", "<leader>ut", "<cmd>UndotreeToggle<CR>", { desc = "UndoTree: Toggle" })

vim.keymap.set("n", "<leader>w", ":w!<CR>", { desc = "Save file" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected line down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected line up" })
vim.keymap.set("v", "y", "y']", { desc = "Yank to register" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent" })
vim.keymap.set("v", "<", "<gv", { desc = "Dedent" })
vim.keymap.set("v", "<leader>gr", "<cmd>Gitsigns reset_hunk<CR>", { desc = "Gitsigns: reset hunk" })
vim.keymap.set("v", "<leader>gs", "<cmd>Gitsigns stage_hunk<CR>", { desc = "Gitsigns: stage hunk" })
vim.keymap.set("v", "<leader>p", "_dP", { desc = "Paste below" })
vim.keymap.set("v", "<leader>y", '"+y', { desc = "Yank to system clipboard" })

vim.keymap.set("t", "<ESC>", "<C-\\><C-n>", { desc = "Close terminal" })
