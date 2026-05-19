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
				ensure_installed = { "rust_analyzer", "lua_ls", "wgsl_analyzer", "clangd", "bacon_ls" },
				automatic_installation = true,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			-- Inlay hints sur chaque buffer LSP
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local client = vim.lsp.get_client_by_id(args.data.client_id)
					if client and client:supports_method("textDocument/inlayHint") then
						vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
					end
				end,
			})

			vim.lsp.config("rust_analyzer", {
				settings = {
					["rust-analyzer"] = {
						checkOnSave = false,
						check = {
							command = "clippy",
							extraArgs = { "--", "-W", "clippy::pedantic" },
						},
						cargo = { allFeatures = true },
						inlayHints = {
							typeHints = { enable = true },
							chainingHints = { enable = true },
							closureReturnTypeHints = { enable = "always" },
						},
					},
				},
			})
			vim.lsp.config("lua_ls", {})
			vim.lsp.config("bacon_ls", {
				init_options = {
					updateOnSave = true,
					updateOnSaveWaitMillis = 1000,
					updateOnChange = false,
				},
			})
			vim.lsp.enable("rust_analyzer")
			vim.lsp.enable("lua_ls")
			vim.lsp.enable("wgsl_analyzer")
			vim.lsp.enable("bacon_ls")
		end,
	},
}
