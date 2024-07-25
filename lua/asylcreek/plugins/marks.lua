return {
	"chentoast/marks.nvim",
	event = "VeryLazy",
	config = function()
		local marks = require("marks")

		marks.setup({ default_mappings = false, mappings = {
			set = false,
		} })

		vim.keymap.set("n", "<leader>ma", function()
			marks.set_next()
		end, { desc = "Set next available lowercase mark at cursor" })

		vim.keymap.set("n", "<leader>mk", function()
			marks.prev()
		end, { desc = "Move to previous mark" })

		vim.keymap.set("n", "<leader>ml", function()
			marks.next()
		end, { desc = "Move to next mark" })

		vim.keymap.set("n", "<leader>md", function()
			marks.delete_line()
		end, { desc = "Delete all marks on current line" })

		vim.keymap.set("n", "<leader>mD", function()
			marks.delete_buf()
		end, { desc = "Delete all marks in current buffer" })

		vim.keymap.set("n", "<leader>mP", function()
			marks.preview()
		end, { desc = "Preview mark (type mark immediately after or press enter)" })

		vim.keymap.set(
			"n",
			"<leader>ms",
			"<cmd>MarksListBuf<cr>",
			{ desc = "List marks in current buffer in location list" }
		)

		vim.keymap.set("n", "<leader>mS", "<cmd>MarksQFListAll<cr>", { desc = "List all marks in qflist" })
	end,
}
