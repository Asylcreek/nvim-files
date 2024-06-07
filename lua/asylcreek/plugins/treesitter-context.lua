return {
	"nvim-treesitter/nvim-treesitter-context",
	event = "InsertEnter",
	opts = {
		max_lines = 3,
		mode = "topline",
	},
	config = function()
		local context = require("treesitter-context")

		context.setup({
			max_lines = 3,
			mode = "topline",
		})

		vim.cmd([[
      hi TreesitterContextBottom gui=underline guisp=Grey
    ]])
	end,
}
