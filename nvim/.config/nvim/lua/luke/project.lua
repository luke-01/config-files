local ok, project = pcall(require, 'project_nvim')
if not ok then
	print("project.nvim not available")
	return
end

project.setup()

