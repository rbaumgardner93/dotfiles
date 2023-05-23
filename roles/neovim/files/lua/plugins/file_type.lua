return {
	"ellisonleao/glow.nvim",
	ft = "markdown",
	config = function()
		require("glow").setup({
			border = "none",
			pager = true,
		})
	end,
}
