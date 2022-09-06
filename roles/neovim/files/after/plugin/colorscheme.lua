local colorscheme = "tokyonight"

require(colorscheme).setup({
	style = "night",
	transparent = true,
	styles = {
		functions = "italic",
		-- Background styles. Can be "dark", "transparent", or "normal"
		sidebars = "transparent",
		floats = "transparent",
	},
	sidebars = { "qf", "vista_kind", "terminal", "packer" },
})

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end

vim.cmd([[
	highlight ColorColumn guibg=#292e42
]])
