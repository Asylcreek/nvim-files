vim.opt.relativenumber = true
vim.opt.number = true

vim.opt.spell = true
vim.opt.wrap = false


vim.opt.showtabline = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.laststatus = 3

vim.opt.smartindent = true
vim.opt.smartcase = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv "HOME" .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 8
vim.opt.colorcolumn = "80"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.cmdheight = 1

vim.opt.clipboard = ""

vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.copyindent = true
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.fileencoding = "utf-8"
vim.opt.fillchars = { eob = " ", fold = " ", foldopen = "", foldsep = " ", foldclose = "" }
vim.opt.foldenable = true
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldcolumn = vim.fn.has "nvim-0.9" == 1 and "1" or nil

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.g.mapleader = " "
