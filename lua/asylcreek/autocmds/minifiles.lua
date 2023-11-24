local miniUtils = require("asylcreek.utils.minifiles")

vim.api.nvim_create_autocmd("User", {
  pattern = "MiniFilesBufferCreate",
  callback = function(args)
    local buf_id = args.data.buf_id

    vim.keymap.set("n", "g.", miniUtils.toggle_hidden_files, { buffer = buf_id })
  end,
})

vim.api.nvim_create_autocmd("User", {
  pattern = "MiniFilesBufferCreate",
  callback = function(args)
    local buf_id = args.data.buf_id
    -- Tweak keys to your liking
    miniUtils.map_split(buf_id, "gs", "belowright horizontal")
    miniUtils.map_split(buf_id, "gv", "belowright vertical")
  end,
})
