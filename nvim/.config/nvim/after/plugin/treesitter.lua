local ok, treesitter = pcall(require, 'nvim-treesitter.configs')
if not ok then
	print('treesitter not available')
	return
end

treesitter.setup({
	ensure_installed = 'all',
	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true
	},
	indent = {
		enable = true
	}
})

local ok, context = pcall(require, 'treesitter-context')
if not ok then
	print('treesitter context not available')
	return
end

context.setup({})
