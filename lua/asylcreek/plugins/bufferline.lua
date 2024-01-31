return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  enabled = false,
  opts = {
    options = {
      modified_icon = "M",
      diagnostics = "nvim_lsp",
      diagnostics_update_in_insert = true,
      show_buffer_close_icons = false,
    },
  },
}
