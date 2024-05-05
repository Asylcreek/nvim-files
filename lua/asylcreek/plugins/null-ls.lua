return {
	"jose-elias-alvarez/null-ls.nvim",
	dependencies = { "davidmh/cspell.nvim" },
	event = "BufEnter",
	config = function()
		local null_ls = require("null-ls")
		local cspell = require("cspell")

		local cspellConfig = {
			find_json = function()
				return vim.fn.expand("$HOME/.config/cspell/cspell.json")
			end,
		}

		null_ls.setup({
			sources = {
				cspell.code_actions.with({
					config = cspellConfig,
				}),
				null_ls.builtins.code_actions.gomodifytags,

				null_ls.builtins.completion.spell,

				-- null_ls.builtins.formatting.stylua,
				-- null_ls.builtins.formatting.prettier.with({
				--   extra_filetypes = { "svelte" },
				-- }),
				-- null_ls.builtins.formatting.gofmt,
				-- null_ls.builtins.formatting.goimports,
				-- null_ls.builtins.formatting.goimports_reviser,
				-- null_ls.builtins.formatting.golines,
				-- null_ls.builtins.formatting.prismaFmt,

				-- null_ls.builtins.diagnostics.eslint,
				-- null_ls.builtins.diagnostics.puglint,
				cspell.diagnostics.with({
					diagnostics_postprocess = function(diagnostic)
						diagnostic.severity = vim.diagnostic.severity.INFO
					end,
					config = cspellConfig,
				}),
			},
		})

		vim.diagnostic.config({
			virtual_text = true,
			underline = true,
			update_in_insert = false,
		})
	end,
}
