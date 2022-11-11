local ok, autopairs = pcall(require, 'nvim-autopairs')
if not ok then
	print('autopairs not available')
	return
end

autopairs.setup({})
