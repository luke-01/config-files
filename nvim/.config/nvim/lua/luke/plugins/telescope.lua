local ok, telescope = pcall(require, 'telescope')
if not ok then
	return
end

telescope.setup({
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = 'smart_case'
		}
	}
})

telescope.load_extension('fzf')

local nnoremap = require('luke.utils').nnoremap

nnoremap('<leader>ff', '<cmd>Telescope find_files<cr>')
nnoremap('<leader>fg', '<cmd>Telescope live_grep<cr>')
