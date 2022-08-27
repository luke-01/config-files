local ok, colorscheme = pcall(require, 'vscode')
if not ok then
	print('colorscheme not available')
	return
end

colorscheme.setup({
	italic_comments = true
})
