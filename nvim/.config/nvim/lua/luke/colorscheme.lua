local ok, kanagawa = pcall(require, 'kanagawa')
if not ok then
  vim.notify("colorscheme kanagawa not found. using default")
  vim.cmd("colorscheme desert")
end

kanagawa.setup({
  statementStyle = 'NONE', -- disable keywords in bold
})

vim.cmd("colorscheme kanagawa")
