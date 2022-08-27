local ok, autopairs = pcall(require, 'nvim-autopairs')
if not ok then
	print('autopairs not available')
	return
end

autopairs.setup({ check_ts = true })

local cmp_ok, cmp = pcall(require, 'cmp')
if not cmp_ok then
	print('cmp not available')
	return
end

local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
