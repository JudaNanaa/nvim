return {
	"akinsho/toggleterm.nvim",
	version = "*",
	keys = {
		{ [[<C-\>]],    desc = "Toggle terminal" },
		{ "<leader>tf", "<cmd>ToggleTerm direction=float<cr>",            desc = "Terminal float" },
		{ "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>",       desc = "Terminal horizontal" },
		{ "<leader>tv", "<cmd>ToggleTerm direction=vertical size=60<cr>", desc = "Terminal vertical" },
	},
	opts = {
		size = function(term)
			if term.direction == "horizontal" then
				return 15
			elseif term.direction == "vertical" then
				return math.floor(vim.o.columns * 0.4)
			end
		end,
		open_mapping = [[<C-\>]],
		hide_numbers = true,
		shade_terminals = true,
		shading_factor = 2,
		start_in_insert = true,
		insert_mappings = true,
		terminal_mappings = true,
		persist_size = true,
		persist_mode = true,
		direction = "float",
		close_on_exit = true,
		shell = vim.o.shell,
		auto_scroll = true,
		float_opts = {
			border = "curved",
			winblend = 5,
			width = function()
				return math.floor(vim.o.columns * 0.85)
			end,
			height = function()
				return math.floor(vim.o.lines * 0.80)
			end,
			title_pos = "center",
		},
		winbar = {
			enabled = false,
		},
	},
	config = function(_, opts)
		require("toggleterm").setup(opts)

		-- Mappings pour naviguer hors du terminal en mode terminal
		function _G.set_terminal_keymaps()
			local map = function(lhs, rhs)
				vim.keymap.set("t", lhs, rhs, { buffer = 0, noremap = true })
			end
			map("<esc>", [[<C-\><C-n>]]) -- quitter le mode insertion du terminal
			map("<C-h>", [[<Cmd>wincmd h<CR>]])
			map("<C-j>", [[<Cmd>wincmd j<CR>]])
			map("<C-k>", [[<Cmd>wincmd k<CR>]])
			map("<C-l>", [[<Cmd>wincmd l<CR>]])
		end

		vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
	end,
}
