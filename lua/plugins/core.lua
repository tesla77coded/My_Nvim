return {
	-- Mason (manages external tooling)
	{ "mason-org/mason.nvim", opts = {} },

	-- LSP base config
	{ "neovim/nvim-lspconfig" },

	-- Mason-LSPConfig bridge
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = { "mason-org/mason.nvim", "neovim/nvim-lspconfig" },
		opts = { ensure_installed = { "lua_ls" } },
	},
}
