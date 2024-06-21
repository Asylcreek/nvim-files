return {
	"folke/trouble.nvim",
	event = "VeryLazy",
	config = function()
		require("trouble").setup({
			focus = true,
		})
		-- Lua
		vim.keymap.set(
			"n",
			"<leader>xd",
			"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
			{ desc = "Open current buffer diagnostics with Trouble" }
		)

		vim.keymap.set(
			"n",
			"<leader>xw",
			"<cmd>Trouble diagnostics toggle<cr>",
			{ desc = "Open workspace diagnostics with Trouble" }
		)

		vim.keymap.set(
			"n",
			"<leader>xs",
			"<cmd>Trouble symbols toggle focus=true<cr>",
			{ desc = "Open document symbols with Trouble" }
		)

		vim.keymap.set(
			"n",
			"<leader>xl",
			"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
			{ desc = "LSP Definitions / references / ... (Trouble)" }
		)
	end,
}
