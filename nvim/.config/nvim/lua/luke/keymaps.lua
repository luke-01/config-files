local nnoremap = require('luke.utils').nnoremap
local tnoremap = require('luke.utils').tnoremap

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

-- file manager
local ok, nt_api = pcall(require, 'nvim-tree.api')
if not ok then
	nnoremap('<leader>e', '<cmd>Lexplore 30<CR>', { silent = true })
else
	nnoremap('<leader>e', nt_api.tree.toggle, { silent = true })
end

-- toggle highlight search
nnoremap('<leader><leader>', '<cmd>set hlsearch!<CR>', { silent = true })

-- diagnostics
nnoremap('<leader>ge', vim.diagnostic.open_float)
nnoremap('{d', vim.diagnostic.goto_prev)
nnoremap('}d', vim.diagnostic.goto_next)

-- lsp
nnoremap('gd', vim.lsp.buf.definition)
nnoremap('gD', vim.lsp.buf.declaration)
nnoremap('gi', vim.lsp.buf.implementation)
nnoremap('K', vim.lsp.buf.hover)
nnoremap('<leader>k', vim.lsp.buf.signature_help)
nnoremap('<leader>rn', vim.lsp.buf.rename)
nnoremap('<leader>ca', vim.lsp.buf.code_action)
nnoremap('<leader>gr', vim.lsp.buf.references)
nnoremap('<leader>gf', function () vim.lsp.buf.format({ async = true }) end)

-- resize guifont
-- NOTE(luke): <C-+> doesn't work on windows for whatever reason (at least on neovide)
local resize_guifont = require('luke.utils').resize_guifont
nnoremap('<C-->', function() resize_guifont(-1) end)
nnoremap('<C-+>', function() resize_guifont(1) end)
