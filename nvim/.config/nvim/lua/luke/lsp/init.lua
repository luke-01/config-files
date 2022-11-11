local ok, mason = pcall(require, 'mason')
if not ok then
	print('mason not available')
end

local ok, mason_lspconfig = pcall(require, 'mason-lspconfig')
if not ok then
	print('mason-lspconfig not available')
end

local ok, lspconfig = pcall(require, 'lspconfig')
if not ok then
	print('mason-lspconfig not available')
end

mason.setup()
mason_lspconfig.setup()

local capabilities = vim.lsp.protocol.make_client_capabilities()
local opts = { capabilities = capabilities }

local ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if not ok then
	print('cmp-nvim-lsp not available')
else
	capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
end

mason_lspconfig.setup_handlers({
	function(server_name)
		local ok, custom_opts = pcall(require, 'luke.lsp.handlers.' .. server_name)
		if ok then
			opts = vim.tbl_extend('force', opts, custom_opts)
		end
		lspconfig[server_name].setup(opts)
	end
})
