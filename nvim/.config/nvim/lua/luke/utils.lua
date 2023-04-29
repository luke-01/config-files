local M = {}

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
