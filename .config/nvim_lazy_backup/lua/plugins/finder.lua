return {
    {
        'nvim-telescope/telescope.nvim',
        opts = {
            defaults = {
                layout_config = {
                    width = 0.9,
                    height = 0.9,
                },
                preview = {
                    treesitter = false
                }
            }
        },
        config = function(_, opts)
            require('telescope').setup(opts)
            vim.keymap.set('n', '<leader>f', ':Telescope find_files<CR>', { noremap = true })
            vim.keymap.set('n', '<leader>b', ':Telescope buffers<CR>', { noremap = true })
            vim.keymap.set('n', '<leader>ts', ':Telescope grep_string<CR>', { noremap = true })
            vim.keymap.set('n', '<c-p>', ':Telescope live_grep<CR>', { noremap = true })
            vim.keymap.set('n', '<leader>op', ':Telescope projects<CR>', { noremap = true })
            vim.keymap.set('n', '<leader>os', ':Telescope lsp_document_symbols<CR>', { noremap = true })
        end,
    }
}
