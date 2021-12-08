-- visual flares
vim.api.nvim_set_option('termguicolors', true)
vim.cmd('colorscheme onedark')
vim.wo.number		  = true
vim.wo.relativenumber = true
vim.wo.cursorline     = true
vim.wo.wrap           = false

-- correct tabbing
vim.o.tabstop     = 4
vim.o.shiftwidth  = 4
vim.o.smartindent = true

-- undo properly
vim.bo.swapfile = false
vim.bo.undofile = true

-- searching in a buffer properly
vim.o.ignorecase = true
vim.o.smartcase  = true

-- splitting windows
vim.o.splitright = true
vim.o.splitbelow = true

-- settings recommended by coc.nvim
vim.o.hidden      = true
vim.o.writebackup = false
vim.o.backup      = false
vim.o.cmdheight   = 2
vim.o.updatetime  = 300
vim.wo.signcolumn = 'yes'
vim.o.shortmess = vim.o.shortmess .. 'c'

-- local shortmess = vim.api.nvim_get_option('shortmess')
-- vim.api.nvim_set_option('shortmess', shortmess .. 'c')

-- some nice utilities
vim.o.completeopt = 'menu,menuone,preview,noinsert,noselect'
vim.o.mouse = 'nv'
vim.o.keywordprg = [=[:vertical Man]=]
vim.o.exrc = true
