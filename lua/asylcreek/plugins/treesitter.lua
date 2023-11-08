return {
	'nvim-treesitter/nvim-treesitter',
	build = ":TSUpdate",
	config = function ()
		require "nvim-treesitter.configs".setup {
			ensure_installed = {
				"javascript",
				"typescript",
				"css",
				"lua",
				"vim",
				"vimdoc",
				"query",
				"html",
				"dockerfile",
				"gitignore",
				"json",
				"markdown",
				"scss",
				"sql",
				"tsx",
			},

			sync_install = false,

			auto_install = true,

			highlight = {
				enable = true
			},

			indent = { enable = true }
		}
	end
}
