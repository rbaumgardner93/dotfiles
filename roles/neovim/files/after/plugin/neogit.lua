local status_ok, neogit = pcall(require, "neogit")
if not status_ok then
	return
end
local icons = require("rbaumgardner.icons")

neogit.setup({
	-- Change the default way of opening neogit
	kind = "split_above",
	disable_context_highlighting = true,
	-- customize displayed signs
	signs = {
		-- { CLOSED, OPENED }
		section = { icons.git.ChevronRight, icons.git.ChevronDown },
		item = { icons.git.ChevronRight, icons.git.ChevronDown },
		hunk = { "", "" },
	},
	integrations = {
		diffview = true,
	},
	-- Setting any section to `false` will make the section not render at all
	sections = {
		untracked = {
			folded = true,
		},
		unstaged = {
			folded = true,
		},
		staged = {
			folded = true,
		},
		stashes = {
			folded = true,
		},
		unpulled = {
			folded = true,
		},
		unmerged = {
			folded = true,
		},
		recent = {
			folded = true,
		},
	},
})
