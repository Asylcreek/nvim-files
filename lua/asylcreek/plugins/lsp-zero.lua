return {
	--- Uncomment these if you want to manage LSP servers from neovim

	'VonHeikemen/lsp-zero.nvim', branch = 'v3.x',
	dependencies = {
		{'neovim/nvim-lspconfig'},
	},
	config = function()
		local lsp_zero = require('lsp-zero')

		lsp_zero.on_attach(function(client, bufnr)
			local opts = {buffer = bufnr, remap = false}

			vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
			vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
			vim.keymap.set("n", "<leader>ls", function() vim.lsp.buf.workspace_symbol() end, opts)
			vim.keymap.set("n", "<leader>ld", function() vim.diagnostic.open_float() end, opts)
			vim.keymap.set("n", "<leader>dn", function() vim.diagnostic.goto_next() end, opts)
			vim.keymap.set("n", "<leader>dp", function() vim.diagnostic.goto_prev() end, opts)
			vim.keymap.set("n", "<leader>la", function() vim.lsp.buf.code_action() end, opts)
			vim.keymap.set("n", "<leader>lr", function() vim.lsp.buf.references() end, opts)
			vim.keymap.set("n", "<leader>lR", function() vim.lsp.buf.rename() end, opts)
			vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
		end)

		lsp_zero.setup();
	end
}
