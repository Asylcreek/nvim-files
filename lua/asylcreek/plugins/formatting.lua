return {
	"stevearc/conform.nvim",
	event = { "BufEnter" },
	config = function()
		local conform = require("conform")

		local prettierFts = {
			"javascript",
			"typescript",
			"javascriptreact",
			"typescriptreact",
			"tsx",
			"svelte",
			"css",
			"scss",
			"html",
			"json",
			"markdown",
		}

		local formatters = {
			lua = { "stylua" },
			yaml = { "yamlfix", "yamlfmt" },
			go = { "goimports", "gofmt", "goimports-reviser", "gopls" },
			nix = { "rnix", "nixpkgs-fmt" },
			c = { "clang-format" },
		}

		for _, v in ipairs(prettierFts) do
			formatters[v] = { "prettierd" }
		end

		conform.setup({
			formatters_by_ft = formatters,

			format_after_save = {
				lsp_fallback = true,
			},
		})

		vim.keymap.set("n", "<leader>lf", function()
			conform.format({ async = true, lsp_fallback = true })
		end, { desc = "Format buffer", remap = false })
	end,
}
