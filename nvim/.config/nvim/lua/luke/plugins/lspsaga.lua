local ok, lspkind = pcall(require, 'lspsaga')
if not ok then
	return
end

lspkind.setup({})

local nnoremap = require('luke.utils').nnoremap

nnoremap("gh", "<cmd>Lspsaga lsp_finder<CR>")
nnoremap("<leader>ca", "<cmd>Lspsaga code_action<CR>")
nnoremap("gr", "<cmd>Lspsaga rename<CR>")
nnoremap("gp", "<cmd>Lspsaga peek_definition<CR>")
nnoremap("gd", "<cmd>Lspsaga goto_definition<CR>")
nnoremap("gt", "<cmd>Lspsaga peek_type_definition<CR>")


nnoremap("<leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>")
nnoremap("<leader>sb", "<cmd>Lspsaga show_buf_diagnostics<CR>")
nnoremap("<leader>sw", "<cmd>Lspsaga show_workspace_diagnostics<CR>")
nnoremap("<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>")
nnoremap("{d", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
nnoremap("}d", "<cmd>Lspsaga diagnostic_jump_next<CR>")

-- Toggle outline
nnoremap("<leader>o", "<cmd>Lspsaga outline<CR>")

nnoremap("K", "<cmd>Lspsaga hover_doc<CR>")

-- Call hierarchy
nnoremap("<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>")
nnoremap("<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>")
