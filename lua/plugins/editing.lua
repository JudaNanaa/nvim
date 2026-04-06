return {
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup()
		end,
	},
	{
		"folke/flash.nvim",
		config = function()
			require("flash").setup()
			vim.keymap.set({ "n", "x", "o" }, "s", function() require("flash").jump() end)
			vim.keymap.set({ "n", "x", "o" }, "S", function() require("flash").treesitter() end)
		end,
	},
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local harpoon = require("harpoon")
			harpoon:setup()
			vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end)
			vim.keymap.set("n", "<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
			vim.keymap.set("n", "<leader>h1", function() harpoon:list():select(1) end)
			vim.keymap.set("n", "<leader>h2", function() harpoon:list():select(2) end)
			vim.keymap.set("n", "<leader>h3", function() harpoon:list():select(3) end)
			vim.keymap.set("n", "<leader>h4", function() harpoon:list():select(4) end)
		end,
	},
	{
		"mg979/vim-visual-multi",
		branch = "master",
	},
}
