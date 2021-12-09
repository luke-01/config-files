" ================================ Plugins ================================

filetype plugin indent on

call plug#begin(stdpath('data') . '/plugged')

Plug 'joshdick/onedark.vim'

Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'neovim/nvim-lspconfig'
Plug 'onsails/lspkind-nvim'
Plug 'tami5/lspsaga.nvim'

Plug 'kyazdani42/nvim-tree.lua'
Plug 'kyazdani42/nvim-web-devicons'

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

Plug 'saadparwaiz1/cmp_luasnip'
Plug 'L3MON4D3/LuaSnip'


call plug#end()

" ================================ Settings ================================

" Visual Flares
set termguicolors
set background=dark
set number
set relativenumber
set cursorline
set linebreak " Break lines on a new word instead of whereever the cutoff was

colorscheme onedark

" Correct Tabbing
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent

" Undoing Properly
set noswapfile
set undofile

" Searching in a file properly
set incsearch
set ignorecase
set smartcase

" Splitting Windows
set splitright
set splitbelow

" Settings recommended by coc.nvim
set hidden
set nowritebackup
set nobackup
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes

" Some nice utilities
set completeopt=menu,menuone,noinsert,noselect,preview
set mouse=nv
set keywordprg=:vertical\ Man
set exrc

" ================================ Keybinds ================================

let mapleader= " "

" Terminal Keybinds
tnoremap <Esc> <C-\><C-n>

function! OpenTerminal()
    vertical split
    terminal
endfunction

nnoremap <silent> <leader>t :call OpenTerminal()<CR>

nnoremap <silent> <C-x> :Lspsaga open_floaterm<CR>
tnoremap <silent> <C-x> <C-\><C-n>:Lspsaga close_floaterm<CR>

" Navegating Splits
nnoremap <M-h> <C-w>h
nnoremap <M-j> <C-w>j
nnoremap <M-k> <C-w>k
nnoremap <M-l> <C-w>l

" LSP commands
nnoremap <silent> gh :Lspsaga lsp_finder<CR>
nnoremap <silent> <leader>ca :Lspsaga code_action<CR>
vnoremap <silent> <leader>ca :<C-U>Lspsaga range_code_action<CR>
nnoremap <silent> K :Lspsaga hover_doc<CR>
nnoremap <silent> <C-k> :Lspsaga signature_help<CR>
nnoremap <silent> <leader>rn :Lspsaga rename<CR>
nnoremap <silent> <leader>e :Lspsaga show_line_diagnostics<CR>
nnoremap <silent> {d :Lspsaga diagnostic_jump_prev<CR>
nnoremap <silent> }d :Lspsaga diagnostic_jump_next<CR>

nnoremap <silent> gD :lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gd :lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gi :lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <leader>wa :lua vim.lsp.buf.add_workspace_folder()<CR>
nnoremap <silent> <leader>wr :lua vim.lsp.buf.remove_workspace_folder()<CR>
nnoremap <silent> <leader>wl :lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>
nnoremap <silent> <leader>D :lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr :lua vim.lsp.buf.references()<CR>
nnoremap <silent> <leader>q :lua vim.diagnostic.setloclist()<CR>
nnoremap <silent> <leader>f :lua vim.lsp.buf.formatting()<CR>

" file explorer
nnoremap <silent> <C-n> :NvimTreeToggle<CR>

" misc
nnoremap <silent> <backspace> :bp<CR>
nnoremap <silent> <leader><leader> :set hlsearch!<CR>

" ================================ Plugin Config ================================

lua << EOF

-- nvim-tree
require('nvim-tree').setup({})

-- Treesitter
require('nvim-treesitter.configs').setup({ highlight = { enable = true } })

-- LSPConfig
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local servers = { 'clangd', 'tsserver', 'eslint', 'pyright', 'gopls' }
local nvim_lsp = require('lspconfig')
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup({ capabilities = capabilities })
end

-- LspSaga
require('lspsaga').setup()

-- nvim-cmp
local cmp = require('cmp')
cmp.setup ({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' }
  },
  formatting = {
      format = require('lspkind').cmp_format()
  },
})

EOF
