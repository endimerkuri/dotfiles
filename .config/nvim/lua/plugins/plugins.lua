require('packer').startup(function()

    -- UI plugins
    use {"ellisonleao/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}
    use 'mhinz/vim-startify'
    use 'Yggdroot/indentLine'
    use {
        'hoob3rt/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }
    use {
        'romgrk/barbar.nvim',
        requires = {'kyazdani42/nvim-web-devicons'}
    }

    -- Vim vinegar
    use 'tpope/vim-vinegar'

    -- Fuzzy finder
    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    -- LSP client
    use 'neovim/nvim-lspconfig'
    use 'onsails/lspkind-nvim'
    use 'simrat39/symbols-outline.nvim'
    use 'jose-elias-alvarez/null-ls.nvim'
    use { 'glepnir/lspsaga.nvim' }
    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("trouble").setup {}
        end
    }

    -- Completion
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-path'

    -- Snippets
    use 'SirVer/ultisnips'
    use 'honza/vim-snippets'
    use 'quangnguyen30192/cmp-nvim-ultisnips'

    -- Git plugins
    use 'tpope/vim-fugitive'
    use 'idanarye/vim-merginal'
    use 'nvim-lua/plenary.nvim'
    use 'lewis6991/gitsigns.nvim'

    -- Maximizer
    use 'szw/vim-maximizer'

    -- Syntax highlighting
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    -- VimWiki
    use 'vimwiki/vimwiki'

    -- Database
    use 'tpope/vim-dadbod'
    use 'kristijanhusak/vim-dadbod-ui'

    -- UndoTree
    use 'mbbill/undotree'

    -- Tests
    use 'vim-test/vim-test'

    -- Debugger
    use 'mfussenegger/nvim-dap'
    use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }

    -- .env files support
    use 'tpope/vim-dotenv'

    -- Misc
    use 'airblade/vim-rooter'
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    use 'windwp/nvim-autopairs'
    use 'tpope/vim-surround'

    -- Formatting
    use 'sbdchd/neoformat'

    use 'dstein64/vim-startuptime'
    use 'junegunn/goyo.vim'
    use {
        "NTBBloodbath/rest.nvim",
        requires = { "nvim-lua/plenary.nvim" },
        config = function()
            require("rest-nvim").setup({
                -- Open request results in a horizontal split
                result_split_horizontal = false,
                -- Skip SSL verification, useful for unknown certificates
                skip_ssl_verification = false,
                -- Highlight request on run
                highlight = {
                    enabled = true,
                    timeout = 150,
                },
                result = {
                    -- toggle showing URL, HTTP info, headers at top the of result window
                    show_url = true,
                    show_http_info = true,
                    show_headers = true,
                },
                -- Jump to request line on run
                jump_to_request = false,
                env_file = '.env',
                custom_dynamic_variables = {},
                yank_dry_run = true,
            })
        end
    }
    use 'monaqa/dial.nvim'
end)

