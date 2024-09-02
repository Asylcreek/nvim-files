return {
	"fnune/recall.nvim",
	event = "VeryLazy",
	config = function()
		local recall = require("recall")

		recall.setup({
			sign = "",
			sign_highlight = "@comment.note",

			telescope = {
				autoload = true,
				mappings = {
					unmark_selected_entry = {
						normal = "dd",
						insert = "<M-d>",
					},
				},
			},

			wshada = vim.fn.has("nvim-0.10") == 0,
		})

		vim.keymap.set("n", "<leader>mm", recall.toggle, { noremap = true, silent = true, desc = "Toggle mark" })
		vim.keymap.set("n", "<leader>mn", recall.goto_next, { noremap = true, silent = true, desc = "Go to next mark" })
		vim.keymap.set(
			"n",
			"<leader>mp",
			recall.goto_prev,
			{ noremap = true, silent = true, desc = "Go to previous mark" }
		)
		vim.keymap.set("n", "<leader>mc", recall.clear, { noremap = true, silent = true, desc = "Clear mark" })
		vim.keymap.set(
			"n",
			"<leader>ml",
			":Telescope recall<CR>",
			{ noremap = true, silent = true, desc = "Show marks in Telescope" }
		)
	end,
}
