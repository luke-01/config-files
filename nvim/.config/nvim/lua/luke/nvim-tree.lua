local ok, nvim_tree = pcall(require, 'nvim-tree')
local nnoremap = require('luke.utils').nnoremap

if not ok then
	print('nvim-tree.lua not available')
		nnoremap('<leader>e', '<cmd>Lexplore 30<CR>', { silent = true })
	return
end

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local nt_api = require('nvim-tree.api')
nnoremap('<leader>e', nt_api.tree.toggle, { silent = true })

nvim_tree.setup({})
