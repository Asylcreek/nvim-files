-- Normal mode
vim.keymap.set("n", "J", "mzJ`z", {desc = "Join line below to current line and leave the cursor position as is" })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Jump down and center" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Jump up and center" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Jump to next matching item and center" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Jump to previous matching item and center" })

vim.keymap.set("n", "<leader>bn", "<cmd>bnext<CR>", { desc = "Move to next buffer" })
vim.keymap.set("n", "<leader>bp", "<cmd>bprevious<CR>", { desc = "Move to previous buffer" })

vim.keymap.set("n", "<C-q>", "<cmd>qa!<CR>", { desc = "Quit nvim violently" })
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", { desc = "Save buffer" })
vim.keymap.set("n", "|", "<cmd>vsplit<cr>", { desc = "Vertical split" })
vim.keymap.set("n", "\\", "<cmd>split<cr>", { desc = "Horizontal split" })

-- Visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selections down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selections up" })

