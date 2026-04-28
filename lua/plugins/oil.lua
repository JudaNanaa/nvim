return {
	"stevearc/oil.nvim",
	dependencies = { "refractalize/oil-git-status.nvim" },
	config = function()
		require("oil").setup({
			keymaps = {
				["q"] = "actions.close",
			},
			preview = {
				max_width = 0.5,
				min_width = 0.3,
			},
			win_options = {
				signcolumn = "yes:2",
			},
		})
		require("oil-git-status").setup()
		-- Auto-preview au mouvement du curseur
		vim.api.nvim_create_autocmd("CursorMoved", {
			pattern = "oil://*",
			callback = function()
				local entry = require("oil").get_cursor_entry()
				if entry then
					require("oil.actions").preview.callback()
				end
			end,
		})
	end,
}
