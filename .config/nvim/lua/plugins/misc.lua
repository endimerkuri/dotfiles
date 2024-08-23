return {
    { 'wakatime/vim-wakatime', lazy = false },
    { 'folke/neodev.nvim', opts = {} },
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
        {
            'mistweaverco/kulala.nvim',
            config = function()
                require('kulala').setup({
                    default_view = 'headers_body'
                })
                vim.api.nvim_set_keymap("n", "<leader>or", ":lua require('kulala').run()<CR>", { noremap = true, silent = true })
            end
        },
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
            require('nvim-autopairs').setup{}
        end
    },
    'tpope/vim-surround',
    'github/copilot.vim',
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function ()
            local harpoon = require('harpoon')
            harpoon.setup()

            vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
            vim.keymap.set("n", "<leader>.", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
            vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
            vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
            vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
            vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)
        end
    }
}
