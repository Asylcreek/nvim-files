return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  config = function()
    local lualine = require("lualine")

    local conditions = {
      buffer_not_empty_and_not_terminal = function()
        return vim.fn.empty(vim.fn.expand("%:t")) ~= 1 and vim.bo.buftype ~= "terminal"
      end,
    }

    local filename = {
      "filename",
      path = 1,
      cond = conditions.buffer_not_empty_and_not_terminal,
    }

    lualine.setup({
      options = {
        component_separators = "",
        section_separators = { left = "", right = "" },
        theme = "ayu",
      },
      tabline = {
        lualine_a = { "mode" },
        lualine_b = {
          "branch",
          "diff",
          {
            "diagnostics",
            sources = { "nvim_diagnostic", "nvim_lsp" },
            symbols = { error = " ", warn = " ", info = " " },
          },
        },
        lualine_c = {
          "%=",
          filename,
        },
        lualine_x = {},
        lualine_y = {
          {
            -- Lsp server name .
            function()
              local msg = "No Active Lsp"
              local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
              local clients = vim.lsp.get_active_clients()
              if next(clients) == nil then
                return msg
              end

              local server_names = {}

              for _, client in ipairs(clients) do
                local filetypes = client.config.filetypes
                if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                  table.insert(server_names, client.name)
                end
              end
              return table.concat(server_names, ", ")
            end,
            icon = "",
          },
          "progress",
        },
        lualine_z = { "location" },
      },
      sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
    })
  end,
}
