return {
  "ThePrimeagen/harpoon",
  event = "BufEnter",
  config = function()
    local mark = require "harpoon.mark"
    local ui = require "harpoon.ui"

    vim.keymap.set("n", "<leader>ha", mark.add_file, { desc = "Add file to harpoon" })
    vim.keymap.set("n", "<leader>he", ui.toggle_quick_menu, { desc = "Show harpoon ui" })

    vim.keymap.set("n", "<leader>hh", function() ui.nav_file(1) end, { desc = "Navigate to first harpoon file" })
    vim.keymap.set("n", "<leader>hj", function() ui.nav_file(2) end, { desc = "Navigate to second harpoon file" })
    vim.keymap.set("n", "<leader>hk", function() ui.nav_file(3) end, { desc = "Navigate to third harpoon file" })
    vim.keymap.set("n", "<leader>hl", function() ui.nav_file(4) end, { desc = "Navigate to fourth harpoon file" })
    vim.keymap.set("n", "<leader>hn", function() ui.nav_next() end, { desc = "Navigate to next harpoon file" })
    vim.keymap.set("n", "<leader>hp", function() ui.nav_prev() end, { desc = "Navigate to previous harpoon file" })

    return vim
  end,
}

