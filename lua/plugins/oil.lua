return {
	"barrettruth/canola.nvim",
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

		local function oil_resize()
			local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
			local max_len = 0
			for _, line in ipairs(lines) do
				max_len = math.max(max_len, #line)
			end
			local width = math.max(20, math.min(max_len + 2, 50))
			vim.api.nvim_win_set_width(0, width)
		end

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
			pattern = "oil://*",
			callback = oil_resize,
		})

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
