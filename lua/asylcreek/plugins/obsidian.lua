return {
  "epwalsh/obsidian.nvim",
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",
  },
  version = "*",
  lazy = true,
  event = {
    "BufReadPre " .. vim.fn.expand("~") .. "/Documents/Obsidian\\ Vault/**.md",
    "BufNewFile " .. vim.fn.expand("~") .. "/Documents/Obsidian\\ Vault/**.md",
  },
  config = function()
    require("obsidian").setup({
      templates = {
        subdir = "Templates",
        date_format = "%Y-%m-%d",
        time_format = "%H:%M",
        -- A map for custom variables, the key should be the variable and the value a function
        substitutions = {},
      },
      daily_notes = {
        folder = "Journal",
        date_format = "%Y/%B/%Y-%m-%d-%A",
        template = "daily-note.md",
      },
      completion = {
        nvim_cmp = true,
        min_chars = 2,
        new_notes_location = "current_dir",
        prepend_note_id = true,
        prepend_note_path = false,
        use_path_only = false,
      },
      mappings = {
        -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
        ["gf"] = {
          action = function()
            return require("obsidian").util.gf_passthrough()
          end,
          opts = { noremap = false, expr = true, buffer = true },
        },
        -- Toggle check-boxes.
        ["<leader>ch"] = {
          action = function()
            return require("obsidian").util.toggle_checkbox()
          end,
          opts = { buffer = true },
        },
      },
    })

    vim.opt.conceallevel = 1
  end,
}
