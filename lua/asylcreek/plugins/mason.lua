return {
	{ "williamboman/mason.nvim",
		config = function()
		require"mason".setup{}
		end
	},

	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			local lsp_zero = require("lsp-zero")

			require"mason-lspconfig".setup{
				ensure_installed = {
					"lua_ls",
					"tsserver",
					"cssls",
					"html",
					"dockerls",
					"jsonls",
					"docker_compose_language_service",
					"eslint",
					"emmet_ls"
				},
				handlers = {
					lsp_zero.default_setup,
				},
			}
		end
	},

	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"jose-elias-alvarez/null-ls.nvim",
		},
		config = function()
      require("asylcreek.plugins.null-ls")
		end,
	}
}
