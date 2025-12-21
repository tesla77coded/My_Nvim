-- colors/clean-light.lua
-- Clean, high-clarity light theme for bright environments

local colors = {
	-- Backgrounds (paper-like, stable)
	bg = "#f4f1ed",
	bg1 = "#ebe6df",
	bg2 = "#e2ddd6",
	bg3 = "#d6d0c8",
	bg4 = "#c9c2b9",

	-- Foregrounds (ink-like)
	fg = "#2f2c28",
	fg1 = "#1f1d1a",
	fg2 = "#3a3733",

	-- Core accents (not muted, not neon)
	yellow_muted = "#8f7f2a", -- olive-gold
	green_muted = "#2f7f5f", -- clean green

	-- Supporting colors
	white = "#ffffff",
	black = "#151412",
	brown = "#8a5a32", -- rust brown
	quartz = "#2f6f7f", -- teal-blue
	niagara = "#2f5f9f", -- steel blue
	wisteria = "#6a5fa8", -- indigo-violet
	red = "#b03a3a", -- controlled red

	-- UI / semantic
	comment = "#3f7f5f", -- green, readable
	special_return = "#2f5f9f",
	cursor_insert = "#ababab",
	cursor_normal = "#7a7268",
}

-- Derived
local bg_dark = colors.bg
local bg_light = colors.bg1
local fg_dim = colors.comment

-- Helper
local function hl(group, opts)
	vim.api.nvim_set_hl(0, group, opts)
end

-- Reset
vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then
	vim.cmd("syntax reset")
end
vim.o.background = "light"
vim.g.colors_name = "clean-light"

-- ========================
-- Editor
-- ========================
hl("Normal", { fg = colors.fg, bg = colors.bg })
hl("NormalNC", { fg = colors.fg, bg = colors.bg })
hl("NormalFloat", { fg = colors.fg, bg = bg_dark })
hl("Cursor", { fg = colors.bg, bg = colors.cursor_normal })
hl("CursorInsert", { fg = colors.bg, bg = colors.cursor_insert })
hl("lCursor", { fg = colors.bg, bg = colors.yellow_muted })
hl("CursorLine", { bg = bg_light })
hl("CursorColumn", { bg = bg_light })
hl("ColorColumn", { bg = colors.bg3 })

-- ========================
-- Line numbers & columns
-- ========================
hl("LineNr", { fg = colors.bg4 })
hl("CursorLineNr", { fg = colors.yellow_muted, bold = true })
hl("SignColumn", { fg = colors.bg4, bg = colors.bg })
hl("FoldColumn", { fg = colors.bg4, bg = colors.bg })
hl("Folded", { fg = colors.bg4, bg = colors.bg3, italic = true })

-- ========================
-- Search & selection
-- ========================
hl("Search", { fg = colors.white, bg = colors.brown })
hl("IncSearch", { fg = colors.white, bg = colors.niagara })
hl("CurSearch", { fg = colors.white, bg = colors.yellow_muted })
hl("Visual", { bg = colors.bg4 })
hl("VisualNOS", { bg = colors.bg4 })

-- ========================
-- Messages
-- ========================
hl("ErrorMsg", { fg = colors.red, bold = true })
hl("WarningMsg", { fg = colors.brown })
hl("MoreMsg", { fg = colors.niagara })
hl("Question", { fg = colors.niagara })
hl("ModeMsg", { fg = colors.yellow_muted, bold = true })

-- ========================
-- Statusline & tabs
-- ========================
hl("StatusLine", { fg = colors.fg, bg = colors.bg1, bold = true })
hl("StatusLineNC", { fg = fg_dim, bg = colors.bg2 })
hl("TabLine", { fg = fg_dim, bg = colors.bg })
hl("TabLineSel", { fg = colors.yellow_muted, bg = colors.bg2, bold = true })
hl("TabLineFill", { bg = "None" })

-- ========================
-- Popups & menus
-- ========================
hl("Pmenu", { fg = colors.fg, bg = colors.bg2 })
hl("PmenuSel", { fg = colors.white, bg = colors.yellow_muted })
hl("PmenuSbar", { bg = colors.bg3 })
hl("PmenuThumb", { bg = colors.quartz })

-- ========================
-- Splits
-- ========================
hl("VertSplit", { fg = colors.bg3 })
hl("WinSeparator", { fg = colors.bg3 })

-- ========================
-- Diff
-- ========================
hl("DiffAdd", { fg = colors.green_muted, bg = colors.bg2 })
hl("DiffChange", { fg = colors.brown, bg = colors.bg2 })
hl("DiffDelete", { fg = colors.red, bg = colors.bg2 })
hl("DiffText", { fg = colors.yellow_muted, bg = colors.bg3, bold = true })

-- ========================
-- Syntax
-- ========================
hl("Comment", { fg = colors.comment, italic = true })
hl("Identifier", { fg = colors.fg })
hl("Function", { fg = colors.yellow_muted, bold = true })
hl("Type", { fg = colors.yellow_muted })
hl("Statement", { fg = colors.yellow_muted })
hl("Keyword", { fg = colors.yellow_muted, bold = true })
hl("Operator", { fg = colors.fg })
hl("Conditional", { fg = colors.yellow_muted, bold = true })
hl("Repeat", { fg = colors.yellow_muted, bold = true })
hl("String", { fg = colors.green_muted })
hl("Character", { fg = colors.green_muted })
hl("Number", { fg = colors.yellow_muted })
hl("Boolean", { fg = colors.yellow_muted })
hl("Float", { fg = colors.yellow_muted })
hl("Constant", { fg = colors.quartz })
hl("Special", { fg = colors.brown })
hl("SpecialComment", { fg = colors.wisteria })
hl("Todo", { fg = colors.fg1, bg = colors.bg4, bold = true })
hl("Error", { fg = colors.red, bold = true })

-- ========================
-- Treesitter essentials
-- ========================
hl("@comment", { fg = colors.comment, italic = true })
hl("@function", { fg = colors.yellow_muted, bold = true })
hl("@keyword", { fg = colors.yellow_muted, bold = true })
hl("@keyword.return", { fg = colors.special_return, bold = true })
hl("@string", { fg = colors.green_muted })
hl("@type", { fg = colors.yellow_muted })
hl("@constant", { fg = colors.quartz })

-- ========================
-- Diagnostics
-- ========================
hl("DiagnosticError", { fg = colors.red })
hl("DiagnosticWarn", { fg = colors.brown })
hl("DiagnosticInfo", { fg = colors.niagara })
hl("DiagnosticHint", { fg = colors.wisteria })
