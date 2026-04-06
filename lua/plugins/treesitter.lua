return {
	"nvim-treesitter/nvim-treesitter",
	tag = "v0.9.3",
	build = ":TSUpdate",
	lazy = false,
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = { "rust", "python", "bash", "toml" },
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
