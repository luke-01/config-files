local ok, _ = pcall(require, 'lspconfig')
if not ok then
  return
end

require('luke.lsp.lsp-installer')
require('luke.lsp.handlers').setup()
