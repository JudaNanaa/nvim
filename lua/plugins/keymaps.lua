return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		preset = "helix",
		delay = 300,
		icons = {
			mappings = true,
			keys = {
				Up = " ",
				Down = " ",
				Left = " ",
				Right = " ",
				C = "󰘴 ",
				M = "󰘵 ",
				S = "󰘶 ",
				CR = "󰌑 ",
				Esc = "󱊷 ",
				Space = "󱁐 ",
			},
		},
		win = {
			border = "rounded",
			padding = { 1, 2 },
		},
		layout = {
			spacing = 3,
		},
		spec = {
			{ "<leader>e", desc = "Explorer (Oil)", icon = "󰙅 " },
			{ "<leader>r", group = "run/cargo", icon = "󱘗 " },
			{ "<leader>rb", desc = "Cargo build", icon = " " },
			{ "<leader>rr", desc = "Cargo run", icon = "󰐊 " },
			{ "<leader>rt", desc = "Cargo test", icon = "󰙨 " },
			{ "<leader>rf", desc = "Cargo fmt", icon = "󰉼 " },
			{ "<leader>rn", desc = "Rename (LSP)", icon = "󰑕 " },
			{ "<leader>ca", desc = "Code action (LSP)", icon = " " },
			{ "<leader>c", group = "code" },
			{ "<leader>g", group = "git", icon = "󰊢 " },
		},
	},
}
