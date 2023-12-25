require("asylcreek.set")
require("asylcreek.remap")
require("asylcreek.lazy")
require("asylcreek.autocmds")

vim.cmd("colorscheme onedark_dark")

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
