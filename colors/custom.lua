-- colors/gruber-muted.lua
-- Gruber-darker inspired colorscheme with muted yellow and green

local colors = {
	-- Base gruber-darker colors
	bg = "#181818",
	bg1 = "#282828",
	bg2 = "#453d41",
	bg3 = "#484848",
	bg4 = "#52494e",

	fg = "#e4e4ef",
	fg1 = "#f4f4ff",
	fg2 = "#f5f5f5",

	-- Muted versions of gruber-darker's bright colors
	-- Original yellow: #ffdd33 -> Muted to #ccb028
	yellow_muted = "#ccb028",
	-- Original green: #73d936 -> Muted to #5fa830"
	green_muted = "#5fa830",

	-- Other gruber-darker colors (kept as-is)
	white = "#ffffff",
	black = "#000000",
	brown = "#cc8c3c",
	quartz = "#95a99f",
	niagara = "#96a6c8",
	wisteria = "#9e95c7",
	red = "#f43841",

	-- UI colors
	comment = "#73707e",
	special_return = "#f4845f",
	cursor_insert = "#dda15e",
	cursor_normal = "#ccb794",
}

-- Derived shades
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
vim.g.colors_name = "gruber-muted"

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
hl("LineNr", { fg = colors.quartz })
hl("CursorLineNr", { fg = colors.yellow_muted, bold = true })
hl("SignColumn", { fg = colors.quartz, bg = colors.bg })
hl("FoldColumn", { fg = colors.quartz, bg = colors.bg })
hl("Folded", { fg = colors.quartz, bg = colors.bg3, italic = true })

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
hl("TabLine", { fg = fg_dim, bg = colors.bg1 })
hl("TabLineSel", { fg = colors.yellow_muted, bg = colors.bg, bold = true })
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
-- Classic syntax (Gruber-darker style)
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
hl("String", { fg = colors.green_muted, italic = true })
hl("Character", { fg = colors.green_muted })
hl("Number", { fg = colors.yellow_muted })
hl("Boolean", { fg = colors.yellow_muted })
hl("Float", { fg = colors.yellow_muted })
hl("Constant", { fg = colors.quartz })
hl("Delimiter", { fg = colors.fg })
hl("Special", { fg = colors.brown })
hl("SpecialChar", { fg = colors.brown })
hl("SpecialComment", { fg = colors.wisteria })
hl("Todo", { fg = colors.fg1, bg = colors.bg4, bold = true })
hl("Underlined", { underline = true })
hl("Ignore", { fg = fg_dim })
hl("Error", { fg = colors.red, bold = true })

-- ========================
-- Preprocessor & Macros
-- ========================
hl("PreProc", { fg = colors.brown })
hl("Include", { fg = colors.brown })
hl("Define", { fg = colors.brown })
hl("Macro", { fg = colors.brown })
hl("PreCondit", { fg = colors.brown })

-- ========================
-- Treesitter (Gruber-darker style)
-- ========================
hl("@comment", { fg = colors.comment, italic = true })
hl("@variable", { fg = colors.fg })
hl("@variable.builtin", { fg = colors.quartz })
hl("@variable.parameter", { fg = colors.fg })
hl("@variable.member", { fg = colors.fg })

hl("@function", { fg = colors.yellow_muted, bold = true })
hl("@function.builtin", { fg = colors.yellow_muted })
hl("@function.call", { fg = colors.yellow_muted })
hl("@function.macro", { fg = colors.brown })
hl("@function.method", { fg = colors.yellow_muted })

hl("@keyword", { fg = colors.yellow_muted, bold = true })
hl("@keyword.function", { fg = colors.yellow_muted, bold = true })
hl("@keyword.operator", { fg = colors.yellow_muted })
hl("@keyword.return", { fg = colors.special_return, bold = true })

hl("@operator", { fg = colors.fg })
hl("@string", { fg = colors.green_muted, italic = true })
hl("@string.escape", { fg = colors.brown })
hl("@string.special", { fg = colors.brown })
hl("@number", { fg = colors.yellow_muted })
hl("@boolean", { fg = colors.yellow_muted })
hl("@float", { fg = colors.yellow_muted })

hl("@type", { fg = colors.yellow_muted })
hl("@type.builtin", { fg = colors.yellow_muted })
hl("@type.definition", { fg = colors.yellow_muted })

hl("@constant", { fg = colors.quartz })
hl("@constant.builtin", { fg = colors.quartz })
hl("@constant.macro", { fg = colors.brown })

hl("@property", { fg = colors.fg })
hl("@attribute", { fg = colors.brown })
hl("@constructor", { fg = colors.yellow_muted })

hl("@punctuation.delimiter", { fg = colors.fg })
hl("@punctuation.bracket", { fg = colors.fg })
hl("@punctuation.special", { fg = colors.brown })

hl("@tag", { fg = colors.yellow_muted })
hl("@tag.attribute", { fg = colors.brown })
hl("@tag.delimiter", { fg = colors.fg })

-- ========================
-- LSP
-- ========================
hl("DiagnosticError", { fg = colors.red })
hl("DiagnosticWarn", { fg = colors.brown })
hl("DiagnosticInfo", { fg = colors.niagara })
hl("DiagnosticHint", { fg = colors.wisteria })

hl("DiagnosticUnderlineError", { undercurl = true, sp = colors.red })
hl("DiagnosticUnderlineWarn", { undercurl = true, sp = colors.brown })
hl("DiagnosticUnderlineInfo", { undercurl = true, sp = colors.niagara })
hl("DiagnosticUnderlineHint", { undercurl = true, sp = colors.wisteria })

hl("LspReferenceText", { bg = colors.bg3 })
hl("LspReferenceRead", { bg = colors.bg3 })
hl("LspReferenceWrite", { bg = colors.bg3, bold = true })

-- ========================
-- Git signs (gitsigns.nvim)
-- ========================
hl("GitSignsAdd", { fg = colors.green_muted })
hl("GitSignsChange", { fg = colors.brown })
hl("GitSignsDelete", { fg = colors.red })

-- ========================
-- Telescope
-- ========================
hl("TelescopeBorder", { fg = colors.quartz })
hl("TelescopePromptBorder", { fg = colors.yellow_muted })
hl("TelescopeResultsBorder", { fg = colors.quartz })
hl("TelescopePreviewBorder", { fg = colors.quartz })
hl("TelescopeSelection", { fg = colors.yellow_muted, bg = colors.bg2, bold = true })
hl("TelescopeSelectionCaret", { fg = colors.yellow_muted })
hl("TelescopeMatching", { fg = colors.niagara, bold = true })

-- ========================
-- NvimTree / Neo-tree
-- ========================
hl("NvimTreeFolderName", { fg = colors.niagara })
hl("NvimTreeOpenedFolderName", { fg = colors.yellow_muted, bold = true })
hl("NvimTreeRootFolder", { fg = colors.yellow_muted, bold = true })
hl("NvimTreeGitDirty", { fg = colors.brown })
hl("NvimTreeGitNew", { fg = colors.green_muted })
hl("NvimTreeGitDeleted", { fg = colors.red })

-- ========================
-- Which-key
-- ========================
hl("WhichKey", { fg = colors.yellow_muted, bold = true })
hl("WhichKeyGroup", { fg = colors.niagara })
hl("WhichKeyDesc", { fg = colors.fg })
hl("WhichKeySeparator", { fg = colors.comment })
