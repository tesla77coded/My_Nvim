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
--  Window focus cycle (jump between splits/explorer/explorer/notifications)
map("n", "<leader>w", "<C-w>w", opts("Next Window"))
-- Save file
map("n", "<leader>s", "<cmd>w<cr>", opts("Save File"))
-- Buffers
map("n", "<S-h>", "<cmd>bprevious<cr>", opts("Prev Buffer"))
map("n", "<S-l>", "<cmd>bnext<cr>", opts("Next Buffer"))
map("n", "<leader>bd", "<cmd>bdelete<cr>", opts("Delete Buffer"))
-- Clear search highlights
map("n", "<esc>", "<cmd>nohlsearch<cr>", opts("Clear Search"))
-- Lazy manager
map("n", "<leader>l", "<cmd>Lazy<CR>", { desc = "Open Lazy plugin manager" })
-- Normal mode: move current line
map("n", "<A-j>", "<cmd>move .+1<cr>==", opts("Move Line Down"))
map("n", "<A-k>", "<cmd>move .-2<cr>==", opts("Move Line Up"))
-- Insert mode: move current line and stay in insert
map("i", "<A-j>", "<Esc><cmd>move .+1<cr>==gi", opts("Move Line Down"))
map("i", "<A-k>", "<Esc><cmd>move .-2<cr>==gi", opts("Move Line Up"))
-- Visual mode: move selected lines
map("v", "<A-j>", ":move '>+1<cr>gv=gv", opts("Move Lines Down"))
map("v", "<A-k>", ":move '<-2<cr>gv=gv", opts("Move Lines Up"))
-- Yank line without new line character
map("n", "yy", "^y$")
-- Select current line
map("n", "vv", "V", opts("Select the line under the cursor"))
-- Increment/Decrement
map("n", "=", "<C-a>")
map("n", "-", "<C-x>")

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
map("n", "<leader>lr", "<cmd>LspRestart<cr>", opts("Restart LSP"))

-- Diagnostics (now using Trouble)
map("n", "<leader>cd", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", opts("Buffer Diagnostics (Trouble)"))
map("n", "[d", function()
	vim.diagnostic.jump({ count = -1 })
end)
map("n", "]d", function()
	vim.diagnostic.jump({ count = 1 })
end)
map("n", "<leader>cl", "<cmd>Trouble diagnostics toggle<cr>", opts("All Diagnostics (Trouble)"))

----------------------------------------------------------------
-- Trouble.nvim
----------------------------------------------------------------
map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", opts("Diagnostics (Trouble)"))
map("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", opts("Buffer Diagnostics (Trouble)"))
map("n", "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", opts("Symbols (Trouble)"))
map("n", "<leader>xL", "<cmd>Trouble loclist toggle<cr>", opts("Location List (Trouble)"))
map("n", "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", opts("Quickfix List (Trouble)"))
map("n", "<leader>xr", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", opts("LSP References (Trouble)"))

----------------------------------------------------------------
-- Snacks (picker + explorer)
----------------------------------------------------------------
local ok_snacks, snacks = pcall(require, "snacks")
if ok_snacks then
	map("n", "<leader><space>", function()
		snacks.picker.files()
	end, opts("Find Files"))
end

-- Open snacks explorer at current file
vim.keymap.set("n", "<leader>e", function()
	require("snacks").explorer({ cwd = vim.fn.expand("%:p:h") })
end, { desc = "Explorer at current file" })

-- Snacks picker keymaps
vim.keymap.set("n", "<leader>ff", function()
	require("snacks").picker.files()
end, { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", function()
	require("snacks").picker.grep()
end, { desc = "Live grep (search in files)" })
vim.keymap.set("n", "<leader>fb", function()
	require("snacks").picker.buffers()
end, { desc = "Find buffers" })
vim.keymap.set("n", "<leader>fw", function()
	require("snacks").picker.grep_word()
end, { desc = "Grep word under cursor" })
vim.keymap.set("n", "<leader>fr", function()
	require("snacks").picker.recent()
end, { desc = "Recent files" })
