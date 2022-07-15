local colorscheme = "tokyonight"

vim.g.tokyonight_style = "night"
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }
vim.g.tokyonight_transparent = true
vim.g.tokyonight_transparent_sidebar = true
vim.g.tokyonight_dark_float = false

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end

vim.cmd([[
	highlight ColorColumn guibg=#333333
	highlight LineNr guifg=#5eacd3
	highlight FidgetTitle ctermfg=110 guifg=#5eacd3
]])
