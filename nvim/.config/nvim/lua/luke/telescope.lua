local ok, telescope = pcall(require, 'telescope')
if not ok then
	print('telescope not available')
	return
end

telescope.setup({})
telescope.load_extension('fzf')
telescope.load_extension('projects')

local builtin = require('telescope.builtin')
local nnoremap = require('luke.utils').nnoremap
nnoremap('<leader>ff', builtin.find_files, {})
nnoremap('<leader>fg', builtin.live_grep, {})
nnoremap('<leader>fp', telescope.extensions.projects.projects, {})
