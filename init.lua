vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- UI
vim.opt.background = "light"
vim.opt.number = true
vim.opt.iskeyword:remove("_")
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.wrap = false
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.laststatus = 3
vim.opt.ruler = false
vim.opt.showcmd = false
vim.opt.cmdheight = 0
vim.opt.scrolloff = 3
vim.opt.winborder = "rounded"
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.colorcolumn = "100"
vim.opt.swapfile = false
vim.opt.autoread = true
vim.opt.autocomplete = true

-- cursor
-- vim.opt.guicursor = "n-v-c:block-Cursor/lCursor,i-ci-ve:block-CursorInsert/lCursorInsert"
vim.opt.guicursor = "n-v-c:block-Cursor/lCursor,i-ci-ve:block-CursorInsert/lCursorInsert"

-- Statusline

-- function DiagnosticCounts()
-- 	local errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
-- 	local warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
-- 	local result = ""
-- 	if errors > 0 then
-- 		result = result .. "󰅚 " .. errors .. ":"
-- 	end
-- 	if warnings > 0 then
-- 		result = result .. "󰀪 " .. warnings .. ""
-- 	end
-- 	return result
-- end
--
-- function _G.CurrentTime()
-- 	local t = os.date("*t")
-- 	local hour = t.hour % 12
-- 	if hour == 0 then
-- 		hour = 12
-- 	end
-- 	local ampm = t.hour < 12 and "AM" or "PM"
-- 	return string.format("%02d:%02d %s", hour, t.min, ampm)
-- end
--
-- vim.opt.statusline = table.concat({
-- 	" %m",
-- 	" %r",
-- 	" %{%v:lua.NoiceRecording()%}",
-- 	" %{%v:lua.DiagnosticCounts()%}",
-- 	" %=",
-- 	" %{%v:lua.CurrentTime()%} ",
-- })
--
-- -- Function to show recording status
-- function _G.NoiceRecording()
-- 	local ok_noice, noice = pcall(require, "noice")
-- 	if ok_noice and noice.api.statusline.mode.has() then
-- 		return noice.api.statusline.mode.get()
-- 	end
-- 	return ""
-- end

-- Persistent undo
vim.opt.undofile = true

local undodir = vim.fn.stdpath("state") .. "/undo"
vim.opt.undodir = undodir

-- Show buffers in tabline at the top
vim.opt.showtabline = 2 -- Always show tabline (2 = always, 1 = only if multiple tabs, 0 = never)
vim.opt.tabline = "%!v:lua.MyTabline()"

function _G.MyTabline()
	local s = ""
	for i = 1, vim.fn.bufnr("$") do
		if vim.fn.buflisted(i) == 1 then
			local bufname = vim.fn.bufname(i)
			local filename = bufname ~= "" and vim.fn.fnamemodify(bufname, ":t") or "[No Name]"

			-- Highlight current buffer
			if i == vim.fn.bufnr("%") then
				s = s .. "%#TabLineSel#"
			else
				s = s .. "%#TabLine#"
			end

			-- Add buffer number and name
			s = s .. " " .. filename .. " "
		end
	end

	-- Fill the rest with blank
	s = s .. "%#TabLineFill#"
	return s
end

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
-- vim.opt.mouse = ""
vim.g.clipboard = {
	name = "wl-clipboard",
	copy = {
		["+"] = "wl-copy",
		["*"] = "wl-copy",
	},
	paste = {
		["+"] = "wl-paste --no-newline",
		["*"] = "wl-paste --no-newline",
	},
	cache_enabled = 0,
}
vim.opt.clipboard = "unnamedplus"

-- Built-in colorscheme (no plugin required)
vim.opt.termguicolors = true
vim.cmd.colorscheme("custom_dark")

-- Small QoL: highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.hl.on_yank()
	end,
	desc = "Briefly highlight yanked text",
})

-- ====================================================================
-- Plugin manager: lazy.nvim (bootstrap per README)
-- ====================================================================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
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
	virtual_text = false,
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
		if #vim.diagnostic.get(0) > 0 then -- Only if diagnostics exist
			vim.diagnostic.open_float(nil, { focus = false })
		end
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

-- Auto `cd` into folder of the file
-- vim.api.nvim_create_autocmd("BufEnter", {
-- 	callback = function()
-- 		-- Ignore unnamed buffers and terminals
-- 		if vim.fn.expand("%:p") == "" or vim.bo.buftype ~= "" then
-- 			return
-- 		end
-- 		-- Change directory to the current file’s folder
-- 		vim.cmd("silent! lcd %:p:h")
-- 	end,
-- 	desc = "Auto change directory to the file's folder",
-- })
--

-- Save view state
local view_cache = {}

vim.api.nvim_create_autocmd("BufLeave", {
	callback = function()
		view_cache[vim.api.nvim_get_current_buf()] = vim.fn.winsaveview()
	end,
})

vim.api.nvim_create_autocmd("BufEnter", {
	callback = function()
		local buf = vim.api.nvim_get_current_buf()
		if view_cache[buf] then
			vim.fn.winrestview(view_cache[buf])
		end
	end,
})

-- Neovide configuration

if vim.g.neovide then
	vim.o.guifont = "Hack Nerd Font:h16"
	vim.o.linespace = 1
	vim.g.neovide_scroll_animation_length = 0.3
	vim.g.neovide_scroll_animation_far_lines = 1
	-- vim.g.neovide_fullscreen = true
	vim.g.neovide_cursor_antialiasing = true
	vim.keymap.set("i", "<C-BS>", "<C-w>", { noremap = true, silent = true })
	vim.keymap.set("i", "<C-V>", "<C-R>+", { noremap = true, silent = true })
	vim.g.neovide_cursor_animation_length = 0.150
	vim.g.neovide_cursor_short_animation_length = 0.04
	vim.g.neovide_cursor_trail_size = 1.0
	vim.g.neovide_cursor_animate_in_insert_mode = true
	vim.g.neovide_cursor_animate_command_line = true
	vim.g.neovide_cursor_smooth_blink = true

	-- Scale factor / zoom configuration
	vim.g.neovide_scale_factor = 1.0

	local change_scale_factor = function(delta)
		vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
	end

	vim.keymap.set("n", "<C-=>", function()
		change_scale_factor(1.25)
	end)

	vim.keymap.set("n", "<C-->", function()
		change_scale_factor(1 / 1.25)
	end)

	vim.keymap.set("n", "<C-0>", function()
		vim.g.neovide_scale_factor = 1.0
	end)
end
