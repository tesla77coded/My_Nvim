return {
	"slugbyte/lackluster.nvim",
	lazy = false,
	priority = 1000,
	init = function()
		vim.cmd.colorscheme("lackluster-hack")

		-- Enable termguicolors (required for cursor colors to work)
		vim.opt.termguicolors = true

		-- Define cursor highlight groups
		vim.api.nvim_set_hl(0, "Cursor", { bg = "#d4d8da" })
		vim.api.nvim_set_hl(0, "CursorInsert", { bg = "#d4a574" })

		-- Set guicursor to use different colors for different modes
		-- n-v-c = normal, visual, command modes use Cursor
		-- i-ci-ve = insert modes use CursorInsert
	end,
}
