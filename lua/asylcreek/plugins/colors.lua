return {
  {
    "kvrohit/mellow.nvim",
    lazy = "VeryLazy",
  },
  {
    "olimorris/onedarkpro.nvim",
    lazy = "VeryLazy",
    opts = {
      options = {
        transparency = true,
        terminal_colors = false,
      },
    },
  },
  {
    "folke/tokyonight.nvim",
    lazy = "VeryLazy",
    opts = {
      style = "storm",  -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
      light_style = "day", -- The theme is used when the background is set to light
      transparent = true, -- Enable this to disable setting the background color
    },
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = "VeryLazy",
    opts = {
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
    },
    {
      "EdenEast/nightfox.nvim",
      lazy = false,
      opts = {
        options = {
          transparent = true,
        },
        groups = {
          all = {
            DiagnosticVirtualTextInfo = { bg = "none" },
            DiagnosticVirtualTextError = { bg = "none" },
            DiagnosticVirtualTextWarn = { bg = "none" },
            DiagnosticVirtualTextHint = { bg = "none" },
            DiagnosticVirtualTextOk = { bg = "none" },
          },
        },
      },
    },
  },
}
