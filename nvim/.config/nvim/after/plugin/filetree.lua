local nnoremap = require('luke.helpers').nnoremap
local toggle_tree_map = '<leader>e'

local ok, tree = pcall(require, 'nvim-tree')

if not ok then
	print('nvim-tree not available, using netrw')
	nnoremap(toggle_tree_map, '<cmd>Lexplore 30<CR>', { silent = true })
	return
end

tree.setup()
nnoremap(toggle_tree_map, '<cmd>NvimTreeToggle<CR>', { silent = true })
