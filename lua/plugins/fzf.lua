return {
	"ibhagwan/fzf-lua",
	config = function()
		require("fzf-lua").setup()
		vim.keymap.set("n", "<leader><leader>", "<cmd>FzfLua files<cr>")
		vim.keymap.set("n", "<leader>,", "<cmd>FzfLua buffers<cr>")
		vim.keymap.set("n", "<leader>/", "<cmd>FzfLua live_grep<cr>")
	end,
}
