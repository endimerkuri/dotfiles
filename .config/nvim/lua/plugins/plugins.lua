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

    use 'lambdalisue/nerdfont.vim'

    -- Vim vinegar
    use 'tpope/vim-vinegar'

    -- Fuzzy finder
    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    -- LSP client
    use 'neovim/nvim-lspconfig'
    use 'onsails/lspkind-nvim'
    use 'simrat39/symbols-outline.nvim'

    -- Completion
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-path'
    use 'quangnguyen30192/cmp-nvim-ultisnips'

    -- Snippets
    use 'SirVer/ultisnips'
    use 'honza/vim-snippets'

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
    -- use 'tpope/vim-commentary'
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    use 'jiangmiao/auto-pairs'
    use 'tpope/vim-surround'

    -- Formatting
    use 'sbdchd/neoformat'

    use 'dstein64/vim-startuptime'
    use 'junegunn/goyo.vim'

    use {
        "folke/zen-mode.nvim",
        config = function()
            require("zen-mode").setup {
            }
        end
    }
    use 'chriskempson/base16-vim'
end)

