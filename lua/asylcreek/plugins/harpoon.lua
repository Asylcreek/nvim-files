return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	requires = { "nvim-lua/plenary.nvim" },
	event = "VeryLazy",
	config = function()
		local harpoon = require("harpoon")

		harpoon:setup({ settings = { sync_on_ui_close = true } })

		vim.keymap.set("n", "<leader>ha", function()
			harpoon:list():append()
		end, { desc = "Add file to harpoon" })
		vim.keymap.set("n", "<leader>he", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "Show harpoon ui" })

		vim.keymap.set("n", "<leader>hh", function()
			harpoon:list():select(1)
		end, { desc = "Navigate to first harpoon file" })
		vim.keymap.set("n", "<leader>hj", function()
			harpoon:list():select(2)
		end, { desc = "Navigate to second harpoon file" })
		vim.keymap.set("n", "<leader>hk", function()
			harpoon:list():select(3)
		end, { desc = "Navigate to third harpoon file" })
		vim.keymap.set("n", "<leader>hl", function()
			harpoon:list():select(4)
		end, { desc = "Navigate to fourth harpoon file" })
		vim.keymap.set("n", "<leader>hn", function()
			harpoon:list():next()
		end, { desc = "Navigate to next harpoon file" })
		vim.keymap.set("n", "<leader>hp", function()
			harpoon:list():previous()
		end, { desc = "Navigate to previous harpoon file" })

		return vim
	end,
}
