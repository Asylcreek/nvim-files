return {
  "lewis6991/gitsigns.nvim",
  event = "BufEnter",
  config = function()
    local gs = require("gitsigns")

    gs.setup({
      current_line_blame = true,

      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']c', function()
          if vim.wo.diff then return ']c' end
          vim.schedule(function() gs.next_hunk() end)
          return '<Ignore>'
        end, { expr = true })

        map('n', '[c', function()
          if vim.wo.diff then return '[c' end
          vim.schedule(function() gs.prev_hunk() end)
          return '<Ignore>'
        end, { expr = true })

        -- Actions
        map('n', '<leader>ghs', gs.stage_hunk, { desc = "Stage hunk" })
        map('n', '<leader>ghr', gs.reset_hunk, { desc = "Reset hunk" })
        map('v', '<leader>ghs', function() gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end,
          { desc = "Stage hunk" })
        map('v', '<leader>ghr', function() gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end,
          { desc = "Reset hunk" })
        map('n', '<leader>gbs', gs.stage_buffer, { desc = "Stage buffer" })
        map('n', '<leader>ghu', gs.undo_stage_hunk, { desc = "Unstage hunk" })
        map('n', '<leader>gbr', gs.reset_buffer, { desc = "Reset buffer" })
        map('n', '<leader>ghp', gs.preview_hunk, { desc = "Preview hunk" })
        map('n', '<leader>gB', function() gs.blame_line { full = true } end, { desc = "Show full git blame" })
        map('n', '<leader>gb', gs.toggle_current_line_blame, { desc = "Toggle current line blame" })
        map('n', '<leader>gd', gs.diffthis, { desc = "Show diff" })
        map('n', '<leader>gD', function() gs.diffthis('~') end, { desc = "Show diff from HEAD" })
        map('n', '<leader>gd', gs.toggle_deleted, { desc = "Toggle git deleted" })

        -- Text object
        map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
      end
    })
  end,
}
