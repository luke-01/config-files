call plug#begin(stdpath('data') . '/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'puremourning/vimspector'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
Plug 'joshdick/onedark.vim'

call plug#end()


" Visual Flares
set termguicolors
colorscheme onedark
set number
set relativenumber
set cursorline

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

"fzf.vim maps :W to something annoying and I always do it by accident
cnoremap W w

"----- PLUGIN CONFIGURATIONS -----"
" Treesitter

lua << EOF
require'nvim-treesitter.configs'.setup{ highlight = { enable = true } }
EOF

" Onedark
let g:onedark_terminal_italics=1

"Vim rooter
let g:rooter_patterns = ["Makefile", ".git", "CMakeLists.txt", "build.sh"]

" COC nvim
" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> {g <Plug>(coc-diagnostic-prev)
nmap <silent> }g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gy <Plug>(coc-type-definition)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> <leader>gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction


" Vimspector Settings
let g:vimspector_enable_mappings = 'VISUAL_STUDIO'
nnoremap <leader>dd :call vimspector#Launch()<CR>

" FZF Settings
nnoremap <C-p> :Files<CR>
