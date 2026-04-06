return {
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				on_attach = function(bufnr)
					local gs = package.loaded.gitsigns
					vim.keymap.set("n", "]c", gs.next_hunk, { buffer = bufnr })
					vim.keymap.set("n", "[c", gs.prev_hunk, { buffer = bufnr })
					vim.keymap.set("n", "<leader>gp", gs.preview_hunk, { buffer = bufnr })
					vim.keymap.set("n", "<leader>gb", gs.blame_line, { buffer = bufnr })
				end,
			})
		end,
	},
	{
		"kdheepak/lazygit.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<cr>")
		end,
	},
	{
		"sindrets/diffview.nvim",
		config = function()
			require("diffview").setup()
			vim.keymap.set("n", "<leader>gd", "<cmd>DiffviewOpen<cr>")
			vim.keymap.set("n", "<leader>gh", "<cmd>DiffviewFileHistory<cr>")
		end,
	},
}
