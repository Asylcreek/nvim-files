return {
	"mikavilpas/yazi.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	event = "VeryLazy",
	config = function()
		local yazi = require("yazi")

		yazi.setup({
			open_for_directories = false,
		})

		vim.keymap.set("n", "<leader>pf", function()
			yazi.yazi()
		end, { desc = "Open file browser" })
	end,
}
