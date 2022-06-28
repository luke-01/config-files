local noremap = { noremap = true }
local noremap_silent = { noremap = true, silent = true }
local set_keymap = vim.api.nvim_set_keymap

-- set leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- navigating between splits
set_keymap('n', '<C-l>', '<C-w>l', noremap)
set_keymap('n', '<C-k>', '<C-w>k', noremap)
set_keymap('n', '<C-j>', '<C-w>j', noremap)
set_keymap('n', '<C-h>', '<C-w>h', noremap)

-- navigating between buffers
set_keymap('n', '<S-l>', '<cmd>:bnext<CR>', noremap_silent)
set_keymap('n', '<S-h>', '<cmd>:bprevious<CR>', noremap_silent)

-- file explorer
set_keymap('n', '<leader>e', '<cmd>NvimTreeToggle<CR>', noremap_silent)

-- resize windows
set_keymap('n', '<C-Up>', '<cmd>resize +2<CR>', noremap_silent)
set_keymap('n', '<C-Down>', '<cmd>resize -2<CR>', noremap_silent)
set_keymap('n', '<C-Left>', '<cmd>vertical resize -2<CR>', noremap_silent)
set_keymap('n', '<C-Right>', '<cmd>vertical resize +2<CR>', noremap_silent)

-- shifting stays in visual mode
set_keymap('v', '>', '>gv', noremap)
set_keymap('v', '<', '<gv', noremap)

-- escape from terminal mode
set_keymap('t', '<Esc>', [[<C-\><C-n>]], noremap)
set_keymap('t', '<C-l>', [[<C-\><C-n><C-w>l]], noremap)
set_keymap('t', '<C-k>', [[<C-\><C-n><C-w>k]], noremap)
set_keymap('t', '<C-j>', [[<C-\><C-n><C-w>j]], noremap)
set_keymap('t', '<C-h>', [[<C-\><C-n><C-w>h]], noremap)

-- launch fuzzy finder
set_keymap('n', '<leader>f', '<cmd>Telescope find_files<CR>', noremap_silent)
-- set_keymap('n', '<C-t>', '<cmd>Telescope live_grep<CR>', noremap_silent)

-- guifont resize
set_keymap('n', '<C-+>', '<cmd>lua require("luke.custom_funcs").resize_guifont(1)<CR>', noremap_silent)
set_keymap('n', '<C-->', '<cmd>lua require("luke.custom_funcs").resize_guifont(-1)<CR>', noremap_silent)
