return {
	"echasnovski/mini.comment",
	version = "*",
	event = "VeryLazy",
	dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring",
	},
	config = function()
		require("ts_context_commentstring").setup()

		local comment = require("mini.comment")

		comment.setup({
			options = {
				custom_commentstring = function()
					return require("ts_context_commentstring.internal").calculate_commentstring()
						or vim.bo.commentstring
				end,
			},
			mappings = {
				comment = "<leader>/",
				comment_line = "<leader>/",
				comment_visual = "<leader>/",
				textobject = "<leader>/",
			},
		})
	end,
}
