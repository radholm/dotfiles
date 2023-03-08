return require'packer'.startup(function()
    use 'wbthomason/packer.nvim'
    use 'ur4ltz/surround.nvim'
    use 'nvim-lua/popup.nvim'
    use 'williamboman/nvim-lsp-installer'
    use 'neovim/nvim-lspconfig'
    use 'terrortylor/nvim-comment'
    -- use 'jose-elias-alvarez/null-ls.nvim'
    use { 'nvim-telescope/telescope.nvim', requires = 'nvim-lua/plenary.nvim' }
    use 'nvim-telescope/telescope-file-browser.nvim'
    use 'nvim-telescope/telescope-fzy-native.nvim'
    use 'nvim-telescope/telescope-project.nvim'
    use 'nvim-telescope/telescope-media-files.nvim'
    use 'kyazdani42/nvim-web-devicons'
    use 'tpope/vim-fugitive'
    use {
        'glacambre/firenvim',
        run = function() vim.fn['firenvim#install'](0) end
    }
    use {
        'phaazon/hop.nvim',
        branch = 'v2',
        config = function()
            require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
        end
    }
    use 'lewis6991/gitsigns.nvim'
    -- use 'glepnir/indent-guides.nvim'
    use 'nvim-treesitter/nvim-treesitter'
    use 'EdenEast/nightfox.nvim'
    use 'sainnhe/gruvbox-material'
end)
