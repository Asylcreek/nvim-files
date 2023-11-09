return {
  "SmiteshP/nvim-navic",
  dependencies = "neovim/nvim-lspconfig",
  event = "BufEnter",
  config = function()
    require "nvim-navic".setup {
      icons = {
        File = ' ',
        Module = ' ',
        Namespace = ' ',
        Package = ' ',
        Class = ' ',
        Method = ' ',
        Property = ' ',
        Field = ' ',
        Constructor = ' ',
        Enum = ' ',
        Interface = ' ',
        Function = ' ',
        Variable = ' ',
        Constant = ' ',
        String = ' ',
        Number = ' ',
        Boolean = ' ',
        Array = ' ',
        Object = ' ',
        Key = ' ',
        Null = ' ',
        EnumMember = ' ',
        Struct = ' ',
        Event = ' ',
        Operator = ' ',
        TypeParameter = ' '
      },
      lsp = {
        auto_attach = true
      }
    }

    vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
  end
}
