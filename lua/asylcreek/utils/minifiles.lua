local MiniFiles = require("mini.files")

local M = {}

local show_hidden = true

local filter_none = function(entries)
  return MiniFiles.default_sort(entries)
end

M.filter_hidden = function(entries)
  local all_paths = table.concat(
    vim.tbl_map(function(entry)
      return entry.path
    end, entries),
    "\n"
  )

  local output_lines = {}

  local job_id = vim.fn.jobstart({ "git", "check-ignore", "--stdin" }, {
    stdout_buffered = true,
    on_stdout = function(_, data)
      output_lines = data
    end,
  })

  -- command failed to run
  if job_id < 1 then
    return entries
  end

  -- send paths via STDIN
  vim.fn.chansend(job_id, all_paths)
  vim.fn.chanclose(job_id, "stdin")
  vim.fn.jobwait({ job_id })

  return MiniFiles.default_sort(vim.tbl_filter(function(entry)
    return not vim.tbl_contains(output_lines, entry.path) and not vim.startswith(entry.name, ".")
  end, entries))
end

M.toggle_hidden_files = function()
  show_hidden = not show_hidden

  local new_filter = show_hidden and M.filter_hidden or filter_none

  MiniFiles.refresh({ content = { sort = new_filter } })
end

M.map_split = function(buf_id, lhs, direction)
  local rhs = function()
    -- Make new window and set it as target
    local new_target_window

    vim.api.nvim_win_call(MiniFiles.get_target_window(), function()
      vim.cmd(direction .. " split")
      new_target_window = vim.api.nvim_get_current_win()
    end)

    MiniFiles.set_target_window(new_target_window)

    MiniFiles.close()
  end

  -- Adding `desc` will result into `show_help` entries
  local desc = "Split " .. direction

  vim.keymap.set("n", lhs, rhs, { buffer = buf_id, desc = desc })
end

return M
