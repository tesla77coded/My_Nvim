return {
	"slugbyte/lackluster.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		local lackluster = require("lackluster")

		-- MUST call setup() BEFORE colorscheme command
		lackluster.setup({
			-- You can customize lackluster's own colors here if needed
			tweak_color = {
				lack = "default",
				luster = "default",
			},
		})
		--
		-- -- Now set the colorscheme
		-- vim.cmd.colorscheme("lackluster-hack")
		--
		-- -- NOW override the highlights AFTER colorscheme is loaded
		-- vim.api.nvim_set_hl(0, "Cursor", { bg = "#d4a574" })
		-- vim.api.nvim_set_hl(0, "CursorInsert", { bg = "#789978" })
		-- vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE", fg = "#555555" })
		-- vim.api.nvim_set_hl(0, "TabLineSel", { bg = "#444444" })
	end,
}
