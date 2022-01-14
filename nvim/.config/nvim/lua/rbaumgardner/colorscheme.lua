local colorscheme = "gruvbox"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

vim.g['gruvbox_contrast_dark'] = 'hard'
vim.g['gruvbox_invert_selection'] = 0
vim.g['gruvbox_transparent_bg'] = 1

if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end

vim.cmd [[ highlight ColorColumn guibg=#333333 ]]

