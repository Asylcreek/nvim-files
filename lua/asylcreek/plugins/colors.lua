return {
  {
    "kvrohit/mellow.nvim",
    lazy = false,
    config = function()
      -- vim.cmd([[colorscheme mellow]])
    end,
  },
  {
    "olimorris/onedarkpro.nvim",
    lazy = false,
    config = function()
      require("onedarkpro").setup({
        options = {
          transparency = true,
          terminal_colors = false,
        },
      })

      -- vim.cmd("colorscheme onedark_dark")
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    config = function()
      require("tokyonight").setup({
        style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
        light_style = "day", -- The theme is used when the background is set to light
        transparent = true, -- Enable this to disable setting the background color
      })
    end,
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    config = function()
      require("kanagawa").setup({
        transparent = true,
        colors = {
          theme = {
            all = {
              ui = {
                bg_gutter = "none",
              },
            },
          },
        },
      })

      vim.cmd("colorscheme kanagawa-wave")
    end,
  },
}
