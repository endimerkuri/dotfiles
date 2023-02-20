return {
    "tpope/vim-dadbod",
    {
        "kristijanhusak/vim-dadbod-ui",
        config = function(_, opts)
            vim.keymap.set('n', '<leader>od', ':DBUIToggle<CR>',
                { noremap = true, desc = "Open database UI" })
            vim.g.db_ui_win_position = 'right'
            vim.g.db_ui_use_nerd_fonts = true
            vim.g.db_ui_auto_execute_table_helpers = true
            vim.g.db_ui_icons = {
                expanded = {
                    db = '▾  ',
                    buffers = '▾  ',
                    saved_queries = '▾  ',
                    schemas = '▾  ',
                    schema = '▾ פּ ',
                    tables = '▾ 藺 ',
                    table = '▾  ',
                },
                collapsed = {
                    db = '▸  ',
                    buffers = '▸  ',
                    saved_queries = '▸  ',
                    schemas = '▸  ',
                    schema = '▸ פּ ',
                    tables = '▸ 藺 ',
                    table = '▸  ',
                },
                saved_query = ' ',
                new_query = '璘 ',
                tables = '離 ',
                buffers = '﬘ ',
                add_connection = ' ',
                connection_ok = '✓ ',
                connection_error = '✕ ',
            }
        end
}
}
