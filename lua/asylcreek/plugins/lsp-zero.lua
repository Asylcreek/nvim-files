return {
  --- Uncomment these if you want to manage LSP servers from neovim

  "VonHeikemen/lsp-zero.nvim",
  branch = "v3.x",
  dependencies = {
    { "neovim/nvim-lspconfig" },
    { "lukas-reineke/lsp-format.nvim" },
    -- { "ray-x/lsp_signature.nvim",     enabled = true },
  },
  event = "BufEnter",
  config = function()
    local lsp_zero = require("lsp-zero")
    local lsp_format = require("lsp-format")
    -- local lsp_signature = require("lsp_signature")

    lsp_zero.on_attach(function(client, bufnr)
      -- make sure you use clients with formatting capabilities
      -- otherwise you'll get a warning message
      if client.supports_method("textDocument/formatting") then
        lsp_format.on_attach(client)
      end

      -- lsp_signature.on_attach({}, bufnr)

      vim.keymap.set("n", "K", function()
        vim.lsp.buf.hover()
      end, { desc = "Show hover text", buffer = bufnr, remap = false })

      vim.keymap.set("n", "<leader>ld", function()
        vim.diagnostic.open_float()
      end, { desc = "Show hover diagnostics", buffer = bufnr, remap = false })
      vim.keymap.set("n", "<leader>dn", function()
        vim.diagnostic.goto_next()
      end, { desc = "Go to next diagnostic", buffer = bufnr, remap = false })
      vim.keymap.set("n", "<leader>dp", function()
        vim.diagnostic.goto_prev()
      end, { desc = "Go to previous diagnostic", buffer = bufnr, remap = false })
      vim.keymap.set("n", "<leader>la", function()
        vim.lsp.buf.code_action()
      end, { desc = "Show code actions", buffer = bufnr, remap = false })
      vim.keymap.set("n", "<leader>lR", function()
        vim.lsp.buf.rename()
      end, { desc = "Rename symbol", buffer = bufnr, remap = false })
      vim.keymap.set("i", "<C-h>", function()
        vim.lsp.buf.signature_help()
      end, { desc = "Show signature help", buffer = bufnr, remap = false })
      vim.keymap.set({ "n", "x" }, "<leader>lf", function()
        vim.lsp.buf.format({ async = false, timeout_ms = 1000 })
      end, { desc = "Format buffer", buffer = bufnr, remap = false })
    end)

    lsp_zero.setup()

    lsp_zero.format_on_save({
      format_opts = {
        async = false,
        timeout_ms = 1000,
      },
    })

    lsp_zero.set_server_config({
      capabilities = {
        textDocument = {
          foldingRange = {
            dynamicRegistration = false,
            lineFoldingOnly = true,
          },
        },
      },
    })
  end,
}
