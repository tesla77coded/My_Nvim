return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		event = "VeryLazy",
		config = function()
			local empty = require("lualine.component"):extend()
			function empty:draw(default_highlight)
				self.status = ""
				self.applied_separator = ""
				self:apply_highlights(default_highlight)
				self:apply_section_separators()
				return self.status
			end

			local function clock()
				local t = os.date("*t")
				local hour = t.hour % 12
				if hour == 0 then
					hour = 12
				end
				return string.format("%02d:%02d %s", hour, t.min, t.hour < 12 and "AM" or "PM")
			end

			require("lualine").setup({
				options = {
					theme = "auto",
					globalstatus = true,
					section_separators = { left = "", right = "" },
					component_separators = { left = "╲", right = "╱" },
					disabled_filetypes = {
						statusline = { "dashboard", "alpha" },
					},
				},
				sections = {
					-- mode block on the far left with separators
					lualine_a = {
						{
							"mode",
							separator = { left = "", right = "" },
						},
						{ empty, separator = { right = "" } },
					},

					-- diagnostics right next to mode
					lualine_b = {
						{
							"diagnostics",
							sources = { "nvim_diagnostic" },
							sections = { "error", "warn", "hint", "info" },
							symbols = {
								error = "󰀩 ",
								warn = " ",
								hint = " ",
								info = " ",
							},
							colored = true,
							always_visible = false,
						},
					},

					-- recording indicator in center
					lualine_c = {
						{
							function()
								local ok, noice = pcall(require, "noice")
								if ok and noice.api.statusline.mode.has() then
									local mode = noice.api.statusline.mode.get()
									-- only show if it's a recording message, not the editor mode
									if mode:find("recording") then
										return mode
									end
								end
								return ""
							end,
						},
					},

					-- filetype on the right
					lualine_x = {
						{ "filetype", icon_only = true, colored = true },
					},

					lualine_y = {},

					-- clock on far right with separators
					lualine_z = {
						{ empty, separator = { left = "" } },
						{
							clock,
							separator = { left = "", right = "" },
						},
					},
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = {},
					lualine_x = {},
					lualine_y = {},
					lualine_z = {},
				},
			})

			vim.o.laststatus = 0
			-- show briefly on save
			vim.api.nvim_create_autocmd("BufWritePost", {
				callback = function()
					vim.o.laststatus = 3
					vim.defer_fn(function()
						vim.o.laststatus = 0
					end, 3500) -- visible for 3 seconds then hides
				end,
			})
		end,
	},
}
