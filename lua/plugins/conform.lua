-- plugins/conform.lua
-- Modern formatter setup - handles ALL languages automatically
return {
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		config = function()
			require("conform").setup({
				-- Define formatters for each filetype
				formatters_by_ft = {
					lua = { "stylua" },
					python = { "black" },
					javascript = { "prettierd", "prettier", stop_after_first = true },
					typescript = { "prettierd", "prettier", stop_after_first = true },
					javascriptreact = { "prettierd", "prettier", stop_after_first = true },
					typescriptreact = { "prettierd", "prettier", stop_after_first = true },
					json = { "prettierd", "prettier", stop_after_first = true },
					html = { "prettierd", "prettier", stop_after_first = true },
					css = { "prettierd", "prettier", stop_after_first = true },
					scss = { "prettierd", "prettier", stop_after_first = true },
					markdown = { "prettierd", "prettier", stop_after_first = true },
					yaml = { "prettierd", "prettier", stop_after_first = true },
					-- Add more as needed
				},
				-- Format on save
				format_on_save = {
					timeout_ms = 500,
					lsp_fallback = true, -- Use LSP formatter if no formatter is configured
				},
				-- Customize formatter behavior
				formatters = {
					black = {
						prepend_args = { "--fast" },
					},
				},
			})

			-- Manual format keymap
			vim.keymap.set({ "n", "v" }, "<leader>f", function()
				require("conform").format({
					lsp_fallback = true,
					async = false,
					timeout_ms = 500,
				})
			end, { desc = "Format buffer" })
		end,
	},
}
