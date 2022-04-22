local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap 

keymap("n", "<space>", "<nop>", opts)
vim.g.mapleader = " "

keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "<C-Up>", "<cmd>resize -2<CR>", opts)
keymap("n", "<C-Down>", "<cmd>resize +2<CR>", opts)
keymap("n", "<C-Left>", "<cmd>vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", "<cmd>vertical resize +2<CR>", opts)

keymap("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", opts)

keymap("v", ">", ">gv", opts)
keymap("v", "<", "<gv", opts)

keymap("t", "<Esc>", [[<C-\><C-n>]], opts)

keymap("n", "<backspace>", "<cmd>bp<CR>", opts)
keymap("n", "<leader><leader>", "<cmd>set hlsearch!<CR>", opts)
