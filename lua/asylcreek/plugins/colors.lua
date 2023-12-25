return {
  {
    "kvrohit/mellow.nvim",
    lazy = "VeryLazy",
  },
  {
    "olimorris/onedarkpro.nvim",
    lazy = "false",
    opts = {
      options = {
        transparency = true,
        terminal_colors = false,
      },
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
              bg_gutter = "red",
            },
          },
        },
      },
    },
    {
      "EdenEast/nightfox.nvim",
      lazy = "VeryLazy",
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
