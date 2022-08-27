local nnoremap = require('luke.helpers').nnoremap
local open_terminal_map = '<C-x>'
local ok, toggleterm = pcall(require, 'toggleterm')
if not ok then
	print('toggleterm not available')
	nnoremap(open_terminal_map, '<cmd>vs<CR><cmd>terminal<CR>', { silent = true })
end

toggleterm.setup({
	size = function(term)
		if term.direction == 'horizontal' then
			return 15
		elseif term.direction == 'vertical' then
			return vim.o.columns * 0.5
		end
	end,
	open_mapping = open_terminal_map,
	direction = 'vertical'
})
