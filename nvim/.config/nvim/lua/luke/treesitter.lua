local configs = require('nvim-treesitter.configs')
configs.setup({
  ensure_installed = 'all',
  sync_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },
  autopairs = {
    enable = true,
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  }
})
