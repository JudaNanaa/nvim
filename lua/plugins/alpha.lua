return {
	"goolord/alpha-nvim",
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		dashboard.section.buttons.val = {
			dashboard.button("f", "  Trouver un fichier", "<cmd>FzfLua files<cr>"),
			dashboard.button("r", "  Fichiers récents", "<cmd>FzfLua oldfiles<cr>"),
			dashboard.button("g", "  Grep projet", "<cmd>FzfLua live_grep<cr>"),
			dashboard.button("e", "  Explorateur", "<cmd>Oil<cr>"),
			dashboard.button("q", "  Quitter", "<cmd>qa<cr>"),
		}

		alpha.setup(dashboard.config)
	end,
}
