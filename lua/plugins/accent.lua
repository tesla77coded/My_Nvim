return {
	{
		"alligator/accent.vim",
		lazy = false,
		priority = 2000,
		config = function()
			vim.g.accent_color = "green"
			vim.g.accent_invert_status = 1
			-- vim.cmd.colorscheme("accent")
			vim.cmd([[
				hi StatusLine guibg=#1c1c1c guifg=#a8a8a8 gui=NONE
				hi StatusLineNC guibg=#1c1c1c guifg=#6c6c6c gui=NONE
			]])
		end,
	},
}
