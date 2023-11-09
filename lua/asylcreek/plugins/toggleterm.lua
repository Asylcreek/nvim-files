return {
  'akinsho/toggleterm.nvim',
  version = "*",
  config = function()
    local Terminal = require('toggleterm.terminal').Terminal

    local lazygit  = Terminal:new({
      cmd = "lazygit",
      dir = "git_dir",
      direction = "float",
    })

    function _lazygit_toggle()
      lazygit:toggle()
    end

    vim.api.nvim_set_keymap("n", "<leader>gg", "<cmd>lua _lazygit_toggle()<CR>",
      { noremap = true, silent = true, desc = "Toggle lazygit" })

    return vim
  end
}
