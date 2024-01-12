-- [[ https://jaketrent.com/post/set-node-version-nvim/

local is_mac = vim.fn.has("macunix") == 1
local home_dir = "/home/rbaumgardner/"
if is_mac then
	home_dir = "/Users/rbaumgardner/"
end

local node_bin = home_dir .. ".fnm/node-versions/v18.15.0/installation/bin"
vim.g.node_host_prog = node_bin .. "/node"
vim.env.PATH = node_bin .. ":" .. vim.env.PATH

-- ]]

require("options")
require("package_manager")
require("keymaps")
require("autocmd")
require("utils.globals")
