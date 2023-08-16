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
	{ "ThePrimeagen/harpoon", keys = { [[ <C-e> ]] } },

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
