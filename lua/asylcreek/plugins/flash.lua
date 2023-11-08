return {
  "folke/flash.nvim",
  event = "BufEnter",
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
