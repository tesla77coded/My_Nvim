return {
	-- Mason
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
	-- Mason-LSPConfig (auto-installs servers)
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = { "mason-org/mason.nvim" },
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"vtsls",
					"eslint",
				},
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

						-- Highlight when cursor holds in normal mode
						vim.api.nvim_create_autocmd("CursorHold", {
							group = group,
							buffer = bufnr,
							callback = function()
								-- Only highlight in normal mode
								local mode = vim.api.nvim_get_mode().mode
								if mode == "n" then
									vim.lsp.buf.document_highlight()
								end
							end,
						})

						-- Clear highlights when cursor moves
						vim.api.nvim_create_autocmd("CursorMoved", {
							group = group,
							buffer = bufnr,
							callback = function()
								vim.lsp.buf.clear_references()
							end,
						})

						-- Clear highlights when entering insert mode
						vim.api.nvim_create_autocmd("InsertEnter", {
							group = group,
							buffer = bufnr,
							callback = function()
								vim.lsp.buf.clear_references()
							end,
						})

						-- Clear highlights when leaving the buffer
						vim.api.nvim_create_autocmd("BufLeave", {
							group = group,
							buffer = bufnr,
							callback = function()
								vim.lsp.buf.clear_references()
							end,
						})
					end

					-- ESLint auto-fix on save (only for eslint client)
					if client and client.name == "eslint" then
						vim.api.nvim_create_autocmd("BufWritePre", {
							buffer = bufnr,
							command = "EslintFixAll",
						})
					end
				end,
			})

			-- Lua LSP (uses config from nvim-lspconfig/lsp/lua_ls.lua)
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

			-- ESLint with auto-fix on save
			vim.lsp.config("eslint", {
				settings = {
					workingDirectory = { mode = "auto" },
				},
			})

			-- Enable all configured servers
			vim.lsp.enable({ "lua_ls", "vtsls", "eslint" })

			vim.opt.updatetime = 200
		end,
	},
}
