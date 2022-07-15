local toggle_term_status_ok, toggleterm = pcall(require, "toggleterm")
if not toggle_term_status_ok then
	return
end

toggleterm.setup({
	direction = "float",
})

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

function _lazygit_toggle()
	lazygit:toggle()
end
