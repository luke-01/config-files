local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = vim.fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path
    })
    vim.cmd("packadd packer.nvim")
end

vim.cmd [[
augroup packer_init_group
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]]

local ok, packer = pcall(require, "packer")
if not ok then
    print("couldn't load packer module, exiting...")
    return
end

packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end 
    }
})

return packer.startup(function(use)
    use "wbthomason/packer.nvim"
    use "real-99/onedarker.nvim"
    use "joshdick/onedark.vim"

    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-cmdline"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-nvim-lua"
    use "hrsh7th/nvim-cmp"

    use "L3MON4D3/LuaSnip"
    use "saadparwaiz1/cmp_luasnip"
    use "rafamadriz/friendly-snippets"

    use "neovim/nvim-lspconfig"
    use "williamboman/nvim-lsp-installer"

    use 'kyazdani42/nvim-web-devicons'
    use { 'kyazdani42/nvim-tree.lua', config = function() require("nvim-tree").setup({}) end }

    use { 'nvim-treesitter/nvim-treesitter',
        config = function()
            require('nvim-treesitter.configs').setup({
                ensure_installed = "all",
                sync_install = false,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = true,
                },
                indent = { enable = false },
            })
        end
    }

    if PACKER_BOOTSTRAP then
        packer.sync()
    end
end)
