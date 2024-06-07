return {
	{
		"stevearc/resession.nvim",
		lazy = false,
		config = function()
			local rs = require("resession")

			rs.setup({
				autosave = {
					enabled = vim.fn.argc(-1) == 0,
					interval = 30,
					notify = false,
				},
			})

			vim.keymap.set("n", "<leader>rs", rs.save, { desc = "Save session" })
			vim.keymap.set("n", "<leader>rl", rs.load, { desc = "Load session" })
			vim.keymap.set("n", "<leader>rd", rs.delete, { desc = "Delete session" })
		end,
	},
}
