return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  config = function()
    require("notify").setup({
      background_colour = "#000000",
    })

    require("noice").setup({
      presets = {
        bottom_search = false,
        lsp_doc_border = true,
      },
      cmdline = {
        view = "cmdline_popup",
      },
      messages = {
        view = "mini",
        view_error = "popup",
        view_warn = "mini",
        view_search = "mini",
        view_history = "messages",
      },
      lsp = {
        progress = {
          enabled = false,
        },
        message = {
          view = "mini",
        },
        hover = {
          silent = true,
        },
      },
      routes = {},
      views = {
        cmdline_popup = {
          position = {
            row = 5,
            col = "50%",
          },
          size = {
            width = 60,
            height = "auto",
          },
        },
        popupmenu = {
          relative = "editor",
          position = {
            row = 8,
            col = "50%",
          },
          size = {
            width = 60,
            height = 10,
          },
          border = {
            style = "rounded",
            padding = { 0, 1 },
          },
          win_options = {
            winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
          },
        },
        mini = {
          border = {
            style = "rounded",
            padding = { 0, 1 },
          },
        },
      },
    })
  end,
}
