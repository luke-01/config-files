call plug#begin(stdpath('data') . '/plugged')

Plug 'puremourning/vimspector'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'junegunn/fzf'
Plug 'airblade/vim-rooter'
Plug 'joshdick/onedark.vim'
Plug 'neovim/nvim-lspconfig'

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

Plug 'saadparwaiz1/cmp_luasnip'
Plug 'L3MON4D3/LuaSnip'

call plug#end()

" Visual Flares
set termguicolors
colorscheme onedark
set number
set relativenumber
set cursorline
set nowrap

" Correct Tabbing
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

" Undoing properly
set noswapfile
set undodir=~/.vim/undodir
set undofile

" Searching in a file properly
set nohlsearch
set incsearch
set ignorecase
set smartcase

" Splitting windows 
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

let mapleader = " "

" Terminal settings
tnoremap <Esc> <C-\><C-n>

function! OpenTerminal()
    vertical split
    terminal
endfunction

nnoremap <leader>t :call OpenTerminal()<CR>

" Some remaps
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i
inoremap ' ''<Esc>i
inoremap " ""<Esc>i

vnoremap ( c()<Esc>hp
vnoremap [ c[]<Esc>hp
vnoremap { c{}<Esc>hp
vnoremap ' c''<Esc>hp
vnoremap " c""<Esc>hp

nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l
nnoremap <leader>q <C-w>q

vnoremap <C-c> "+y
nnoremap Y y$
nnoremap <backspace> :bp<CR>

"----- PLUGIN CONFIGURATIONS -----"

lua << EOF

-- Treesitter
require'nvim-treesitter.configs'.setup{ highlight = { enable = true } }

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { 'clangd', 'rls', 'tsserver', 'pyright', 'gopls', 'gdscript' }
local nvim_lsp = require('lspconfig')
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    -- on_attach = my_custom_on_attach,
    capabilities = capabilities,
  }
end

nvim_lsp.diagnosticls.setup{
    capabilities = capabilities,
    filetypes = { 'javascript', 'javascriptreact', 'json', 'typescript', 'typescriptreact', 'css', 'less', 'scss', 'markdown', 'pandoc' },
  init_options = {
    linters = {
      eslint = {
        command = 'eslint_d',
        rootPatterns = { '.git' },
        debounce = 100,
        args = { '--stdin', '--stdin-filename', '%filepath', '--format', 'json' },
        sourceName = 'eslint_d',
        parseJson = {
          errorsRoot = '[0].messages',
          line = 'line',
          column = 'column',
          endLine = 'endLine',
          endColumn = 'endColumn',
          message = '[eslint] ${message} [${ruleId}]',
          security = 'severity'
        },
        securities = {
          [2] = 'error',
          [1] = 'warning'
        }
      },
    },
    filetypes = {
      javascript = 'eslint',
      javascriptreact = 'eslint',
      typescript = 'eslint',
      typescriptreact = 'eslint',
    },
    formatters = {
      eslint_d = {
        command = 'eslint_d',
        args = { '--stdin', '--stdin-filename', '%filename', '--fix-to-stdout' },
        rootPatterns = { '.git' },
      },
      prettier = {
        command = 'prettier',
        args = { '--stdin-filepath', '%filename' }
      }
    },
    formatFiletypes = {
      css = 'prettier',
      javascript = 'eslint_d',
      javascriptreact = 'eslint_d',
      json = 'prettier',
      scss = 'prettier',
      less = 'prettier',
      typescript = 'eslint_d',
      typescriptreact = 'eslint_d',
      json = 'prettier',
      markdown = 'prettier',
    }
  }
}


-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
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
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end,
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' }
  },
}

EOF

"LSP Keybindings
nnoremap gD :lua vim.lsp.buf.declaration()<CR>
nnoremap gd :lua vim.lsp.buf.definition()<CR>
nnoremap K :lua vim.lsp.buf.hover()<CR>
nnoremap gi :lua vim.lsp.buf.implementation()<CR>
nnoremap <C-k> :lua vim.lsp.buf.signature_help()<CR>
nnoremap <leader>D :lua vim.lsp.buf.type_definition()<CR>
nnoremap <leader>rn :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>ca :lua vim.lsp.buf.code_action()<CR>
nnoremap gr :lua vim.lsp.buf.references()<CR>
nnoremap <leader>e :lua vim.lsp.diagnostic.show_line_diagnostics()<CR>
nnoremap {g :lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap }g :lua vim.lsp.diagnostic.goto_next()<CR>

" Onedark
let g:onedark_terminal_italics=1

"Vim rooter
let g:rooter_patterns = ["Makefile", ".git", "CMakeLists.txt", "build.sh"]

" Vimspector settings
let g:vimspector_enable_mappings = 'VISUAL_STUDIO'
nnoremap <leader>dd :call vimspector#Launch()<CR>
