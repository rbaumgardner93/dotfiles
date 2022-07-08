local M = {}

M.setup = function()
	require("mini.trailspace").setup({ only_in_normal_buffers = true })
end

return M
