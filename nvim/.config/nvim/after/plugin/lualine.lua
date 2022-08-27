local ok, lualine = pcall(require, 'lualine')
if not ok then
	print('lualine not available')
	return
end

lualine.setup({ options = { theme = 'vscode' } })
