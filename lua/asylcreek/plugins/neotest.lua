return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "haydenmeade/neotest-jest",
    "folke/neodev.nvim",
  },
  event = "VeryLazy",
  config = function()
    local neotest = require("neotest")

    require("neodev").setup({
      library = { plugins = { "neotest" }, types = true },
    })

    neotest.setup({
      adapters = {
        require("neotest-jest")({
          jestCommand = "npm test --",
          cwd = function()
            return vim.fn.getcwd()
          end,
        }),
      },
    })

    vim.keymap.set("n", "<leader>tf", function()
      neotest.run.run(vim.fn.expand("%"))
    end, { desc = "Run tests in current file" })

    vim.keymap.set("n", "<leader>tn", function()
      neotest.run.run()
    end, { desc = "Run nearest test" })

    vim.keymap.set("n", "<leader>ts", function()
      neotest.run.stop()
    end, { desc = "Stop nearest test" })

    vim.keymap.set("n", "<leader>ta", function()
      neotest.run.stop()
    end, { desc = "Attach to nearest test" })

    vim.keymap.set("n", "<leader>twf", function()
      neotest.watch.toggle(vim.fn.expand("%"))
    end, { desc = "Watch current test file" })

    vim.keymap.set("n", "<leader>tws", function()
      neotest.watch.stop()
    end, { desc = "Stop watching tests" })

    vim.keymap.set("n", "<leader>tos", function()
      neotest.summary.toggle()
    end, { desc = "Toggle show test summary" })

    vim.keymap.set("n", "<leader>too", function()
      neotest.output.open({ enter = true, quiet = true })
    end, { desc = "Toggle output window" })

    vim.keymap.set("n", "<leader>top", function()
      neotest.output_panel.toggle()
    end, { desc = "Toggle output panel" })

    return vim
  end,
}
