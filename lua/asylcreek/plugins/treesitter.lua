return {
  'nvim-treesitter/nvim-treesitter',
  build = ":TSUpdate",
  config = function()
    require "nvim-treesitter.configs".setup {
      ensure_installed = {
        "javascript",
        "typescript",
        "css",
        "lua",
        "vim",
        "vimdoc",
        "query",
        "html",
        "dockerfile",
        "gitignore",
        "json",
        "markdown",
        "scss",
        "sql",
        "tsx",
      },

      autotag = {
        enable = true,
        enable_rename = true,
        enable_close = true,
        enable_close_on_slash = true,
      },

      sync_install = false,

      auto_install = true,

      highlight = {
        enable = true
      },

      indent = { enable = true },

      rainbow = {
        enable = true,
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = nil, -- Do not enable for files with more than n lines, int
      },
    }
  end
}
