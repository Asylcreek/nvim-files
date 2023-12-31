return {
  {
    "stevearc/resession.nvim",
    lazy = false,
    config = function()
      local resession = require("resession")

      resession.setup({
        autosave = {
          enabled = vim.fn.argc(-1) == 0,
          interval = 30,
          notify = false,
        },
      })

      vim.keymap.set("n", "<leader>rs", resession.save, { desc = "Save session" })
      vim.keymap.set("n", "<leader>rl", resession.load, { desc = "Load session" })
      vim.keymap.set("n", "<leader>rd", resession.delete, { desc = "Delete session" })
    end,
  },
}
