return {
  "folke/flash.nvim",
  event = "VeryLazy",
  opts = {
    modes = {
      char = {
        jump_labels = true,
        multi_line = false,
        highlight = {
          backdrop = false,
        },
      },
    },
  },
}
