local ok, cmp = pcall(require, 'cmp')
if not ok then
	return
end

local ok, luasnip = pcall(require, 'luasnip')
if not ok then
	return
end

local formatting = {}
local ok, lspkind = pcall(require, 'lspkind')
if ok then
	formatting = {
		format = lspkind.cmp_format({
			mode = 'symbol_text',
			maxWidth = 50,
			ellipsis_char = '...'
		})
	}
end

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end
	},

	mapping = cmp.mapping.preset.insert({
		['<C-k>'] = cmp.mapping.select_prev_item(),
		['<C-j>'] = cmp.mapping.select_next_item(),
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<CR>'] = cmp.mapping.confirm({ select = false }),
	}),

	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
		{ name = 'buffer' },
		{ name = 'path' },
	}),

	formatting = formatting,
})
