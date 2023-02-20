return {
    {
        'lewis6991/gitsigns.nvim',
        config = function(_, opts)
            vim.keymap.set('n', '<leader>gs', ':Gedit :<CR>', {})
            vim.keymap.set('n', '<leader>gu', ':G pull<CR>', {})
            vim.keymap.set('n', '<leader>gb', ':G blame<CR>', {})

            require('gitsigns').setup{
                keymaps = {
                    noremap = true,
                    ['n ]c'] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'"},
                    ['n [c'] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'"},
                    ['n ghs'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
                    ['v ghs'] = '<cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
                    ['n ghu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
                    ['n ghr'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
                    ['v ghr'] = '<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
                    ['n ghR'] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',
                    ['n ghp'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
                    ['n ghb'] = '<cmd>lua require"gitsigns".blame_line{full=true}<CR>',
                }
            }
        end,
    }
}
