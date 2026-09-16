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
				ensure_installed = { "rust_analyzer", "lua_ls", "wgsl_analyzer", "clangd", "bacon_ls", "zls" },
				automatic_installation = true,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			-- Inlay hints sur chaque buffer LSP
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local client = vim.lsp.get_client_by_id(args.data.client_id)
					if client and client:supports_method("textDocument/inlayHint") then
						vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
					end
				end,
			})

			vim.lsp.config("rust_analyzer", {
				capabilities = capabilities,
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
			vim.lsp.config("lua_ls", {
				capabilities = capabilities,
			})
			vim.lsp.config("zls", {
				capabilities = capabilities,
				settings = {
					zls = {
						enable_autofix = true,
						enable_snippets = true,
						enable_build_on_save = false,
						warn_style = true,
					},
				},
			})
			vim.lsp.config("bacon_ls", {
				capabilities = capabilities,
				init_options = {
					updateOnSave = true,
					updateOnSaveWaitMillis = 1000,
					updateOnChange = false,
				},
			})
			vim.lsp.config("clangd", {
				capabilities = capabilities,
				filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
			})
			vim.lsp.enable("rust_analyzer")
			vim.lsp.enable("lua_ls")
			vim.lsp.enable("wgsl_analyzer")
			vim.lsp.enable("bacon_ls")
			vim.lsp.enable("clangd")
			vim.lsp.enable("zls")
		end,
	},
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				c = { "clang-format" },
				cpp = { "clang-format" },
				rust = { "rustfmt" },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},
		},
		keys = {
			{
				"<leader>lf",
				function()
					require("conform").format({ async = true, lsp_fallback = true })
				end,
				mode = { "n", "v" },
				desc = "Format buffer",
			},
		},
	},
}
