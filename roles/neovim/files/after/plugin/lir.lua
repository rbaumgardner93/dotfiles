local status_ok, lir = pcall(require, "lir")
if not status_ok then
	print("lir plugin was unable to load")
	return
end

local actions = require("lir.actions")
local clipboard_actions = require("lir.clipboard.actions")

lir.setup({
	show_hidden_files = true,
	devicons_enable = true,
	mappings = {
		["<CR>"] = actions.edit,
		["<C-w>s"] = actions.split,
		["<C-w>v"] = actions.vsplit,

		["-"] = actions.up,
		["q"] = actions.quit,

		["K"] = actions.mkdir,
		["N"] = actions.newfile,
		["R"] = actions.rename,
		["<C-r>"] = actions.reload,
		["@"] = actions.cd,
		["Y"] = actions.yank_path,
		["."] = actions.toggle_show_hidden,

		["D"] = actions.delete,
		["C"] = clipboard_actions.copy,
		["X"] = clipboard_actions.cut,
		["P"] = clipboard_actions.paste,
	},
	on_init = function()
		vim.api.nvim_echo({ { vim.fn.expand("%:p"), "Normal" } }, false, {})
	end,
})

local icons = require("rbaumgardner.icons")
local has_devicons, devicons = pcall(require, "nvim-web-devicons")
if has_devicons then
	devicons.set_icon({
		lir_folder_icon = {
			icon = icons.ui.Folder,
			color = "#7ebae4",
			name = "LirFolderNode",
		},
	})
end
