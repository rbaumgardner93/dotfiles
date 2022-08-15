local ok, impatient = pcall(require, "impatient")
if not ok then
	vim.notify(impatient)
end

impatient.enable_profile()
require("options")
require("autocmd")
require("utils.globals")
require("packer")
