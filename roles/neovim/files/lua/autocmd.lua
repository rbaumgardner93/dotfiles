local nmap = require("utils.keymap").nmap

local general_group = vim.api.nvim_create_augroup("_general", { clear = true })
local spell_group = vim.api.nvim_create_augroup("_spell", { clear = true })
local fold_group = vim.api.nvim_create_augroup("_folds", { clear = true })
local terminal_group = vim.api.nvim_create_augroup("_terminal", { clear = true })
local package_group = vim.api.nvim_create_augroup("_packages", { clear = true })
local packer_group = vim.api.nvim_create_augroup("_packer", { clear = true })

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	pattern = "packer.lua",
	command = "source <afile> | PackerSync",
	group = packer_group,
})

vim.api.nvim_create_autocmd("TextYankPost", {
	command = "silent! lua vim.highlight.on_yank( { higroup = 'IncSearch', timeout = 500 })",
	group = general_group,
})

vim.api.nvim_create_autocmd("BufWrite", {
	command = "silent! lua MiniTrailspace.trim()",
	group = general_group,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "qf", "help", "man", "lspinfo", "fugitive" },
	callback = function()
		nmap({ "q", "<cmd>close<CR>" })
	end,
	group = general_group,
})

vim.api.nvim_create_autocmd("BufWinEnter", {
	command = "set formatoptions-=cro",
	group = general_group,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "fugitive", "alpha", "tsplayground", "netrw" },
	command = "setlocal cc=",
	group = general_group,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "gitcommit", "markdown" },
	command = "setlocal spell",
	group = spell_group,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "fugitive", "alpha", "tsplayground", "netrw" },
	command = "setlocal nofoldenable",
	group = fold_group,
})

vim.api.nvim_create_autocmd("TermOpen", {
	command = "startinsert",
	group = terminal_group,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "gitcommit", "netrw" },
	command = "UfoDetach",
	group = package_group,
})
