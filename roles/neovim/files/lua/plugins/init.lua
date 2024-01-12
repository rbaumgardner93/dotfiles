vim.g.skip_ts_context_commentstring_module = true

return {
	"nathom/filetype.nvim", -- Faster filetype.vim
	"nvim-lua/plenary.nvim", -- Useful lua functions used ny lots of plugins
	{ "mbbill/undotree", cmd = "UndotreeToggle" },
	-- comments
	{ "JoosepAlviste/nvim-ts-context-commentstring" },
	{
		"echasnovski/mini.nvim",
		event = "VeryLazy",
		config = function()
			require("mini.trailspace").setup({ only_in_normal_buffers = true })
			require("mini.comment").setup({
				options = {
					custom_commentstring = function()
						return require("ts_context_commentstring.internal").calculate_commentstring()
							or vim.bo.commentstring
					end,
				},
			})
		end,
	},
	"b0o/schemastore.nvim", -- simple access to json-language-server schema

	-- scheme evaluator
	{ "Olical/conjure", ft = "scheme" },

	-- ThePrimeagen plugins
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			local harpoon = require("harpoon")

			harpoon:setup()

			vim.keymap.set("n", "<leader>a", function()
				harpoon:list():append()
			end)
			vim.keymap.set("n", "<C-e>", function()
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end)

			vim.keymap.set("n", "<C-h>", function()
				harpoon:list():select(1)
			end)
			vim.keymap.set("n", "<C-j>", function()
				harpoon:list():select(2)
			end)
			vim.keymap.set("n", "<C-k>", function()
				harpoon:list():select(3)
			end)
			vim.keymap.set("n", "<C-l>", function()
				harpoon:list():select(4)
			end)
		end,
	},

	-- tpope plugins
	"tpope/vim-vinegar",
	"tpope/vim-sleuth",
	{ "tpope/vim-surround", event = "InsertEnter" },
	{
		"tpope/vim-fugitive",
		config = function()
			vim.cmd([[
				set statusline=%<%f\ %h%m%r%{FugitiveStatusline()}%=%-14.(%l,%c%V%)\ %P
			]])
		end,
		event = "VeryLazy",
	},
	{ "tpope/vim-unimpaired", keys = { "[", "]" } },
	{ "tpope/vim-repeat", event = "InsertEnter" },
}
