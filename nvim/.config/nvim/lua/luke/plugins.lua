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
	print('packer not available')
	return
end


return packer.startup({
	function(use)
		-- packer can manage itself
		use 'wbthomason/packer.nvim'

		-- colorscheme
		use 'joshdick/onedark.vim'

		use 'windwp/nvim-autopairs'
		use 'numToStr/Comment.nvim'
		use 'nvim-tree/nvim-web-devicons'
		use 'nvim-tree/nvim-tree.lua'
		use 'akinsho/bufferline.nvim'
		use 'nvim-lualine/lualine.nvim'
		use 'akinsho/toggleterm.nvim'
		use 'lukas-reineke/indent-blankline.nvim'
		use 'ahmedkhalf/project.nvim'

		-- autocomplete
		use 'hrsh7th/nvim-cmp'
		use 'hrsh7th/cmp-buffer'
		use 'hrsh7th/cmp-path'
		use 'hrsh7th/cmp-nvim-lsp'
		use 'hrsh7th/cmp-nvim-lua'
		use 'L3MON4D3/LuaSnip'
		use 'saadparwaiz1/cmp_luasnip'

		-- lsp
		use 'neovim/nvim-lspconfig'
		use 'williamboman/mason.nvim' -- lsp/dap/linter installer
		use 'williamboman/mason-lspconfig.nvim'
		use 'jose-elias-alvarez/null-ls.nvim'
		use 'RRethy/vim-illuminate'

		-- telescope (fuzzy finder) plugins
		use { 'nvim-telescope/telescope.nvim', requires = {{ 'nvim-lua/plenary.nvim' }} }
		use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }

		-- treesitter
		use 'nvim-treesitter/nvim-treesitter'
		use 'nvim-treesitter/playground'
		use 'nvim-treesitter/nvim-treesitter-context'

		use 'github/copilot.vim'

		if PACKER_BOOTSTRAP then
			packer.sync()
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
