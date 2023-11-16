return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.4",
	dependencies = { "nvim-lua/plenary.nvim" },
	event = "VeryLazy",
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local fb_actions = require("telescope._extensions.file_browser.actions")

		telescope.setup({
			defaults = {
				sorting_strategy = "ascending",
				path_display = { "truncate" },
				layout_config = {
					horizontal = { prompt_position = "top", results_position = "top", preview_width = 0.55 },
					vertical = { mirror = false },
					width = 0.87,
					height = 0.80,
					preview_cutoff = 120,
				},
				mappings = {
					i = {
						["<C-n>"] = actions.cycle_history_next,
						["<C-p>"] = actions.cycle_history_prev,
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
						["Tab"] = actions.move_selection_next,
						["S-Tab"] = actions.move_selection_previous,
					},
					n = { q = actions.close },
				},
			},
			extensions = {
				file_browser = {
					-- theme = "ivy",
					-- disables netrw and use telescope-file-browser in its place
					mappings = {
						["i"] = {
							-- your custom insert mode mappings
						},
						["n"] = {
							["a"] = fb_actions.create,
						},
					},
				},
			},
		})

		local builtin = require("telescope.builtin")

		vim.keymap.set("n", "gd", builtin.lsp_definitions, { desc = "Go to definition", buffer = bufnr, remap = false })
		vim.keymap.set(
			"n",
			"gI",
			builtin.lsp_implementations,
			{ desc = "Go to implementation", buffer = bufnr, remap = false }
		)
		vim.keymap.set(
			"n",
			"gT",
			builtin.lsp_definitions,
			{ desc = "Go to type definitions", buffer = bufnr, remap = false }
		)
		vim.keymap.set(
			"n",
			"<leader>lr",
			builtin.lsp_references,
			{ desc = "Show references", buffer = bufnr, remap = false }
		)
		vim.keymap.set("n", "<leader>ls", function()
			vim.ui.input({ prompt = "Symbol Query: (leave empty for word under cursor)" }, function(query)
				if query then
					-- word under cursor if given query is empty
					if query == "" then
						query = vim.fn.expand("<cword>")
					end
					require("telescope.builtin").lsp_workspace_symbols({
						query = query,
						prompt_title = ("Find word (%s)"):format(query),
					})
				end
			end)
		end, { desc = "Show workspace symbols", buffer = bufnr, remap = false })

		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
		vim.keymap.set("n", "<leader>fF", function()
			builtin.find_files({ hidden = true, no_ignore = true })
		end, { desc = "Find all files" })
		vim.keymap.set("n", "<leader>fw", builtin.live_grep, { desc = "Find words in all files" })
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find help" })
		vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "Find old files" })
		vim.keymap.set("n", "<leader>f<CR>", builtin.resume, { desc = "Resume previous search" })
		vim.keymap.set("n", "<leader>f'", builtin.marks, { desc = "Find marks" })
		vim.keymap.set("n", "<leader>f/", builtin.current_buffer_fuzzy_find, { desc = "Find words in current buffer" })
		vim.keymap.set("n", "<leader>fc", builtin.grep_string, { desc = "Find word under cursor" })
		vim.keymap.set("n", "<leader>fC", builtin.commands, { desc = "Find commands" })
		vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Find keymaps" })
		vim.keymap.set("n", "<leader>fr", builtin.registers, { desc = "Find registers" })

		vim.keymap.set("n", "<leader>gb", function()
			builtin.git_branches({ use_file_path = true })
		end, { desc = "Git branches" })
		vim.keymap.set("n", "<leader>gc", function()
			builtin.git_commits({ use_file_path = true })
		end, { desc = "Git commits for current repository" })
		vim.keymap.set("n", "<leader>gC", function()
			builtin.git_bcommits({ use_file_path = true })
		end, { desc = "Git commits for current file" })
		vim.keymap.set("n", "<leader>gt", function()
			builtin.git_status({ use_file_path = true })
		end, { desc = "Git status" })

		telescope.load_extension("yank_history")
		telescope.load_extension("file_browser")

		return vim
	end,
}
