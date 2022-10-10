local ok, indent = pcall(require, 'indent_blankline')
if not ok then
	print('indent-blankline.nvim plugin not available')
	return
end

indent.setup()
