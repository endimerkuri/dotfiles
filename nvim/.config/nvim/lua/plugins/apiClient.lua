return {
    {
        'mistweaverco/kulala.nvim',
        ft = 'http',
        opts = {
            default_winbar_panes = { "body", "headers", "script_output" },
            winbar = true,
            load = {
                ["core.defaults"] = {},
            },
        },
        keys = {
            { '<leader>or', function() require('kulala').run() end, desc = 'Send request' }
        }
    },
    {
        'hudclark/grpc-nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function ()
            vim.keymap.set('n', '<leader>og', ':Grpc<CR>', { noremap = true })
        end
    },
}
