return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	config = function()
		local wk = require("which-key")

		wk.setup({ preset = "modern", win = {} })

		wk.add({ { "<leader>f", group = "Find" } })

		wk.add({ { "<leader>b", group = "Buffers" } })

		wk.add({ { "<leader>g", group = "Git" } })

		wk.add({ { "<leader>h", group = "Harpoon" } })

		wk.add({ { "<leader>r", group = "Resession" } })

		wk.add({ { "<leader>l", group = "LSP" } })

		wk.add({ { "<leader>x", group = "Trouble" } })

		wk.add({ { "<leader>d", group = "Diagnostics" } })

		wk.add({ { "<leader>o", group = "Octo" } })

		wk.add({ { "<leader>or", group = "Octo Reviews" } })

		wk.add({ { "<leader>ors", group = "Octo Reviews Start/Submit" } })
	end,
}
