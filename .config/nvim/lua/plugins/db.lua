return {
    'tpope/vim-dadbod',
    'kristijanhusak/vim-dadbod-completion',
    {
        'kristijanhusak/vim-dadbod-ui',
        config = function()
            vim.keymap.set('n', '<leader>od', ':DBUIToggle<CR>', { noremap = true })
            vim.g.db_ui_win_position = 'left'
            vim.g.db_ui_use_nerd_fonts = true
            vim.g.db_ui_icons = {
                expanded = {
                    db = '▾  ',
                    buffers = '▾  ',
                    saved_queries = '▾  ',
                    schemas = '▾  ',
                    schema = '▾  ',
                    tables = '▾  ',
                    table = '▾  ',
                },
                collapsed = {
                    db = '▸  ',
                    buffers = '▸  ',
                    saved_queries = '▸  ',
                    schemas = '▸  ',
                    schema = '▸  ',
                    tables = '▸  ',
                    table = '▸  ',
                },
                saved_query = ' ',
                new_query = ' ',
                tables = ' ',
                buffers = ' ',
                add_connection = ' ',
                connection_ok = '✓ ',
                connection_error = '✕ ',
            }

        end
    }
}
