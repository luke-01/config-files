-- visual flares
vim.api.nvim_set_option('termguicolors', true)
vim.cmd('colorscheme onedark')
vim.api.nvim_win_set_option(0, 'number', true)
vim.api.nvim_win_set_option(0, 'relativenumber', true)
vim.api.nvim_win_set_option(0, 'cursorline', true)
vim.api.nvim_win_set_option(0, 'wrap', false)

-- correct tabbing
vim.api.nvim_buf_set_option(0, 'tabstop', 4)
vim.api.nvim_buf_set_option(0, 'shiftwidth', 4)
vim.api.nvim_buf_set_option(0, 'smartindent', true)

-- undo properly
vim.api.nvim_buf_set_option(0, 'swapfile', false)
vim.api.nvim_buf_set_option(0, 'undofile', true)

-- searching in a buffer properly
vim.api.nvim_set_option('ignorecase', true)
vim.api.nvim_set_option('smartcase', true)

-- splitting windows
vim.api.nvim_set_option('splitright', true)
vim.api.nvim_set_option('splitbelow', true)

-- settings recommended by coc.nvim
vim.api.nvim_set_option('hidden', true)
vim.api.nvim_set_option('writebackup', false)
vim.api.nvim_set_option('backup', false)
vim.api.nvim_set_option('cmdheight', 2)
vim.api.nvim_set_option('updatetime', 300)
vim.api.nvim_win_set_option(0, 'signcolumn', 'yes')

local shortmess = vim.api.nvim_get_option('shortmess')
vim.api.nvim_set_option('shortmess', shortmess .. 'c')

-- some nice utilities
vim.api.nvim_set_option('completeopt', 'menu,menuone,preview,noinsert,noselect')
vim.api.nvim_set_option('mouse', 'nv')
vim.api.nvim_set_option('keywordprg', [=[:vertical Man]=])
vim.api.nvim_set_option('exrc', true)
