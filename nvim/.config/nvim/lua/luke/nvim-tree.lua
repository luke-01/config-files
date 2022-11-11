local ok, nvim_tree = pcall(require, 'nvim-tree')
if not ok then
	print('nvim-tree.lua not available')
	return
end

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
nvim_tree.setup({})
