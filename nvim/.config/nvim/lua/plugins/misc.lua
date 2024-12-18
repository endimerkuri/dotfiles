return {
    { 'wakatime/vim-wakatime', lazy = false },
    { 'folke/neodev.nvim', opts = {} },
    { 'nvim-lua/plenary.nvim', lazy = true },
    'tpope/vim-sleuth',
    {
        'gennaro-tedesco/nvim-jqx',
        ft = { 'json', 'yaml' },
    },
    {
        'tpope/vim-projectionist',
        config = function ()
            vim.keymap.set("n", "]r", ":A<CR>", { noremap = true })
        end
    },
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
    'tpope/vim-dotenv',
    {
        'mbbill/undotree',
        config = function ()
            vim.keymap.set('n', '<leader>ou', ':UndotreeToggle<CR>', { noremap = true })
        end
    },
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
}
