return {
  "pwntester/octo.nvim",
  cmd = "Octo",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("octo").setup({ enable_builtin = true })
    vim.cmd([[hi OctoEditable guibg=none]])
  end,
  keys = {
    { "<leader>oo",   "<cmd>Octo<cr>",                desc = "Open Octo" },
    { "<leader>orst", "<cmd>Octo review start<cr>",   desc = "Start pr review" },
    { "<leader>orsb", "<cmd>Octo review submit<cr>",  desc = "Submit pr review" },
    { "<leader>ord",  "<cmd>Octo review discard<cr>", desc = "Delete pr review" },
    { "<leader>orr",  "<cmd>Octo review resume<cr>",  desc = "Resume pr review" },
    { "<leader>orq",  "<cmd>Octo review close<cr>",   desc = "Close review window and go back to the PR" },
  },
}
