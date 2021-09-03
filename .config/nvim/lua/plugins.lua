-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()

    -- UI plugins
    use {"ellisonleao/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}
    use 'mhinz/vim-startify'
    use 'Yggdroot/indentLine'
    use {
        'hoob3rt/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }
    use {
        "jose-elias-alvarez/buftabline.nvim",
        requires = {"kyazdani42/nvim-web-devicons"}, -- optional!
        config = function() require("buftabline").setup {} end
    }

    use 'lambdalisue/nerdfont.vim'

    -- Vim vinegar
    use 'tpope/vim-vinegar'

    -- Fuzzy finder
    use {
        'junegunn/fzf',
        run = vim.fn['fzf#install()']
    }
    use 'junegunn/fzf.vim'

    -- LSP client
    use 'neovim/nvim-lspconfig'

    -- Completion
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-path'

    -- Debugger
    use 'puremourning/vimspector'

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

    -- Misc
    use 'airblade/vim-rooter'
    use 'tpope/vim-commentary'
    use 'jiangmiao/auto-pairs'
        
    use 'vim-test/vim-test'
    use 'mfussenegger/nvim-dap'
    use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
    use 'tpope/vim-dotenv'
end)

