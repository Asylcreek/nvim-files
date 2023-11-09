return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "BufEnter",
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  config = function()
    -- Lua
    vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end, { desc = "Open Trouble" })
    vim.keymap.set(
      "n",
      "<leader>xw",
      function() require("trouble").toggle "workspace_diagnostics" end,
      { desc = "Open workspace diagnostics with Trouble" }
    )
    vim.keymap.set(
      "n",
      "<leader>xd",
      function() require("trouble").toggle "document_diagnostics" end,
      { desc = "Open document diagnostics with Trouble" }
    )
    vim.keymap.set(
      "n",
      "<leader>xq",
      function() require("trouble").toggle "quickfix" end,
      { desc = "Open quickfix list with Trouble" }
    )
    vim.keymap.set(
      "n",
      "<leader>xl",
      function() require("trouble").toggle "loclist" end,
      { desc = "Open location list with Trouble" }
    )
    vim.keymap.set(
      "n",
      "xR",
      function() require("trouble").toggle "lsp_references" end,
      { desc = "Open LSP references with Trouble" }
    )
  end,
}
