-- Modes
--  normal_mode = "n"
--  insert_mode = "i"
--  visual_mode = "v"
--  visual_block_mode = "x"
--  term_mode = "t"
--  command_mode = "c"

local M = {}

M.nmap = function(tbl)
	vim.keymap.set("n", tbl[1], tbl[2], tbl[3])
end

M.imap = function(tbl)
	vim.keymap.set("i", tbl[1], tbl[2], tbl[3])
end

M.vmap = function(tbl)
	vim.keymap.set("v", tbl[1], tbl[2], tbl[3])
end

M.tmap = function(tbl)
	vim.keymap.set("t", tbl[1], tbl[2], tbl[3])
end

return M
