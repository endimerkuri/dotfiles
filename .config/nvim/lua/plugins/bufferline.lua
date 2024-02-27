return {
    'akinsho/bufferline.nvim',
    event = 'VeryLazy',
    keys = {
        { '<leader>bp', '<Cmd>BufferLineTogglePin<CR>', desc = 'Toggle pin' },
        { '<leader>bP', '<Cmd>BufferLineGroupClose ungrouped<CR>', desc = 'Delete non-pinned buffers' },
        { '<leader>1', '<cmd>lua require(\"bufferline\").go_to(1, true)<cr>', desc = 'Go to first buffer' },
        { '<leader>2', '<cmd>lua require(\"bufferline\").go_to(2, true)<cr>', desc = 'Go to second buffer' },
        { '<leader>3', '<cmd>lua require(\"bufferline\").go_to(3, true)<cr>', desc = 'Go to third buffer' },
        { '<leader>4', '<cmd>lua require(\"bufferline\").go_to(4, true)<cr>', desc = 'Go to fourth buffer' },
        { '<leader>5', '<cmd>lua require(\"bufferline\").go_to(5, true)<cr>', desc = 'Go to fifth buffer' },
        { '<leader>6', '<cmd>lua require(\"bufferline\").go_to(6, true)<cr>', desc = 'Go to sixth buffer' },
        { '<leader>7', '<cmd>lua require(\"bufferline\").go_to(7, true)<cr>', desc = 'Go to seventh buffer' },
        { '<leader>8', '<cmd>lua require(\"bufferline\").go_to(8, true)<cr>', desc = 'Go to eighth buffer' },
        { '<leader>9', '<cmd>lua require(\"bufferline\").go_to(9, true)<cr>', desc = 'Go to ninth buffer' },
        { '<leader>0', '<cmd>lua require(\"bufferline\").go_to(-1, true)<cr>', desc = 'Go to last buffer' },
        { '[b', ':BufferLineCyclePrev<CR>', desc = 'Go to previous buffer' },
        { ']b', ':BufferLineCycleNext<CR>', desc = 'Go to next buffer' },
    },
    opts = {
        options = {
            diagnostics = 'nvim_lsp',
            diagnostics_indicator = function(count, level, diagnostics_dict, context)
                local icon = level:match('error') and '  ' or '  '
                return ' ' .. icon .. count
            end
        },
    },
}
