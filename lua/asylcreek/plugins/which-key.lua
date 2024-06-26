return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  config = function()
    local wk = require("which-key")

    wk.setup({ window = { position = "top" } })

    wk.register({
      f = { name = "Find" },
    }, { mode = "n", prefix = "<leader>" })

    wk.register({
      b = { name = "Buffers" },
    }, { mode = "n", prefix = "<leader>" })

    wk.register({
      g = { name = "Git" },
    }, { mode = "n", prefix = "<leader>" })

    wk.register({
      h = { name = "Harpoon" },
    }, { mode = "n", prefix = "<leader>" })

    wk.register({
      r = { name = "Resession" },
    }, { mode = "n", prefix = "<leader>" })

    wk.register({
      l = { name = "LSP" },
    }, { mode = "n", prefix = "<leader>" })

    wk.register({
      x = { name = "Trouble" },
    }, { mode = "n", prefix = "<leader>" })

    wk.register({
      d = { name = "Diagnostics" },
    }, { mode = "n", prefix = "<leader>" })

    wk.register({
      o = { name = "Octo" },
    }, { mode = "n", prefix = "<leader>" })

    wk.register({
      r = { name = "Reviews" },
    }, { mode = "n", prefix = "<leader>o" })

    wk.register({
      s = { name = "Start/Submit" },
    }, { mode = "n", prefix = "<leader>or" })
  end,
}
