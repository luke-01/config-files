local nnoremap = require('luke.utils').nnoremap

local ok, nvim_tree = pcall(require, 'nvim-tree')
if not ok then
	nnoremap('<leader>e', '<cmd>Lexplore 30<CR>', { silent = true })
	return
end

nvim_tree.setup({})

local api = require('nvim-tree.api')

nnoremap('<leader>e', api.tree.toggle)
