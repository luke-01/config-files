local ok, treesitter = pcall(require, 'nvim-treesitter.configs')
if not ok then
	print('treesitter not available')
	return
end

treesitter.setup({
	highlight = { enable = true },
	playground = { enable = true }
})

local ok, ts_context = pcall(require, 'treesitter-context')
if not ok then
	print('treesitter-context not available')
	return
end

ts_context.setup({ enable = true })
