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

			vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, { desc = "Go to definition" })
			vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, { desc = "Show hover text" })

			vim.keymap.set("n", "<leader>ls", function() vim.lsp.buf.workspace_symbol() end, { desc = "Show workspace symbols" })
			vim.keymap.set("n", "<leader>ld", function() vim.diagnostic.open_float() end, { desc = "Show hover diagnostics" })
			vim.keymap.set("n", "<leader>dn", function() vim.diagnostic.goto_next() end, { desc = "Go to next diagnostic" })
			vim.keymap.set("n", "<leader>dp", function() vim.diagnostic.goto_prev() end, { desc = "Go to previous diagnostic" })
			vim.keymap.set("n", "<leader>la", function() vim.lsp.buf.code_action() end, { desc = "Show code actions" })
			vim.keymap.set("n", "<leader>lr", function() vim.lsp.buf.references() end, { desc = "Show buffer references" })
			vim.keymap.set("n", "<leader>lR", function() vim.lsp.buf.rename() end, { desc = "Rename symbol" })
			vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, { desc = "Show signature help" })
		end)

		lsp_zero.setup();
	end
}
