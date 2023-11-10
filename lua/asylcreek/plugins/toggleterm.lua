return {
  'akinsho/toggleterm.nvim',
  version = "*",
  config = function()
    local Terminal = require('toggleterm.terminal').Terminal

    -- local function exec(command)
    --   local f = io.popen(command)
    --
    --   if f ~= nil then
    --     local l = f:read("*a")
    --
    --     f:close()
    --
    --     return l
    --   end
    -- end
    --
    --
    -- local git_dir = exec("git rev-parse --show-toplevel")

    local lazygit = Terminal:new({
      -- cmd = ("lazygit --worktree=%s/"):format(git_dir),
      cmd = "lazygit",
      dir = ".",
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
