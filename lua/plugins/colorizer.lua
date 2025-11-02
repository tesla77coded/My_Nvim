return {
	"NvChad/nvim-colorizer.lua",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		filetypes = { "*" },
		user_default_options = {
			names = true,
			tailwind = true,
			mode = "background", -- or "virtualtext" if you prefer a square next to code
			css = true,
			css_fn = true,
		},
	},
}
