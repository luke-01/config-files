require 'luke.keymaps'
require 'luke.options'

if not vim.g.vscode then
	require 'luke.plugins'
	require 'luke.lsp'
	require 'luke.treesitter'
	require 'luke.nvim-tree'
	require 'luke.cmp'
	require 'luke.autopairs'
	require 'luke.comment'
	require 'luke.bufferline'
	require 'luke.lualine'
	require 'luke.toggleterm'
	require 'luke.telescope'
	require 'luke.project'
end
