return {
	"folke/flash.nvim",
	event = "VeryLazy",
	---@type Flash.Config
	opts = {
		-- Labels used for jump targets
		labels = "asdfghjklqwertyuiopzxcvbnm",

		-- Search settings
		search = {
			-- Search mode: "exact", "search", "fuzzy"
			mode = "exact",
			-- Behave like incsearch
			incremental = false,
			-- Exclude certain filetypes
			exclude = {
				"notify",
				"cmp_menu",
				"noice",
				"flash_prompt",
				function(win)
					return not vim.api.nvim_win_get_config(win).focusable
				end,
			},
		},

		-- Jump settings
		jump = {
			-- Save location in jumplist
			jumplist = true,
			-- Jump position
			pos = "start", -- "start" | "end" | "range"
			-- Auto-jump when there's only one match
			autojump = false,
		},

		-- Label settings
		label = {
			-- Show uppercase labels
			uppercase = true,
			-- Show label after match
			after = true,
			-- Show label before match
			before = false,
			-- Label style: "overlay" | "eol" | "right_align" | "inline"
			style = "overlay",
			-- Re-use labels from previous matches
			reuse = "lowercase",
			-- Label targets closer to cursor first
			distance = true,
			-- Minimum pattern length to show labels
			min_pattern_length = 0,
		},

		-- Highlight settings
		highlight = {
			-- Show backdrop
			backdrop = true,
			-- Highlight groups
			groups = {
				match = "FlashMatch",
				current = "FlashCurrent",
				backdrop = "FlashBackdrop",
				label = "FlashLabel",
			},
		},

		-- Enable flash for different modes
		modes = {
			-- Flash for regular search
			search = {
				enabled = true, -- Enable flash for / and ?
			},
			-- Flash for character motions
			char = {
				enabled = true, -- Enable for f, F, t, T
				jump_labels = true,
				-- Multi-line character search
				multi_line = true,
			},
			-- Treesitter search
			treesitter = {
				labels = "abcdefghijklmnopqrstuvwxyz",
				jump = { pos = "range" },
			},
		},
	},

	-- Keymaps
	keys = {
		-- Flash jump (s key)
		{
			"s",
			mode = { "n", "x", "o" },
			function()
				require("flash").jump()
			end,
			desc = "Flash",
		},

		-- Flash treesitter (S key)
		{
			"S",
			mode = { "n", "o", "x" },
			function()
				require("flash").treesitter()
			end,
			desc = "Flash Treesitter",
		},

		-- Remote flash (r in operator pending mode)
		{
			"r",
			mode = "o",
			function()
				require("flash").remote()
			end,
			desc = "Remote Flash",
		},

		-- Treesitter search
		{
			"R",
			mode = { "o", "x" },
			function()
				require("flash").treesitter_search()
			end,
			desc = "Treesitter Search",
		},

		-- Toggle flash in command mode
		{
			"<c-s>",
			mode = { "c" },
			function()
				require("flash").toggle()
			end,
			desc = "Toggle Flash Search",
		},
	},
}
