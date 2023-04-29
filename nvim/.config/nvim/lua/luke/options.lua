vim.opt.number = true
vim.opt.relativenumber = true

local tabsize = 2
vim.opt.tabstop = tabsize
vim.opt.softtabstop = tabsize
vim.opt.shiftwidth = tabsize

vim.opt.expandtab = false -- change this to true for tabs as spaces
vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.cursorline = true

vim.opt.termguicolors = true
vim.opt.background = 'dark'
vim.opt.signcolumn = 'yes'

vim.opt.clipboard = "unnamedplus"

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.exrc = true

vim.opt.updatetime = 300
vim.opt.shortmess:append('c')
vim.diagnostic.config({ update_in_insert = true })
