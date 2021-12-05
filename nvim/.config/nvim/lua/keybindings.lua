-- set space to leader
vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', { noremap = true })
vim.g.mapleader = ' '

-- remove search highlights
vim.api.nvim_set_keymap('n', '<leader><leader>', '<cmd>set hlsearch!<CR>', { noremap = true, silent = true })

-- navegate splits
vim.api.nvim_set_keymap('n', '<M-l>', '<C-w>l', { noremap = true })
vim.api.nvim_set_keymap('n', '<M-k>', '<C-w>k', { noremap = true })
vim.api.nvim_set_keymap('n', '<M-j>', '<C-w>j', { noremap = true })
vim.api.nvim_set_keymap('n', '<M-h>', '<C-w>h', { noremap = true })

-- file explorer
vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- terminal
vim.api.nvim_set_keymap('t', '<ESC>', '<C-\\><C-n>', { noremap = true })

-- better shifting
vim.api.nvim_set_keymap('v', '>', '>gv', { noremap = true })
vim.api.nvim_set_keymap('v', '<', '<gv', { noremap = true })

-- lsp keybinds
local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(0, ...) end

local opts = { noremap=true, silent=true }

buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
buf_set_keymap('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
buf_set_keymap('n', '{d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
buf_set_keymap('n', '}d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
buf_set_keymap('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
buf_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)