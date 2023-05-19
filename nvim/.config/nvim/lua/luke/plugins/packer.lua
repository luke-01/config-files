local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup({
	function(use)
		use 'wbthomason/packer.nvim'

		use 'navarasu/onedark.nvim'

		use 'nvim-treesitter/nvim-treesitter'
		use 'nvim-treesitter/nvim-treesitter-context'

		-- lsp plugins
		use 'neovim/nvim-lspconfig'
		use 'williamboman/mason.nvim' -- lsp/dap/linter installer
		use 'williamboman/mason-lspconfig.nvim'
		use 'RRethy/vim-illuminate'
		use 'onsails/lspkind.nvim'
		use 'nvimdev/lspsaga.nvim'

		-- neat things
		use 'numToStr/Comment.nvim'
		use 'windwp/nvim-autopairs'
		use 'lukas-reineke/indent-blankline.nvim'
		use 'akinsho/bufferline.nvim'
		use 'nvim-lualine/lualine.nvim'

		-- autocomplete
		use 'hrsh7th/cmp-nvim-lsp'
		use 'hrsh7th/cmp-buffer'
		use 'hrsh7th/cmp-path'
		use 'hrsh7th/cmp-cmdline'
		use 'hrsh7th/nvim-cmp'
		use 'L3MON4D3/LuaSnip'
		use 'saadparwaiz1/cmp_luasnip'

		-- file tree
		use 'nvim-tree/nvim-web-devicons'
		use 'nvim-tree/nvim-tree.lua'

		-- telescope
		use {
			'nvim-telescope/telescope.nvim',
			tag = '0.1.1',
			requires = { {'nvim-lua/plenary.nvim'} }
		}
		use {
			'nvim-telescope/telescope-fzf-native.nvim',
			run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
		}

		use 'github/copilot.vim'

		if packer_bootstrap then
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
