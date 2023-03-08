local ok, lualine = pcall(require, 'lualine')
if not ok then
	print("lualine not available")
end

lualine.setup({})
