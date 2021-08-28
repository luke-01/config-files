" nice defaults
syntax on
filetype plugin indent on
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set noswapfile
set undodir=~/.vim/undodir
set undofile
set nohlsearch
set incsearch
set ignorecase
set smartcase
set number
set relativenumber
set nowrap
set splitright
set splitbelow
set noshowmode
set hidden
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes
set termguicolors
set colorcolumn=100
set completeopt+=menuone,noinsert,noselect
set mouse=nv
set keywordprg=:vertical\ Man

let mapleader = " "

" Terminal settings
tnoremap <Esc> <C-\><C-n>

function! OpenTerminal()
    split
    terminal
    resize 7
endfunction

nnoremap <leader>t :call OpenTerminal()<CR>

" Necessary or I will lose my mind
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

"Plugins
call plug#begin(stdpath('data') . '/plugged')

"Utilities
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'

"Visual Stuff
Plug 'itchyny/lightline.vim'
Plug 'joshdick/onedark.vim'

call plug#end()

"Colorscheme
let g:lightline = {'colorscheme': 'one'}
colorscheme onedark

"LSP and Completion
let g:completion_matching_strategy_list = ["exact", "substring", "fuzzy"]
let g:completion_enable_auto_signature = 0

lua << EOF
require'lspconfig'.clangd.setup{on_attach=require'completion'.on_attach}
require'lspconfig'.tsserver.setup{on_attach=require'completion'.on_attach}

require'nvim-treesitter.configs'.setup{highlight = {enable = true}}
EOF

nnoremap <leader>gk :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>gd :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>gD :lua vim.lsp.buf.declaration()<CR>
nnoremap <leader>gR :lua vim.lsp.buf.rename()<CR>

"Vim rooter
let g:rooter_patterns = ["Makefile", ".git", "CMakeLists.txt", "build.sh"]


"Netrw settings
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_liststyle = 3
let g:netrw_winsize = 15
nnoremap <leader>p :Vex<CR>

"FZF settings
nnoremap <C-p> :Files<CR>
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
"Get Files
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)


" Get text in files with Rg
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

" Ripgrep advanced
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

"GUI (neovide) settings
let g:neovide_fullscreen=v:false
set guifont=Fira\ Code:h12
