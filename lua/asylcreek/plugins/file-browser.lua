return {
  "echasnovski/mini.files",
  version = "*",
  config = function()
    local minifiles = require("mini.files")
    local miniUtils = require("asylcreek.utils.minifiles")

    minifiles.setup({
      content = {
        sort = miniUtils.filter_hidden,
      },
      mappings = {
        synchronize = "<leader>w",
        go_in_plus = "l",
        go_in = "L",
      },
      windows = {
        preview = true,
        width_preview = 120,
      },
    })

    vim.keymap.set("n", "<leader>pf", function()
      if vim.bo.ft == "minifiles" then
        minifiles.close()
      else
        local file = vim.api.nvim_buf_get_name(0)
        local file_exists = vim.fn.filereadable(file) ~= 0
        minifiles.open(file_exists and file or nil)
        minifiles.reveal_cwd()
      end
    end, { desc = "Open file browser" })

    return vim
  end,
}
