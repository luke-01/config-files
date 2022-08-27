local nnoremap = require('luke.helpers').nnoremap
local tnoremap = require('luke.helpers').tnoremap

vim.g.mapleader = ' '

-- navigate splits
nnoremap('<C-h>', '<C-w>h')
nnoremap('<C-j>', '<C-w>j')
nnoremap('<C-k>', '<C-w>k')
nnoremap('<C-l>', '<C-w>l')

-- navigate buffers
nnoremap('<S-l>', '<cmd>bnext<CR>', { silent = true })
nnoremap('<S-h>', '<cmd>bprev<CR>', { silent = true })

-- resize splits
nnoremap('<C-Up>', '<cmd>resize +2<CR>', { silent = true })
nnoremap('<C-Down>', '<cmd>resize -2<CR>', { silent = true })
nnoremap('<C-Left>', '<cmd>vertical resize -2<CR>', { silent = true })
nnoremap('<C-Right>', '<cmd>vertical resize +2<CR>', { silent = true })

-- escape terminal mode
tnoremap('<Esc>', [[<C-\><C-n>]])
tnoremap('<C-h>', [[<C-\><C-n><C-w>h]])
tnoremap('<C-j>', [[<C-\><C-n><C-w>j]])
tnoremap('<C-k>', [[<C-\><C-n><C-w>k]])
tnoremap('<C-l>', [[<C-\><C-n><C-w>l]])

-- resize guifont
-- NOTE(luke): <C-+> doesn't work on windows for whatever reason (at least on neovide)
nnoremap('<C-->', function() require('luke.helpers').resize_guifont(-1) end)
nnoremap('<C-+>', function() require('luke.helpers').resize_guifont(1) end)
