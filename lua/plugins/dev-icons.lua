return {
	{
		"nvim-tree/nvim-web-devicons",
		lazy = false, -- load immediately so other plugins see it
		priority = 1000, -- load early
		opts = {
			color_icons = true, -- enable color
			default = true, -- fallback icon for unknown files
			strict = true, -- use exact matches when possible
			override = {
				-- example: customize some icons/colors
				ts = { icon = "", color = "#3178c6", name = "TypeScript" },
				js = { icon = "", color = "#f7df1e", name = "JavaScript" },
				-- json = { icon = "󰘦", color = "#cbcb41", name = "JSON" },
				-- md = { icon = "󰍔", color = "#519aba", name = "Markdown" },
				-- lua = { icon = "", color = "#51a0cf", name = "Lua" },
				-- conf = { icon = "", color = "#6d8086", name = "Config" },
			},
		},
		config = function(_, opts)
			require("nvim-web-devicons").setup(opts)
		end,
	},
}
