return {
	"stevearc/oil.nvim",
	config = function()
		require("oil").setup({
			keymaps = {
				["q"] = "actions.close",
			},
		})
	end,
}
