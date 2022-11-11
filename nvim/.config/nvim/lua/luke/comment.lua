local ok, comment = pcall(require, 'Comment')
if not ok then
	print('Comment.nvim not available')
	return
end

comment.setup({})
