local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path
  })
  vim.cmd('packadd packer.nvim')
end


local ok, packer = pcall(require, 'packer')
if not ok then
  print("couldn't load packer module, exiting...")
  return
end

packer.init({
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'rounded' })
    end
  }
})

return packer.startup(function(use)
  use 'wbthomason/packer.nvim' -- packer can manage itself
  use 'joshdick/onedark.vim' -- colorscheme

  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp" -- lsp completions
  use "hrsh7th/cmp-nvim-lua" -- lua completions

  -- snippets
  use "L3MON4D3/LuaSnip" -- snippet engine
  use "rafamadriz/friendly-snippets" -- some neat snippets

  -- LSP plugins
  use "neovim/nvim-lspconfig" -- convenience wrapper around the lsp api
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer

  use {
    'nvim-telescope/telescope.nvim', -- fuzzy finder
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' } -- make telescope use fzf natively

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' } -- treesitter for syntax better syntax highlighting

  use 'windwp/nvim-autopairs' -- automatically pair stuff like quotes and parenthesis

  use 'numToStr/Comment.nvim' -- comment out lines and block of code
  use 'JoosepAlviste/nvim-ts-context-commentstring' -- contextual comment styles

  use {
    'kyazdani42/nvim-tree.lua', -- file explorer
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    }
  }

  use {
    'akinsho/bufferline.nvim', -- buffer line to replace tab line at the top
    requires = 'kyazdani42/nvim-web-devicons',
  }

  use 'akinsho/toggleterm.nvim' -- terminal
  use {
    'nvim-lualine/lualine.nvim', -- status line
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
  }

  use 'github/copilot.vim'

  if PACKER_BOOTSTRAP then
    packer.sync()
  end
end)
