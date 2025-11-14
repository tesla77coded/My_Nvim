return {
	{
		"j-hui/fidget.nvim",
		event = "LspAttach",
		opts = {
			progress = {
				display = {
					done_icon = "✓",
					progress_icon = { pattern = "dots", period = 1 },
				},
			},
			notification = {
				window = {
					winblend = 0,
					border = "none", -- or "rounded", "single", etc.
				},
			},
		},
	},
}
