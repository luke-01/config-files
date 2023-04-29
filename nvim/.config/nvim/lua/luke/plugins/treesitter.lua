local ok, treesitter = pcall(require, 'nvim-treesitter.configs')
if not ok then
	return
end

treesitter.setup({
	highlight = { enable = true },
	indent = { enable = true }
})


local ok, ts_context = pcall(require, 'treesitter-context')
if not ok then
	return
end


ts_context.setup({ enable = true })
