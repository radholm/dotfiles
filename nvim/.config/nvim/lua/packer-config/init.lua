vim.cmd.packadd('packer.nvim')

return require'packer'.startup(function()
    use('wbthomason/packer.nvim')
    use('ur4ltz/surround.nvim')
    use('nvim-lualine/lualine.nvim')
    use('Evalir/dosbox-vim-colorscheme')
    use('nvim-lua/popup.nvim')
    use('skywind3000/asyncrun.vim')
    use('terrortylor/nvim-comment')
    use({ 'nvim-telescope/telescope.nvim', requires = 'nvim-lua/plenary.nvim' })
    use('mg979/vim-visual-multi')
    use('nvim-telescope/telescope-file-browser.nvim')
    use('nvim-telescope/telescope-fzy-native.nvim')
    use('nvim-telescope/telescope-project.nvim')
    use('nvim-telescope/telescope-media-files.nvim')
    use('tpope/vim-fugitive')
    use('cedarbaum/fugitive-azure-devops.vim')
    use('xiyaowong/transparent.nvim')
    use({
        'phaazon/hop.nvim',
        branch = 'v2',
        config = function()
            require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
        end
    })
    use({'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'})
    use('nvim-treesitter/playground')
    use('theprimeagen/harpoon')
    use('theprimeagen/refactoring.nvim')
    use('mbbill/undotree')
    use('nvim-treesitter/nvim-treesitter-context')
    use({
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
        }
    })
    use('jose-elias-alvarez/null-ls.nvim')
    use('MunifTanjim/prettier.nvim')
    use('folke/zen-mode.nvim')
    use('github/copilot.vim')
    use('eandrju/cellular-automaton.nvim')
    use('laytan/cloak.nvim')
    use({
        'folke/trouble.nvim',
        config = function()
            require('trouble').setup {
                icons = false,
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    })
    use({
      'rmagatti/auto-session',
      config = function()
        require("auto-session").setup {
          log_level = "error",
          auto_session_suppress_dirs = { "~/", "~/Downloads", "/"},
        }
      end
    })
end)
