local ok, lspconfig = pcall(require, 'lspconfig')
if not ok then
	return
end

local ok, mason = pcall(require, 'mason')
if not ok then
	return
end

local ok, mason_lspconfig = pcall(require, 'mason-lspconfig')
if not ok then
	return
end

local ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
local capabilities = {}
if ok then
	capabilities = cmp_nvim_lsp.default_capabilities()
else
	capabilities = vim.lsp.protocol.make_client_capabilities()
end

local opts = { capabilities = capabilities }

mason.setup()
mason_lspconfig.setup()
mason_lspconfig.setup_handlers({
	function(server_name)
		lspconfig[server_name].setup(opts)
	end,
	['lua_ls'] = function()
		lspconfig['lua_ls'].setup({
			capabilities = capabilities,
			settings = {
				Lua = {
					diagnostics = { globals = { 'vim ' } },
					workspace = {
						library = {
							[vim.fn.expand('$VIMRUNTIME/lua')] = true,
							[vim.fn.stdpath('config') .. '/lua'] = true,
						}
					}
				}
			}
		})
	end
})
