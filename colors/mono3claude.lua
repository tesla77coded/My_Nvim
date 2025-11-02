-- Muted Monochrome colorscheme for Neovim
-- Save this file as: ~/.config/nvim/colors/muted_mono.lua
-- Then activate with: :colorscheme muted_mono

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
	vim.cmd("syntax reset")
end

vim.g.colors_name = "muted_mono"
vim.o.background = "dark"

-- Color palette - almost monochrome with muted accents
local colors = {
	-- Grayscale base
	bg = "#1a1a1a",
	bg_light = "#252525",
	bg_lighter = "#303030",
	fg = "#c8c8c8",
	fg_dim = "#909090",
	fg_dimmer = "#606060",

	-- Muted accent colors
	yellow = "#8b8563", -- very muted yellow/beige
	green = "#6b7b6b", -- very muted sage green
	red = "#8b6b6b", -- very muted rose/burgundy

	-- Special grays
	gray = "#505050",
	gray_light = "#707070",
	dark_gray = "#333333",
	none = "NONE",
}

-- Helper function to set highlights
local function hl(group, opts)
	vim.api.nvim_set_hl(0, group, opts)
end

-- Editor highlights
hl("Normal", { fg = colors.fg, bg = colors.bg })
hl("NormalFloat", { fg = colors.fg, bg = colors.bg_light })
hl("FloatBorder", { fg = colors.gray_light, bg = colors.bg_light })
hl("ColorColumn", { bg = colors.bg_lighter })
hl("Cursor", { fg = colors.bg, bg = colors.dark_gray })
hl("CursorLine", { bg = colors.bg_lighter })
hl("CursorLineNr", { fg = colors.fg, bg = colors.bg_light })
hl("CursorWord", { bg = colors.fg_dim })
hl("CursorColumn", { bg = colors.bg_light })

-- LSP document highlight (word under cursor and references)
hl("LspReferenceText", { bg = colors.bg_lighter })
hl("LspReferenceRead", { bg = colors.bg_lighter })
hl("LspReferenceWrite", { bg = colors.bg_lighter, underline = true })
hl("LineNr", { fg = colors.gray })
hl("SignColumn", { fg = colors.gray, bg = colors.bg })
hl("VertSplit", { fg = colors.gray })
hl("StatusLine", { fg = colors.fg, bg = colors.bg_lighter })
hl("StatusLineNC", { fg = colors.fg_dim, bg = colors.bg_light })
hl("Pmenu", { fg = colors.fg, bg = colors.bg_light })
hl("PmenuSel", { fg = colors.fg, bg = colors.bg_lighter, bold = true })
hl("PmenuSbar", { bg = colors.bg_lighter })
hl("PmenuThumb", { bg = colors.gray })

-- Search and selection
hl("Search", { fg = colors.bg, bg = colors.yellow })
hl("IncSearch", { fg = colors.bg, bg = colors.yellow, bold = true })
hl("Visual", { bg = colors.bg_lighter })
hl("VisualNOS", { bg = colors.bg_lighter })

-- Syntax highlighting - mostly monochrome
hl("Comment", { fg = colors.fg_dimmer, italic = true })
hl("Constant", { fg = colors.fg })
hl("String", { fg = colors.green })
hl("Character", { fg = colors.green })
hl("Number", { fg = colors.fg })
hl("Boolean", { fg = colors.fg })
hl("Float", { fg = colors.fg })

hl("Identifier", { fg = colors.fg })
hl("Function", { fg = colors.fg, bold = true })

hl("Statement", { fg = colors.fg })
hl("Conditional", { fg = colors.fg })
hl("Repeat", { fg = colors.fg })
hl("Label", { fg = colors.fg })
hl("Operator", { fg = colors.fg_dim })
hl("Keyword", { fg = colors.fg })
hl("Exception", { fg = colors.red })

hl("PreProc", { fg = colors.fg_dim })
hl("Include", { fg = colors.fg_dim })
hl("Define", { fg = colors.fg_dim })
hl("Macro", { fg = colors.fg_dim })
hl("PreCondit", { fg = colors.fg_dim })

hl("Type", { fg = colors.fg })
hl("StorageClass", { fg = colors.fg })
hl("Structure", { fg = colors.fg })
hl("Typedef", { fg = colors.fg })

hl("Special", { fg = colors.fg })
hl("SpecialChar", { fg = colors.fg })
hl("Tag", { fg = colors.fg })
hl("Delimiter", { fg = colors.fg_dim })
hl("SpecialComment", { fg = colors.fg_dimmer, italic = true })
hl("Debug", { fg = colors.red })

-- Diff
hl("DiffAdd", { fg = colors.green, bg = colors.bg_light })
hl("DiffChange", { fg = colors.yellow, bg = colors.bg_light })
hl("DiffDelete", { fg = colors.red, bg = colors.bg_light })
hl("DiffText", { fg = colors.yellow, bg = colors.bg_lighter, bold = true })

-- Diagnostics (LSP)
hl("DiagnosticError", { fg = colors.red })
hl("DiagnosticWarn", { fg = colors.yellow })
hl("DiagnosticInfo", { fg = colors.fg_dim })
hl("DiagnosticHint", { fg = colors.fg_dimmer })

hl("DiagnosticUnderlineError", { undercurl = true, sp = colors.red })
hl("DiagnosticUnderlineWarn", { undercurl = true, sp = colors.yellow })
hl("DiagnosticUnderlineInfo", { undercurl = true, sp = colors.fg_dim })
hl("DiagnosticUnderlineHint", { undercurl = true, sp = colors.fg_dimmer })

-- Git signs
hl("GitSignsAdd", { fg = colors.green })
hl("GitSignsChange", { fg = colors.yellow })
hl("GitSignsDelete", { fg = colors.red })

-- Treesitter
hl("@variable", { fg = colors.fg })
hl("@variable.builtin", { fg = colors.fg_dim })
hl("@parameter", { fg = colors.fg })
hl("@function", { fg = colors.fg, bold = true })
hl("@function.builtin", { fg = colors.fg })
hl("@keyword", { fg = colors.fg })
hl("@keyword.function", { fg = colors.fg })
hl("@keyword.return", { fg = colors.fg })
hl("@conditional", { fg = colors.fg })
hl("@repeat", { fg = colors.fg })
hl("@string", { fg = colors.green })
hl("@comment", { fg = colors.fg_dimmer, italic = true })
hl("@type", { fg = colors.fg })
hl("@constant", { fg = colors.fg })
hl("@constant.builtin", { fg = colors.fg })

-- Miscellaneous
hl("Error", { fg = colors.red, bold = true })
hl("ErrorMsg", { fg = colors.red, bold = true })
hl("WarningMsg", { fg = colors.yellow })
hl("Title", { fg = colors.fg, bold = true })
hl("Directory", { fg = colors.fg })
hl("MatchParen", { bg = colors.bg_lighter, bold = true })
hl("Todo", { fg = colors.yellow, bg = colors.bg_light, bold = true })
hl("Underlined", { underline = true })
hl("Ignore", { fg = colors.gray })
hl("Conceal", { fg = colors.gray })
hl("NonText", { fg = colors.gray })
hl("SpecialKey", { fg = colors.gray })
hl("Whitespace", { fg = colors.gray })

-- Telescope (if installed)
hl("TelescopeBorder", { fg = colors.gray_light })
hl("TelescopeSelection", { fg = colors.fg, bg = colors.bg_lighter, bold = true })
hl("TelescopeMatching", { fg = colors.yellow, bold = true })
