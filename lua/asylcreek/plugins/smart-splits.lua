return {
  "mrjones2014/smart-splits.nvim",
  event = "BufEnter",
  config = function()
    local smartsplits = require("smart-splits")

    smartsplits.setup({
      cursor_follows_swapped_bufs = true,
    })

    -- these keymaps will also accept a range,
    -- for example `10<A-h>` will `resize_left` by `(10 * config.default_amount)`
    vim.keymap.set("n", "<A-h>", smartsplits.resize_left, { desc = "Resize left" })
    vim.keymap.set("n", "<A-j>", smartsplits.resize_down, { desc = "Resize down" })
    vim.keymap.set("n", "<A-k>", smartsplits.resize_up, { desc = "Resize up" })
    vim.keymap.set("n", "<A-l>", smartsplits.resize_right, { desc = "Resize right" })

    -- moving between splits
    vim.keymap.set("n", "<C-h>", smartsplits.move_cursor_left, { desc = "Move cursor left" })
    vim.keymap.set("n", "<C-j>", smartsplits.move_cursor_down, { desc = "Move cursor down" })
    vim.keymap.set("n", "<C-k>", smartsplits.move_cursor_up, { desc = "Move cursor up" })
    vim.keymap.set("n", "<C-l>", smartsplits.move_cursor_right, { desc = "Move cursor right" })

    vim.keymap.set("n", "<leader><leader>h", smartsplits.swap_buf_left, { desc = "Swap buffer left" })
    vim.keymap.set("n", "<leader><leader>j", smartsplits.swap_buf_down, { desc = "Swap buffer down" })
    vim.keymap.set("n", "<leader><leader>k", smartsplits.swap_buf_up, { desc = "Swap buffer up" })
    vim.keymap.set("n", "<leader><leader>l", smartsplits.swap_buf_right, { desc = "Swap buffer right" })

    return vim
  end,
}
