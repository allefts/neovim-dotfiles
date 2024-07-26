return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				PATH = "prepend",
			})
		end
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup(
				{
					ensure_installed = {"lua_ls", "eslint", "elixirls", "tsserver", "clangd"}
				}
			)
		end
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({})
			lspconfig.tsserver.setup({})
			lspconfig.elixirls.setup({
				cmd = {"/Users/allefts/.elixir-ls/release/language_server.sh"},
				dialyzerEnabled = true,
				fetchDeps = false,
				enableTestLenses = false,
				suggestSpecs = false,
			})
		end

	}
}
