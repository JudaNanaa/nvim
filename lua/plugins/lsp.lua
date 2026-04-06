return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "rust_analyzer", "lua_ls", "wgsl_analyzer" },
				automatic_installation = true,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			vim.lsp.config("rust_analyzer", {
				settings = {
					["rust-analyzer"] = {
						checkOnSave = true,
						check = { command = "clippy" },
						cargo = { allFeatures = true },
					},
				},
			})
			vim.lsp.config("lua_ls", {})
			vim.lsp.enable("rust_analyzer")
			vim.lsp.enable("lua_ls")
			vim.lsp.enable("wgsl_analyzer")
		end,
	},
}
