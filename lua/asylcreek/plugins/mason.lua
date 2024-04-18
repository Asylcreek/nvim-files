return {
  {
    "williamboman/mason.nvim",
    event = "BufEnter",
    config = function()
      require("mason").setup({})
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    event = "BufEnter",
    config = function()
      local lsp_zero = require("lsp-zero")

      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "tsserver",
          "cssls",
          "html",
          "dockerls",
          "jsonls",
          "docker_compose_language_service",
          "eslint",
          "emmet_ls",
        },
        handlers = {
          lsp_zero.default_setup,
          ["lua_ls"] = function()
            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup({
              settings = {
                Lua = {
                  diagnostics = {
                    globals = { "vim" },
                  },
                },
              },
            })
          end,
          cssmodules_ls = function()
            local lspconfig = require("lspconfig")
            lspconfig.cssmodules_ls.setup({
              filetypes = {
                "javascript",
                "javascriptreact",
                "typescript",
                "typescriptreact",
                "scss",
                "css",
              },
            })
          end,
        },
      })
    end,
  },

  {
    "jay-babu/mason-null-ls.nvim",
    event = "BufEnter",
    dependencies = {
      "jose-elias-alvarez/null-ls.nvim",
    },
    config = function()
      require("asylcreek.plugins.null-ls")
    end,
  },
}
