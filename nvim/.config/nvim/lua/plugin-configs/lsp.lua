-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local servers = { 'clangd', 'tsserver', 'pyright', 'gopls' }
local nvim_lsp = require('lspconfig')
for _, lsp in ipairs(servers) do
nvim_lsp[lsp].setup {
    capabilities = capabilities,
}
end

-- lua lsp has some finnicky settings
local sumneko_root_path = '/home/luke/sumneko_lua/'
local sumneko_binary = sumneko_root_path .. '/bin/Linux/lua-language-server'
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

nvim_lsp['sumneko_lua'].setup({
    cmd = { sumneko_binary, '-E', sumneko_root_path .. '/main.lua' };
    settings = {
      Lua = {
        runtime = {
          version = 'LuaJIT',
          path = runtime_path,
        },
        diagnostics = {
          globals = {'vim'},
        },
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true),
        },
        telemetry = {
          enable = false,
        },
      },
  },
})
