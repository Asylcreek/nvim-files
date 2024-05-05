return {
	"mfussenegger/nvim-lint",
	event = { "BufEnter" },
	config = function()
		local lint = require("lint")

		local linters = {
			go = { "golangci-lint" },
			markdown = { "vale" },
			lua = {},
		}

		local eslintFts = { "javascript", "typescript", "javascriptreact", "typescriptreact", "svelte" }

		for _, v in ipairs(eslintFts) do
			linters[v] = { "eslint_d" }
		end

		-- add cspell to all filetypes
		-- for ft in pairs(linters) do
		-- 	vim.list_extend(linters[ft], { "cspell" })
		-- end

		lint.linters_by_ft = linters

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function(opts)
				lint.try_lint()
			end,
		})
	end,
}
