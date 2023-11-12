return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	opts = {
		options = {
			modified_icon = "M",
			diagnostics = "nvim_lsp",
			diagnostics_update_in_insert = true,
		},
	},
}
