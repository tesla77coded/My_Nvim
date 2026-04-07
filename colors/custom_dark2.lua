-- colors/clean-dark.lua
-- Clean, high-clarity dark theme — dark counterpart to clean-light
local colors = {
	-- Backgrounds (warm charcoal, stable)
	bg = "#1c1a18", -- deep warm dark base
	bg1 = "#242220", -- subtle first tier
	bg2 = "#2e2b28", -- gentle highlight
	bg3 = "#3a3632", -- borders/subtle UI
	bg4 = "#4a4642", -- stronger contrast
	-- Foregrounds (warm paper-like)
	fg = "#d8d0c8", -- warm off-white, easy on eyes
	fg1 = "#e8e0d8", -- brightest text
	fg2 = "#b8b0a8", -- dimmer text
	-- Core accents (lifted for dark bg readability)
	yellow_muted = "#d4aa40", -- warm golden yellow
	green_muted = "#5ab388", -- lifted forest green
	-- Supporting colors
	white = "#f0e8e0",
	black = "#0e0c0a",
	brown = "#d4845a", -- lifted warm rust/orange
	quartz = "#5ab0c4", -- lifted teal
	niagara = "#6090d4", -- lifted confident blue
	wisteria = "#a890e0", -- lifted violet
	red = "#e06060", -- lifted red
	-- UI / semantic
	comment = "#7aaa8c", -- lifted muted green
	special_return = "#6090d4",
	cursor_insert = "#808080",
	cursor_normal = "#a09890",
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
hl("StatusLine", { bold = false, fg = colors.fg, bg = colors.bg1 })
hl("StatusLineNC", { bold = false, fg = fg_dim, bg = colors.bg2 })
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
