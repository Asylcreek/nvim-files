return {
	'nvim-telescope/telescope.nvim', tag = '0.1.4',
	dependencies = { 'nvim-lua/plenary.nvim' },
	config = function ()
		local builtin = require('telescope.builtin')

		vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find files" })
		vim.keymap.set('n', '<leader>fF', function() builtin.find_files { hidden = true, no_ignore = true } end, { desc = "Find all files" })
		vim.keymap.set('n', '<leader>fw', builtin.live_grep, { desc = "Find words in all files" })
		vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Find buffers" })
		vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Find help" })
		vim.keymap.set('n', '<leader>fo', builtin.oldfiles, { desc = "Find old files" })
		vim.keymap.set('n', '<leader>f<CR>', builtin.resume, { desc = "Resume previous search" })
		vim.keymap.set('n', "<leader>f'", builtin.marks, { desc = "Find marks" })
		vim.keymap.set('n', "<leader>f/", builtin.current_buffer_fuzzy_find, { desc = "Find words in current buffer" })
		vim.keymap.set('n', "<leader>fc", builtin.grep_string, { desc = "Find word under cursor" })
		vim.keymap.set('n', "<leader>fC", builtin.commands, { desc = "Find commands" })
		vim.keymap.set('n', "<leader>fk", builtin.keymaps, { desc = "Find keymaps" })
		vim.keymap.set('n', "<leader>fr", builtin.registers, { desc = "Find registers" })

		vim.keymap.set('n', '<leader>gb', function() builtin.git_branches { use_file_path = true } end, { desc = "Git branches" })
		vim.keymap.set('n', '<leader>gc', function() builtin.git_commits { use_file_path = true } end, { desc = "Git commits for current repository" })
		vim.keymap.set('n', '<leader>gC', function() builtin.git_bcommits { use_file_path = true } end, { desc = "Git commits for current file" })
		vim.keymap.set('n', '<leader>gt', function() builtin.git_status { use_file_path = true } end, { desc = "Git status" })

		return vim
	end
	
}