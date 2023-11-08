return {
  "gbprod/substitute.nvim",
  event = "BufEnter",
  config = function()
    local substitute = require "substitute"

    substitute.setup {
      on_substitute = require("yanky.integration").substitute(),
    }

    vim.keymap.set(
      "n",
      "s",
      substitute.operator,
      { noremap = true, desc = "Substitute selection (with motion) with register content" }
    )

    vim.keymap.set("n", "ss", substitute.line, { noremap = true, desc = "Substitute line with register content" })

    vim.keymap.set(
      "n",
      "S",
      substitute.eol,
      { noremap = true, desc = "Substitute until end of line with register content" }
    )

    vim.keymap.set(
      "x",
      "s",
      substitute.visual,
      { noremap = true, desc = "Substitute selection (with motion) with register content" }
    )

    -- Range
    vim.keymap.set("n", "<leader>s", require("substitute.range").operator, {
      noremap = true,
      desc = "Substitute selection (with motion) and destination (with motion) with input that would be specified",
    })

    vim.keymap.set(
      "n",
      "<leader>ss",
      require("substitute.range").word,
      {
        noremap = true,
        desc = "Substitute word under cursor and destination (with motion) with input that would be specified",
      }
    )

    vim.keymap.set("x", "<leader>s", require("substitute.range").visual, {
      noremap = true,
      desc = "Substitute selection (with motion) and destination (with motion) with input that would be specified",
    })

    -- Exchange
    vim.keymap.set("n", "sx", require("substitute.exchange").operator, { noremap = true })
    vim.keymap.set("n", "sxx", require("substitute.exchange").line, { noremap = true })
    vim.keymap.set("x", "X", require("substitute.exchange").visual, { noremap = true })
    vim.keymap.set("n", "sxc", require("substitute.exchange").cancel, { noremap = true })

    return vim
  end,
}

