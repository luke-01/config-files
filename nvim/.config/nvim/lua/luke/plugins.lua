local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
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
	print('packer not available')
	return
end

return packer.startup({
	function(use)
		-- packer can manage itself
		use 'wbthomason/packer.nvim'

		-- colorscheme
		-- use 'Mofiqul/vscode.nvim'
		use 'joshdick/onedark.vim'

		-- treesitter
		use 'nvim-treesitter/nvim-treesitter'
		use 'nvim-treesitter/nvim-treesitter-context'
		use 'nvim-treesitter/playground'

		-- file tree
		use 'kyazdani42/nvim-web-devicons'
		use 'kyazdani42/nvim-tree.lua'

		-- lsp
		use 'neovim/nvim-lspconfig'

		-- autocomplete
		use "L3MON4D3/LuaSnip" -- snippet engine (required by cmp)
		use "hrsh7th/nvim-cmp"
		use "hrsh7th/cmp-buffer"
		use "hrsh7th/cmp-path"
		use "saadparwaiz1/cmp_luasnip"
		use "hrsh7th/cmp-nvim-lsp"
		use "hrsh7th/cmp-nvim-lua"

		-- fuzzy finder
		use { 'nvim-telescope/telescope.nvim', requires = { { 'nvim-lua/plenary.nvim' } } }
		use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

		-- utility stuff
		use 'windwp/nvim-autopairs'
		use 'numToStr/Comment.nvim'
		use 'JoosepAlviste/nvim-ts-context-commentstring'
		use 'akinsho/toggleterm.nvim'
		use 'lukas-reineke/indent-blankline.nvim'
		use 'akinsho/bufferline.nvim'

		-- status line
		use 'nvim-lualine/lualine.nvim'

		-- copilot
		use 'github/copilot.vim'

		if PACKER_BOOTSTRAP then
			require('packer').sync()
		end
	end,
	config = {
		display = {
			open_fn = function()
				return require('packer.util').float({ border = 'rounded' })
			end
		}
	}
})
