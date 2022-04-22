vim.opt.backup = false -- disables backup files, we'll use undofiles which are much more useful
vim.opt.clipboard = 'unnamedplus' -- allows copying and pasting directly from system clipboard
vim.opt.cmdheight = 2 -- more space in the command buffer for error messages
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' } -- only show 1 completion option, do not inmediately select an option when using completion
vim.opt.conceallevel = 0 -- specifically so certain characters aren't hidden in markdown files
vim.opt.hlsearch = true -- highlight all matches of the searched item
vim.opt.ignorecase = true -- case insensitive search
vim.opt.mouse = "a" -- enable use of mouse
vim.opt.pumheight = 10 -- height of the popup menu
vim.opt.showmode = false -- don't show what mode you're in (i.e: -- INSERT -- or -- VISUAL --)
vim.opt.showtabline = 2 -- always show open tabs
vim.opt.smartcase = true -- when combined with ignorecase, does case insensitive search if there you don't include capital letters, does case sensitive search if you do
vim.opt.smartindent = true -- self explanatory
vim.opt.splitbelow = true -- horizontal split opens new window below the current one
vim.opt.splitright = true -- vertical split opens new window to the right of the current one
vim.opt.swapfile = false -- nobody likes these
vim.opt.termguicolors = true -- some colorschemes require this
vim.opt.undofile = true -- creates a file that keeps the history of changes done to the edited file
vim.opt.updatetime = 300 -- faster completion
vim.opt.writebackup = true -- makes a backup of the currently edited file. In case of an error, the file is restored to the backed up state
vim.opt.expandtab = true -- tabs as spaces
vim.opt.shiftwidth = 2 -- amount of spaces to shift when using > and <
vim.opt.tabstop = 2 -- tab size
vim.opt.cursorline = true -- highlight the line under the cursor
vim.opt.number = true -- line numbers
vim.opt.relativenumber = true -- relative line numbers. In combination with number, the current line displays the current line number and all others are relative to the current line
vim.opt.signcolumn = "yes" -- shows special characters (like error or warning signs) beside line numbers
vim.opt.linebreak = true -- wrapped lines won't cut words in half
vim.opt.breakindent = true -- wrapped lines will maintain indentation
vim.opt.scrolloff = 8 -- scrolls the window if you go too up or to down inside it
vim.opt.guifont = 'Fira Code:h17' -- font to use in graphical applications
vim.opt.shortmess:append 'c' -- disables annoying messages in popup windows

-- automatically close file explorer if it's the only open buffer on a tab
vim.cmd([[
augroup close_file_group
autocmd!
autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
augroup END
]])
