local ok, bufferline = pcall(require, 'bufferline')
if not ok then
	print('bufferline.nvim not available')
end

bufferline.setup({})
