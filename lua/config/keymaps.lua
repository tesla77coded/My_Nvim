-- lua/config/keymaps.lua

local map = vim.keymap.set
local opts = function(desc)
	return { noremap = true, silent = true, desc = desc }
end

----------------------------------------------------------------
-- General / Editing
----------------------------------------------------------------
-- Esc alternative
map("i", "jk", "<Esc>", opts("Exit Insert"))

-- Window focus cycle (jumps between splits/explorer/editor)
map("n", "<leader>w", "<C-w>w", opts("Next Window"))

-- Buffers
map("n", "<S-h>", "<cmd>bprevious<cr>", opts("Prev Buffer"))
map("n", "<S-l>", "<cmd>bnext<cr>", opts("Next Buffer"))
map("n", "<leader>bd", "<cmd>bdelete<cr>", opts("Delete Buffer"))

-- Clear search highlights
map("n", "<esc>", "<cmd>nohlsearch<cr>", opts("Clear Search"))

-- Lazy manager
map("n", "<leader>l", "<cmd>Lazy<CR>", { desc = "Open Lazy plugin manager" })
----------------------------------------------------------------
-- LSP
----------------------------------------------------------------
map("n", "K", vim.lsp.buf.hover, opts("Hover"))
map("n", "gd", vim.lsp.buf.definition, opts("Goto Definition"))
map("n", "gD", vim.lsp.buf.declaration, opts("Goto Declaration"))
map("n", "gi", vim.lsp.buf.implementation, opts("Goto Implementation"))
map("n", "gr", vim.lsp.buf.references, opts("References"))
map("n", "<leader>rn", vim.lsp.buf.rename, opts("Rename"))
map("n", "<leader>ca", vim.lsp.buf.code_action, opts("Code Action"))
map("n", "<leader>cf", function()
	vim.lsp.buf.format({ async = true })
end, opts("Format"))

-- Diagnostics (Neovim 0.11+)
map("n", "<leader>cd", vim.diagnostic.open_float, opts("Line Diagnostics"))
map("n", "]d", vim.diagnostic.goto_next, opts("Next Diagnostic"))
map("n", "[d", vim.diagnostic.goto_prev, opts("Prev Diagnostic"))
map("n", "<leader>cl", vim.diagnostic.setloclist, opts("Diagnostics → Loclist"))

----------------------------------------------------------------
-- Snacks (picker + explorer)
----------------------------------------------------------------
local ok_snacks, snacks = pcall(require, "snacks")
if ok_snacks then
	map("n", "<leader><space>", function()
		snacks.picker.files()
	end, opts("Find Files"))
	map("n", "<leader>e", function()
		snacks.explorer()
	end, opts("Explorer"))
end

----------------------------------------------------------------
-- which-key groups (if available)
----------------------------------------------------------------
local ok_wk, wk = pcall(require, "which-key")
if ok_wk then
	wk.add({
		{ "<leader>c", group = "Code/LSP" },
		{ "<leader>d", group = "Debug" },
		{ "<leader>e", group = "Explorer" },
		{ "<leader>f", group = "Find" },
		{ "<leader>g", group = "Git" },
		{ "<leader>b", group = "Buffers" },
		{ "<leader>w", group = "Windows" },
	})
end
