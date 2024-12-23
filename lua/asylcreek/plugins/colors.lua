return {
	{
		"kvrohit/mellow.nvim",
		lazy = "VeryLazy",
	},
	{
		"olimorris/onedarkpro.nvim",
		lazy = "false",
		opts = {
			options = {
				transparency = true,
				terminal_colors = false,
			},
		},
	},
	{
		"rebelot/kanagawa.nvim",
		lazy = "VeryLazy",
		config = function()
			local kanagawa = require("kanagawa")

			kanagawa.setup({
				transparent = false,
				colors = {
					theme = {
						all = {
							ui = {
								bg_gutter = "none",
							},
						},
					},
				},
			})
		end,
	},
	{
		"EdenEast/nightfox.nvim",
		lazy = "VeryLazy",
		opts = {
			options = {
				transparent = true,
			},
			groups = {
				all = {
					DiagnosticVirtualTextInfo = { bg = "none" },
					DiagnosticVirtualTextError = { bg = "none" },
					DiagnosticVirtualTextWarn = { bg = "none" },
					DiagnosticVirtualTextHint = { bg = "none" },
					DiagnosticVirtualTextOk = { bg = "none" },
				},
			},
		},
	},
	{
		"mcchrish/zenbones.nvim",
		dependencies = "rktjmp/lush.nvim",
		lazy = "VeryLazy",
	},
	{
		"Shatur/neovim-ayu",
		lazy = "VeryLazy",
		config = function()
			require("ayu").setup({
				overrides = {
					SignColumn = { bg = "None" },
					FoldColumn = { bg = "None" },
				},
			})
		end,
	},
	{
		"savq/melange-nvim",
		lazy = "VeryLazy",
	},
	{
		"navarasu/onedark.nvim",
		lazy = "VeryLazy",
		config = function()
			require("onedark").setup({
				style = "darker",
				transparent = true,
				code_style = {
					comments = "italic",
					keywords = "italic",
					functions = "italic",
					strings = "italic",
				},
				diagnostics = {
					background = false,
				},
			})
		end,
	},
}
