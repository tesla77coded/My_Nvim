-- Minimal muted monochrome theme (no deps)
-- Save as: ~/.config/nvim/colors/mono.lua

local M = {}

-- palette (muted greys)
local P = {
	g00 = "#0f1012",
	g10 = "#16181b",
	g20 = "#1e2024",
	g30 = "#272a2f",
	g40 = "#31353b",
	g50 = "#3d4249",
	g60 = "#4b5159",
	g70 = "#5a616b",
	g80 = "#747c87",
	g90 = "#a8adb5",
	g95 = "#c7cbd1",
	g99 = "#e7e9ec",
}

-- helpers
local function hi(group, opts)
	vim.api.nvim_set_hl(0, group, opts)
end

function M.setup()
	-- don’t fight the terminal: leave background alone by default
	-- set this to a grey if you want a fixed bg, e.g. bg = P.g10
	local bg = "NONE"
	local fg = P.g95

	vim.cmd("highlight clear")
	if vim.fn.exists("syntax_on") == 1 then
		vim.cmd("syntax reset")
	end
	vim.o.termguicolors = true
	vim.g.colors_name = "mono"

	-- editor
	hi("Normal", { fg = fg, bg = bg })
	hi("NormalNC", { fg = P.g90, bg = bg })
	hi("LineNr", { fg = P.g70, bg = bg })
	hi("CursorLineNr", { fg = P.g99, bold = true })
	hi("CursorLine", { bg = P.g20 })
	hi("CursorColumn", { bg = P.g20 })
	hi("SignColumn", { bg = bg })
	hi("VertSplit", { fg = P.g40, bg = bg })
	hi("WinSeparator", { fg = P.g40, bg = bg })
	hi("Folded", { fg = P.g80, bg = P.g20, italic = true })
	hi("FoldColumn", { fg = P.g70, bg = bg })

	-- search
	hi("Search", { fg = P.g10, bg = P.g90, bold = true })
	hi("IncSearch", { fg = P.g10, bg = P.g95, bold = true })
	hi("MatchParen", { fg = P.g99, underline = true, bold = true })

	-- selections
	hi("Visual", { bg = P.g30 })
	hi("VisualNOS", { bg = P.g30 })

	-- popup/menu/status
	hi("Pmenu", { fg = P.g95, bg = P.g20 })
	hi("PmenuSel", { fg = P.g10, bg = P.g90, bold = true })
	hi("PmenuSbar", { bg = P.g30 })
	hi("PmenuThumb", { bg = P.g40 })
	hi("StatusLine", { fg = P.g99, bg = P.g30 })
	hi("StatusLineNC", { fg = P.g80, bg = P.g20 })
	hi("TabLine", { fg = P.g80, bg = P.g20 })
	hi("TabLineSel", { fg = P.g10, bg = P.g95, bold = true })
	hi("TabLineFill", { fg = P.g70, bg = P.g20 })

	-- whitespace & misc
	hi("NonText", { fg = P.g60 })
	hi("Whitespace", { fg = P.g50 })
	hi("SpecialKey", { fg = P.g60 })
	hi("Todo", { fg = P.g10, bg = P.g95, bold = true })

	-- diagnostics: keep monochrome; use underline styles for severity
	hi("DiagnosticError", { fg = P.g95 })
	hi("DiagnosticWarn", { fg = P.g95 })
	hi("DiagnosticInfo", { fg = P.g95 })
	hi("DiagnosticHint", { fg = P.g95 })
	hi("DiagnosticUnderlineError", { undercurl = true, sp = P.g80 })
	hi("DiagnosticUnderlineWarn", { underline = true })
	hi("DiagnosticUnderlineInfo", { underline = true })
	hi("DiagnosticUnderlineHint", { underline = true })

	-- syntax (link many groups to keep palette minimal)
	hi("Comment", { fg = P.g70, italic = true })
	hi("Constant", { fg = P.g95 })
	hi("String", { fg = P.g90 })
	hi("Character", { link = "String" })
	hi("Number", { fg = P.g95 })
	hi("Boolean", { fg = P.g95, bold = true })
	hi("Float", { link = "Number" })

	hi("Identifier", { fg = P.g95 })
	hi("Function", { fg = P.g99 })

	hi("Statement", { fg = P.g95, bold = true })
	hi("Conditional", { link = "Statement" })
	hi("Repeat", { link = "Statement" })
	hi("Label", { link = "Statement" })
	hi("Operator", { fg = P.g95 })
	hi("Keyword", { fg = P.g95, bold = true })

	hi("PreProc", { fg = P.g95 })
	hi("Include", { link = "PreProc" })
	hi("Define", { link = "PreProc" })
	hi("Macro", { link = "PreProc" })

	hi("Type", { fg = P.g95, italic = true })
	hi("StorageClass", { link = "Type" })
	hi("Structure", { link = "Type" })
	hi("Typedef", { link = "Type" })

	hi("Special", { fg = P.g95 })
	hi("Delimiter", { fg = P.g90 })
	hi("Directory", { fg = P.g95 })
	hi("Error", { fg = P.g99, bg = P.g10, bold = true })

	-- Treesitter minimal links (keep monochrome)
	hi("@comment", { link = "Comment" })
	hi("@string", { link = "String" })
	hi("@number", { link = "Number" })
	hi("@boolean", { link = "Boolean" })
	hi("@constant", { link = "Constant" })
	hi("@constant.builtin", { link = "Constant" })
	hi("@identifier", { link = "Identifier" })
	hi("@function", { link = "Function" })
	hi("@keyword", { link = "Keyword" })
	hi("@type", { link = "Type" })
	hi("@operator", { link = "Operator" })
	hi("@punctuation", { link = "Delimiter" })
end

M.setup()
return M
