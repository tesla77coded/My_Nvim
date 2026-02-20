return {
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			lsp = {
				signature = {
					enabled = false,
				},
				hover = {
					enabled = false,
				},
			},
			routes = {
				{
					view = "mini",
					filter = {
						event = "msg_show",
						find = "written",
					},
				},
			},
			views = {
				mini = {
					position = { row = -2, col = "100%" },
					size = { width = "auto", height = "auto" },
					border = { style = "rounded" },
				},
			},
		},
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	},
}
