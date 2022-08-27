local ok, telescope = pcall(require, 'telescope')
if not ok then
	print('telescope not available')
	return
end

telescope.setup({})
telescope.load_extension('fzf')

local nnoremap = require('luke.helpers').nnoremap

local builtin = require('telescope.builtin')
nnoremap('<C-p>', builtin.find_files)
