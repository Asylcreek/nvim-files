return {
  "kevinhwang91/nvim-ufo",
  dependencies = { "kevinhwang91/promise-async", "luukvbaal/statuscol.nvim" },
  event = "VeryLazy",
  config = function()
    local builtin = require("statuscol.builtin")

    require("statuscol").setup({
      setopt = true,
      relculright = false,
      segments = {
        {
          text = { builtin.foldfunc, " " },
          condition = { builtin.not_empty, true, builtin.not_empty },
          click = "v:lua.ScFa",
        },
        { text = { "%s" },                      click = "v:lua.ScSa" },
        { text = { builtin.lnumfunc, " ", " " } },
      },
    })

    require("ufo").setup()
  end,
}
