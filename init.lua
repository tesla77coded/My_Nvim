-- ====================================================================
-- Neovim: minimal, sane defaults (no plugins here)
-- ====================================================================

-- Leader keys (set BEFORE loading plugins)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- UI
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.wrap = false
vim.opt.termguicolors = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.laststatus = 3
vim.opt.ruler = false
vim.opt.showcmd = false
vim.opt.cmdheight = 0

-- left side: mode + file info | right side: file path + line/col
vim.opt.statusline = table.concat({
	-- " %f", -- filename
	" %m", -- modified flag [+] if unsaved
	" %r", -- readonly flag
	" %= ", -- <-- everything after this is right-aligned
	-- "%p%%", -- percent through file
	-- " [%l,%c]", -- line,col
	" %F ", -- full path (move to right side)
})

-- Indentation
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true

-- Mouse & clipboard
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"

-- Built-in colorscheme (no plugin required)
vim.opt.termguicolors = true
-- pcall(vim.cmd, "colorscheme zenwritten")

-- Small QoL: highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	desc = "Briefly highlight yanked text",
})

-- ====================================================================
-- Plugin manager: lazy.nvim (bootstrap per README)
-- ====================================================================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Load plugins from lua/plugins.lua (it must `return { ... }`)
require("lazy").setup("plugins")

-- ====================================================================
-- LSP Diagnostics & UI
-- ====================================================================
-- ====================================================================
-- Modern LSP Diagnostics setup (Neovim 0.11+)
-- ====================================================================

vim.diagnostic.config({
	virtual_text = {
		prefix = "●", -- could be '■', '▎', 'x'
	},
	underline = true,
	update_in_insert = false,
	severity_sort = true,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.HINT] = "󰌵",
			[vim.diagnostic.severity.INFO] = "",
		},
	},
	float = {
		border = "rounded",
		source = "if_many",
		focusable = true,
	},
})

vim.api.nvim_create_autocmd("CursorHold", {
	callback = function()
		vim.diagnostic.open_float(nil, { focus = false })
	end,
})

-- Load keymaps after plugins are ready
-- Load keymaps after lazy.nvim finishes startup
vim.api.nvim_create_autocmd("User", {
	pattern = "VeryLazy",
	callback = function()
		require("config.keymaps")
	end,
})

-- Load Formatter
vim.api.nvim_create_autocmd("User", {
	pattern = "VeryLazy",
	callback = function()
		require("config.keymaps")
		require("config.format").setup_autosave()
	end,
})

-- Auto `cd` into folder of the file
vim.api.nvim_create_autocmd("BufEnter", {
	callback = function()
		-- Ignore unnamed buffers and terminals
		if vim.fn.expand("%:p") == "" or vim.bo.buftype ~= "" then
			return
		end
		-- Change directory to the current file’s folder
		vim.cmd("silent! lcd %:p:h")
	end,
	desc = "Auto change directory to the file's folder",
})
