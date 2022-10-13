local ok, lspconfig = pcall(require, 'lspconfig')
if not ok then
	print('lspconfig not available')
	return
end

-- update diagnostics in insert mode
vim.diagnostic.config({ update_in_insert = true })

local nnoremap = require('luke.helpers').nnoremap

nnoremap('<leader>ge', vim.diagnostic.open_float)
nnoremap('{d', vim.diagnostic.goto_prev)
nnoremap('}d', vim.diagnostic.goto_next)

local on_attach = function(_, bufnr)
	nnoremap('gd', vim.lsp.buf.definition, { buffer = bufnr })
	nnoremap('gD', vim.lsp.buf.declaration, { buffer = bufnr })
	nnoremap('gi', vim.lsp.buf.implementation, { buffer = bufnr })
	nnoremap('K', vim.lsp.buf.hover, { buffer = bufnr })
	nnoremap('<leader>k', vim.lsp.buf.signature_help, { buffer = bufnr })
	nnoremap('<leader>rn', vim.lsp.buf.rename, { buffer = bufnr })
	nnoremap('<leader>ca', vim.lsp.buf.code_action, { buffer = bufnr })
	nnoremap('<leader>gr', vim.lsp.buf.references, { buffer = bufnr })
	nnoremap('<leader>gf', vim.lsp.buf.formatting, { buffer = bufnr })
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
local cmp_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if not cmp_ok then
	print('cmp not available')
else
	capabilities = cmp_nvim_lsp.update_capabilities(capabilities)
end

lspconfig['clangd'].setup({ on_attach = on_attach, capabilities = capabilities })
lspconfig['rust_analyzer'].setup({ on_attach = on_attach, capabilities = capabilities })
lspconfig['pyright'].setup({ on_attach = on_attach, capabilities = capabilities })
lspconfig['gopls'].setup({ on_attach = on_attach, capabilities = capabilities })
lspconfig['tsserver'].setup({ on_attach = on_attach, capabilities = capabilities })
lspconfig['solargraph'].setup({ on_attach = on_attach, capabilities = capabilities })
lspconfig['emmet_ls'].setup({ on_attach = on_attach, capabilities = capabilities })
lspconfig['tailwindcss'].setup({ on_attach = on_attach, capabilities = capabilities })
lspconfig['sumneko_lua'].setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		Lua = {
			runtime = { version = 'LuaJIT' },
			diagnostics = { globals = { 'vim' } },
			workspace = { library = vim.api.nvim_get_runtime_file("", true) },
			telemetry = { enable = false }
		},
	},
})
