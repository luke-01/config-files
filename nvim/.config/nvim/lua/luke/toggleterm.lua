local ok, toggleterm = pcall(require, 'toggleterm')
if not ok then
  print('failed to load toggleterm')
  return
end

toggleterm.setup({
  -- size can be a number or function which is passed the current terminal
  size = function(term)
    if term.direction == "horizontal" then
      return 10
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.5
    end
  end,
  open_mapping = [[<C-x>]],
  direction =  'vertical'-- | 'horizontal' | 'tab' | 'float',
})
