return {
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			routes = {
				-- Show recording messages in mini view at bottom right
				-- {
				-- 	view = "mini",
				-- 	filter = { event = "msg_showmode" },
				-- },
				-- Show write/save confirmations in mini view
				{
					view = "mini",
					filter = {
						event = "msg_show",
						find = "written",
					},
				},
			},
			-- Optional: customize the mini view position
			views = {
				mini = {
					position = {
						row = -2, -- 2 lines from bottom
						col = "100%", -- far right
					},
					size = {
						width = "auto",
						height = "auto",
					},
					border = {
						style = "rounded",
					},
				},
			},
		},
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	},
}
