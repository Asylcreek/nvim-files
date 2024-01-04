require("asylcreek.set")
require("asylcreek.remap")
require("asylcreek.lazy")
require("asylcreek.autocmds")

vim.opt.background = "dark"
vim.cmd("colorscheme duskfox")

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
