return {
	"stevearc/oil.nvim",
	config = function()
		require("oil").setup({
			keymaps = {
				["q"] = "actions.close",
			},
			preview = {
				max_width = 0.5,
				min_width = 0.3,
			},
		})

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
