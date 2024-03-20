return {
    { 'nvim-lua/plenary.nvim', lazy = true },
    'tpope/vim-sleuth',
    {
        'gennaro-tedesco/nvim-jqx',
        ft = { 'json', 'yaml' },
    },
    { 'tpope/vim-vinegar' },
    'tpope/vim-projectionist',
    {
        'monaqa/dial.nvim',
        config = function ()
            local dial = require'dial.map'
            local augend = require'dial.augend'
            require'dial.config'.augends:register_group{
                -- default augends used when no group name is specified
                default = {
                    augend.integer.alias.decimal,
                    augend.integer.alias.hex,
                    augend.date.alias['%Y/%m/%d'],
                    augend.constant.alias.bool,
                    augend.constant.new{
                        elements = { 'True', 'False' },
                        word = true,
                        cyclic = true,
                    }
                }
            }
            vim.keymap.set('n', '<C-a>', dial.inc_normal(), { noremap = true })
            vim.keymap.set('n', '<C-x>', dial.dec_normal(), { noremap = true })
            vim.keymap.set('v', '<C-a>', dial.inc_visual(), { noremap = true })
            vim.keymap.set('v', '<C-x>', dial.dec_visual(), { noremap = true })
            vim.keymap.set('v', 'g<C-a>', dial.inc_gvisual(), { noremap = true })
            vim.keymap.set('v', 'g<C-x>', dial.dec_gvisual(), { noremap = true })
        end
    },
    {
        "jellydn/hurl.nvim",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "nvim-treesitter/nvim-treesitter"
        },
        ft = "hurl",
        opts = {
            auto_close = false,
            -- Show debugging info
            debug = false,
            -- Show notification on run
            show_notification = false,
            -- Show response in popup or split
            mode = "split",
            -- Default formatter
            formatters = {
                json = { 'jq' }, -- Make sure you have install jq in your system, e.g: brew install jq
                html = {
                    'prettier', -- Make sure you have install prettier in your system, e.g: npm install -g prettier
                    '--parser',
                    'html',
                },
            },
        },
        keys = {
            -- Run API request
            { "<leader>or", "<cmd>HurlRunner<CR>", desc = "Run All requests" },
            -- { "<leader>a", "<cmd>HurlRunnerAt<CR>", desc = "Run Api request" },
            -- { "<leader>te", "<cmd>HurlRunnerToEntry<CR>", desc = "Run Api request to entry" },
            -- { "<leader>tm", "<cmd>HurlToggleMode<CR>", desc = "Hurl Toggle Mode" },
            -- { "<leader>or", "<cmd>HurlVerbose<CR>", desc = "Run Api in verbose mode" },
            -- -- Run Hurl request in visual mode
            -- { "<leader>h", ":HurlRunner<CR>", desc = "Hurl Runner", mode = "v" },
        },
    },
    {
        "folke/edgy.nvim",
        event = "VeryLazy",
        opts = {
            right = {
                { title = "Hurl Nvim", size = { width = 0.5 }, ft = "hurl-nvim" },
            }
        }
    },
    'tpope/vim-dotenv',
    'mbbill/undotree',
    'ludovicchabant/vim-gutentags',
    'hudclark/grpc-nvim',
    'airblade/vim-rooter',
    { 'lukas-reineke/indent-blankline.nvim', main = 'ibl', opts = {} },
    {    
        'windwp/nvim-autopairs',
        config = function ()
            require('nvim-autopairs').setup {}
        end
    },
    'tpope/vim-surround',
    'github/copilot.vim',
}
