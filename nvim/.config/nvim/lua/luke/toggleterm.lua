local ok, toggleterm = pcall(require, 'toggleterm')
if not ok then
	print("toggleterm not available")
end

toggleterm.setup({
	open_mapping = '<leader>tt',
	insert_mappings = false,
	terminal_mappings = false,
})
