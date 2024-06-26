require("asylcreek.set")
require("asylcreek.remap")
require("asylcreek.lazy")
require("asylcreek.autocmds")

vim.opt.background = "dark"
vim.cmd("colorscheme ayu-mirage")

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

-- set border color
vim.cmd.hi("WinSeparator guifg=orange")
