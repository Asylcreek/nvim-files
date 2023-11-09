return {
  "jose-elias-alvarez/null-ls.nvim",
  event = "BufEnter",
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.completion.spell,
        null_ls.builtins.diagnostics.cspell.with {
          diagnostics_postprocess = function(diagnostic) diagnostic.severity = vim.diagnostic.severity.WARN end,
        },
      },
      diagnostic_config = {
        virtual_text = true,
        underline = true,
        update_in_insert = true,
      },
      update_in_insert = true
    })
  end
}
