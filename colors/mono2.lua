-- Muted monochrome+accents theme (no deps)
-- Save as: ~/.config/nvim/colors/mono.lua

local M = {}

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

	red = "#b26a6a",
	green = "#7a9b7c",
	blue = "#7b8fa8",
	yellow = "#a39b75",
}

local function hi(g, o)
	vim.api.nvim_set_hl(0, g, o)
end

function M.setup()
	vim.cmd("highlight clear")
	if vim.fn.exists("syntax_on") == 1 then
		vim.cmd("syntax reset")
	end
	vim.o.termguicolors = true
	vim.g.colors_name = "mono"

	local bg, fg = "NONE", P.g95

	----------------------------------------------------------------------
	-- editor UI
	----------------------------------------------------------------------
	hi("Normal", { fg = fg, bg = bg })
	hi("NormalNC", { fg = P.g90, bg = bg })
	hi("LineNr", { fg = P.g70 })
	hi("CursorLineNr", { fg = P.g99, bold = true })
	hi("CursorLine", { bg = P.g20 })
	hi("VertSplit", { fg = P.g40 })
	hi("StatusLine", { fg = P.g99, bg = P.g30 })
	hi("StatusLineNC", { fg = P.g80, bg = P.g20 })
	hi("Visual", { bg = P.g30 })
	hi("Search", { fg = P.g10, bg = P.g90, bold = true })
	hi("MatchParen", { fg = P.g99, underline = true })

	----------------------------------------------------------------------
	-- diagnostics
	----------------------------------------------------------------------
	hi("DiagnosticError", { fg = P.red })
	hi("DiagnosticWarn", { fg = P.yellow })
	hi("DiagnosticInfo", { fg = P.blue })
	hi("DiagnosticHint", { fg = P.green })
	hi("DiagnosticUnderlineError", { undercurl = true, sp = P.red })
	hi("DiagnosticUnderlineWarn", { underline = true, sp = P.yellow })

	----------------------------------------------------------------------
	-- syntax accents
	----------------------------------------------------------------------
	hi("Comment", { fg = P.g70, italic = true })
	hi("String", { fg = P.green })
	hi("Number", { fg = P.yellow })
	hi("Boolean", { fg = P.yellow, bold = true })
	hi("Function", { fg = P.blue })
	hi("Identifier", { fg = P.g95 })
	hi("Keyword", { fg = P.yellow, bold = true })
	hi("Statement", { fg = P.yellow, bold = true })
	hi("Type", { fg = P.blue, italic = true })
	hi("Operator", { fg = P.g95 })
	hi("Constant", { fg = P.yellow })
	hi("Error", { fg = P.red, bold = true })

	----------------------------------------------------------------------
	-- treesitter mirrors
	----------------------------------------------------------------------
	hi("@comment", { link = "Comment" })
	hi("@string", { link = "String" })
	hi("@number", { link = "Number" })
	hi("@boolean", { link = "Boolean" })
	hi("@function", { link = "Function" })
	hi("@keyword", { link = "Keyword" })
	hi("@type", { link = "Type" })
	hi("@operator", { link = "Operator" })
	hi("@variable", { fg = P.g95 })
	hi("@constant", { link = "Constant" })

	-- cursorword highlight (for mini.cursorword or illuminate)
	-- hi("CursorWord", { bg = P.g20, underline = true })
	-- hi("CursorWord0", { link = "CursorWord" })
	-- hi("CursorWord1", { link = "CursorWord" })
	-- hi("CursorWord2", { link = "CursorWord" })
end

M.setup()
return M
