return {
	"nathom/filetype.nvim", -- Faster filetype.vim
	"nvim-lua/plenary.nvim", -- Useful lua functions used ny lots of plugins
	{ "mbbill/undotree", cmd = "UndotreeToggle" },
	-- comments
	{ "JoosepAlviste/nvim-ts-context-commentstring", lazy = true },
	{
		"echasnovski/mini.nvim",
		event = "VeryLazy",
		config = function()
			require("mini.trailspace").setup({ only_in_normal_buffers = true })
			require("mini.comment").setup({
				hooks = {
					pre = function()
						require("ts_context_commentstring.internal").update_commentstring()
					end,
				},
			})
		end,
	},
	"b0o/schemastore.nvim", -- simple access to json-language-server schema

	-- scheme evaluator
	{ "Olical/conjure", ft = "scheme" },

	-- ThePrimeagen plugins
	{ "ThePrimeagen/harpoon", keys = { [[ <C-e> ]] } },

	-- tpope plugins
	"tpope/vim-vinegar",
	"tpope/vim-sleuth",
	{ "tpope/vim-surround", event = "InsertEnter" },
	{ "tpope/vim-fugitive", event = "VeryLazy" },
	{ "tpope/vim-unimpaired", keys = { "[", "]" } },
	{ "tpope/vim-repeat", event = "InsertEnter" },
}
