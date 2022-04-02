local dap_status_ok, dap = pcall(require, "dap")
if not dap_status_ok then
	return
end
local nmap = require("rbaumgardner.utils.keymap").nmap
require("rbaumgardner.dap.node")
dap.set_log_level("DEBUG")

vim.fn.sign_define("DapBreakpoint", { text = " ", texthl = "", linehl = "", numhl = "" })

local load_launchjs = function()
	require("dap.ext.vscode").load_launchjs()
end
if not pcall(load_launchjs) then
	vim.notify("Failed to parse launch.json", "warn")
end

nmap({ "<F5>", ":lua require'dap'.continue()<CR>" })
nmap({ "<F10>", ":lua require'dap'.step_over()<CR>" })
nmap({ "<F11>", ":lua require'dap'.step_into()<CR>" })
nmap({ "<F12>", ":lua require'dap'.step_out()<CR>" })
nmap({ "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>" })
nmap({ "<leader>B", ":lua require'dap'.toggle_breakpoint(vim.fn.input('Breakpoint condition: ')<CR>" })
nmap({ "<leader>lp", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')<CR>" })
nmap({ "<leader>dr", ":lua require'dap'.repl.open()<CR>" })
nmap({ "<leader>dl", ":lua require'dap'.run_last()<CR>" })
