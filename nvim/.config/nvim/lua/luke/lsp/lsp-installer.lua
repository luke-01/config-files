local ok, lsp_installer = pcall(require, 'nvim-lsp-installer')
if not ok then
  return
end

lsp_installer.on_server_ready(function(server)
  local opts = {
    on_attach = require('luke.lsp.handlers').on_attach,
    capabilities = require('luke.lsp.handlers').capabilities,
  }
  if server.name == "sumneko_lua" then
    local sumneko_opts = require('luke.lsp.settings.sumneko_lua')
    opts = vim.tbl_deep_extend('force', sumneko_opts, opts)
  elseif server.name == 'clangd' then
    local clangd_opts = require('luke.lsp.settings.clangd')
    opts = vim.tbl_deep_extend('force', clangd_opts, opts)
  end

  server:setup(opts)
end)
