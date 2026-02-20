-- colors/clean-dark.lua
-- Clean, high-clarity dark theme for low-light environments

local colors = {
	-- Backgrounds (cool dark, calm)
	bg = "#1c1e26", -- deep blue-gray base
	bg1 = "#232530", -- subtle first tier
	bg2 = "#2e303e", -- gentle highlight
	bg3 = "#3e4057", -- borders/subtle UI
	bg4 = "#4e5166", -- stronger contrast

	-- Foregrounds (warm cream tones)
	fg = "#d4cfc9", -- soft beige
	fg1 = "#e8e3dd", -- brighter cream
	fg2 = "#b8b3ad", -- dimmer gray-beige

	-- Core accents (warmer, more saturated for dark)
	yellow_muted = "#d4a574", -- peachy gold
	green_muted = "#7eb895", -- soft sage green

	-- Supporting colors
	white = "#ffffff",
	black = "#0f1117",
	brown = "#c98a6a", -- terracotta
	quartz = "#6ba4b8", -- soft teal-blue
	niagara = "#7fa7d4", -- periwinkle blue
	wisteria = "#a68fd1", -- soft lavender
	red = "#d67676", -- muted coral red

	-- UI / semantic
	comment = "#6b8a7a", -- muted green-gray
	special_return = "#7fa7d4",
	cursor_insert = "#8b8681",
	cursor_normal = "#b8b3ad",
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
vim.o.background = "dark"
vim.g.colors_name = "clean-dark"

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
hl("Search", { fg = colors.black, bg = colors.brown })
hl("IncSearch", { fg = colors.black, bg = colors.niagara })
hl("CurSearch", { fg = colors.black, bg = colors.yellow_muted })
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
hl("PmenuSel", { fg = colors.black, bg = colors.yellow_muted })
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
