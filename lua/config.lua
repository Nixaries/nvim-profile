local set = vim.opt

set.tabstop = 4
set.softtabstop=4
set.shiftwidth=4

vim.wo.relativenumber=true

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
