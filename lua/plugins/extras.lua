return {
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("todo-comments").setup()
			vim.keymap.set("n", "<leader>ft", "<cmd>TodoFzf<cr>")
		end,
	},
	{
		"folke/trouble.nvim",
		config = function()
			require("trouble").setup()
			vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>")
			vim.keymap.set("n", "<leader>xd", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>")
		end,
	},
	{
		"saecki/crates.nvim",
		event = "BufRead Cargo.toml",
		config = function()
			require("crates").setup()
		end,
	},
}
