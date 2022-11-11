-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = 'yes'

-- correct colors
vim.opt.termguicolors = true

-- split direction
vim.opt.splitright = true
vim.opt.splitbelow = true

-- yank/paste/delete use system clipboard
vim.opt.clipboard = 'unnamedplus'

-- tab size
local tabsize = 2
vim.opt.expandtab = false -- set to true for tabs as spaces
vim.opt.shiftwidth = tabsize
vim.opt.softtabstop = tabsize
vim.opt.tabstop = tabsize

-- search in buffer
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- make backup of file before saving, delete backup if save was successful
vim.opt.backup = false
vim.opt.writebackup = true

-- proper undoing
vim.opt.swapfile = false
vim.opt.undofile = true

-- highlights
vim.opt.cursorline = true
vim.opt.colorcolumn = '100'

-- don't wrap lines
vim.opt.wrap = false

-- global status line
vim.opt.laststatus = 3

-- gui font
vim.opt.guifont = 'Fira Mono:h17'

-- colorscheme
local colorscheme = 'onedark'
vim.cmd('colorscheme ' .. colorscheme)

-- update diagnostics in insert mode
vim.opt.updatetime = 300
vim.opt.shortmess:append('c')
vim.diagnostic.config({ update_in_insert = true })
