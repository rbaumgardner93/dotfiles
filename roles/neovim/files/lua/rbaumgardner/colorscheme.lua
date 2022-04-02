local colorscheme = "sonokai"

vim.g["sonokai_style"] = "default"
vim.g["sonokai_enable_italic"] = 1
vim.g["sonokai_disable_italic_comment"] = 0
vim.g["sonokai_transparent_background"] = 1

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
