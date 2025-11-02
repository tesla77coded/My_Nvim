return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "master",
		lazy = false,
		build = ":TSUpdate",
		opts = {
			ensure_installed = {
				"lua",
				"vim",
				"html",
				"bash",
				"css",
				"vimdoc",
				"query",
				"markdown",
				"markdown_inline",
				"javascript",
				"json",
			},
			auto_install = true,
			highlight = { enable = true, additional_vim_regex_highlighting = false },
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
}
