local ok, bufferline = pcall(require, 'bufferline')
if not ok then
	print('bufferline.nvim not available')
	return
end

bufferline.setup({
	options = {
		diagnostics = 'nvim_lsp',
		separator_style = 'padded_slant',
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				text_align = "left",
				separator = true
			}
		}
	}
})
