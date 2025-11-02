return {
	{ "tpope/vim-sleuth" },

	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {},
		config = function(_, opts)
			local wk = require("which-key")
			wk.setup(opts)
			wk.add({
				{ "<leader>f", group = "Find" },
				{ "<leader>e", group = "Explorer" },
				{ "<leader>l", group = "LSP" },
				{ "<leader>d", group = "Debug" },
				{ "<leader>g", group = "Git" },
			})
		end,
	},
}
