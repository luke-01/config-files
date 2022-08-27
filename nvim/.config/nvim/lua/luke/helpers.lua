local M = {}

M.resize_guifont = function(change)
	local guifont = vim.api.nvim_get_option('guifont')
	local font_size = 0
	for d in guifont:gmatch('%d+') do
		font_size = d
	end
	local new_size = tostring(font_size + change)
	guifont = guifont:gsub('%d+', new_size)
	vim.api.nvim_set_option('guifont', guifont)
end

local function bind_mapping(mode)
	return function(rhs, lhs, opts)
		opts = vim.tbl_extend('force', { noremap = true }, opts or {})
		vim.keymap.set(mode, rhs, lhs, opts)
	end
end

M.nnoremap = bind_mapping('n')
M.inoremap = bind_mapping('i')
M.vnoremap = bind_mapping('v')
M.tnoremap = bind_mapping('t')

return M
