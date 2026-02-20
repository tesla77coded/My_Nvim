return {
	-- Mason - Package manager for LSP servers, formatters, linters
	{
		"mason-org/mason.nvim",
		config = function()
			require("mason").setup({
				ui = {
					border = "rounded",
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})
		end,
	},
	-- Mason-LSPConfig - Auto-installs LSP servers
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = { "mason-org/mason.nvim" },
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					-- "lua_ls",
					"vtsls",
					-- REMOVED: "eslint",
					"pyright",
					"ruff",
				},
			})
		end,
	},
	-- Mason-Tool-Installer - Auto-installs formatters and linters
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "mason-org/mason.nvim" },
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					-- Formatters
					"stylua", -- Lua
					"prettierd",
					"ruff",
				},
				auto_update = false,
				run_on_start = true,
			})
		end,
	},
	-- Native Neovim 0.11+ LSP Configuration
	{
		"neovim/nvim-lspconfig",
		dependencies = { "mason-org/mason-lspconfig.nvim" },
		config = function()
			-- Setup autocmd for LSP attach with keybindings and document highlight
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(event)
					local bufnr = event.buf
					local client = vim.lsp.get_client_by_id(event.data.client_id)
					-- Setup keybindings
					local opts = { buffer = bufnr, noremap = true, silent = true }
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
					vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
					vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
					vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
					vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
					vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
					-- LSP Document highlight: ONLY in normal mode, ONLY for LSP symbols
					if client and client.server_capabilities.documentHighlightProvider then
						local group = vim.api.nvim_create_augroup("LSPDocumentHighlight_" .. bufnr, { clear = true })
						vim.api.nvim_create_autocmd("CursorHold", {
							group = group,
							buffer = bufnr,
							callback = function()
								local mode = vim.api.nvim_get_mode().mode
								if mode == "n" then
									vim.lsp.buf.document_highlight()
								end
							end,
						})
						vim.api.nvim_create_autocmd("CursorMoved", {
							group = group,
							buffer = bufnr,
							callback = function()
								vim.lsp.buf.clear_references()
							end,
						})
						vim.api.nvim_create_autocmd("InsertEnter", {
							group = group,
							buffer = bufnr,
							callback = function()
								vim.lsp.buf.clear_references()
							end,
						})
						vim.api.nvim_create_autocmd("BufLeave", {
							group = group,
							buffer = bufnr,
							callback = function()
								vim.lsp.buf.clear_references()
							end,
						})
					end
					-- REMOVED: ESLint auto-fix on save section
				end,
			})
			-- Lua LSP
			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						runtime = { version = "LuaJIT" },
						diagnostics = { globals = { "vim" } },
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true),
							checkThirdParty = false,
						},
						telemetry = { enable = false },
					},
				},
			})
			-- VTSLS (TypeScript/JavaScript)
			vim.lsp.config("vtsls", {
				settings = {
					typescript = {
						suggest = { completeFunctionCalls = true },
						inlayHints = {
							parameterNames = { enabled = "literals" },
							parameterTypes = { enabled = true },
							variableTypes = { enabled = false },
							propertyDeclarationTypes = { enabled = true },
							functionLikeReturnTypes = { enabled = true },
							enumMemberValues = { enabled = true },
						},
					},
					javascript = {
						suggest = { completeFunctionCalls = true },
						inlayHints = {
							parameterNames = { enabled = "literals" },
							parameterTypes = { enabled = true },
							variableTypes = { enabled = false },
							propertyDeclarationTypes = { enabled = true },
							functionLikeReturnTypes = { enabled = true },
							enumMemberValues = { enabled = true },
						},
					},
				},
			})
			-- REMOVED: ESLint config section
			-- Pyright (Python type checking)
			vim.lsp.config("pyright", {
				settings = {
					python = {
						analysis = {
							typeCheckingMode = "basic",
							autoSearchPaths = true,
							useLibraryCodeForTypes = true,
							diagnosticMode = "openFilesOnly",
							-- Disable diagnostics that Ruff already handles
							diagnosticSeverityOverrides = {
								reportUnusedImport = "none",
								reportUnusedVariable = "none",
								reportUndefinedVariable = "none",
							},
						},
					},
				},
			})
			-- Ruff (Python linting - ultra-fast)
			vim.lsp.config("ruff", {})
			-- Enable all configured servers (REMOVED: eslint)
			vim.lsp.enable({ "lua_ls", "vtsls", "pyright", "ruff" })
			vim.opt.updatetime = 200
		end,
	},
}
