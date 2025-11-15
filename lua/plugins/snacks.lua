return {
	{
		"folke/snacks.nvim",
		version = "*",
		lazy = false,
		priority = 1000,
		opts = {
			defaults = { enabled = true },
			explorer = { enabled = true },
			picker = {
				enabled = true,
				sources = {
					explorer = {
						layout = {
							preset = "sidebar",
							layout = { position = "right" },
							width = 35,
							auto_hide = { "input" },
						},
					},
				},
			},
			notifier = { enabled = true },
			indent = { enabled = true },
			statuscolumn = { enabled = false },
			words = {
				enabled = false,
				modes = "n",
			},
			lsp = { enabled = true },
			rename = { enabled = true },
			quickfix = { enabled = true },
			terminal = { enabled = true },
			scratch = { enabled = true },
			scroll = { enabled = true },
			scope = { enabled = true },
		},
		config = function(_, opts)
			local snacks = require("snacks")
			snacks.setup(opts)

			-- Keymaps
			vim.keymap.set("n", "<leader><space>", function()
				snacks.picker.files()
			end, { desc = "Find Files" })
			vim.keymap.set("n", "<leader>e", function()
				snacks.explorer()
			end, { desc = "Toggle Explorer" })
		end,
	},
}
