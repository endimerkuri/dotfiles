return {
    {
        'romgrk/barbar.nvim',
        config = function(_, opts)
            -- Easier keybindings to switch buffers
            local map = vim.keymap.set
            local opts = { noremap = true, silent = true }
            vim.g.bufferline = {
                animation = false,
            }
            -- Move to previous/next
            map('n', '<leader><S-Tab>', ':BufferPrevious<CR>', opts)
            map('n', '<leader><Tab>', ':BufferNext<CR>', opts)
            -- Re-order to previous/next
            -- map('n', '<A-<>', ':BufferMovePrevious<CR>', opts)
            -- map('n', '<A->>', ' :BufferMoveNext<CR>', opts)
            -- Goto buffer in position...
            map('n', '<leader>1', ':BufferGoto 1<CR>', opts)
            map('n', '<leader>2', ':BufferGoto 2<CR>', opts)
            map('n', '<leader>3', ':BufferGoto 3<CR>', opts)
            map('n', '<leader>4', ':BufferGoto 4<CR>', opts)
            map('n', '<leader>5', ':BufferGoto 5<CR>', opts)
            map('n', '<leader>6', ':BufferGoto 6<CR>', opts)
            map('n', '<leader>7', ':BufferGoto 7<CR>', opts)
            map('n', '<leader>8', ':BufferGoto 8<CR>', opts)
            map('n', '<leader>9', ':BufferGoto 9<CR>', opts)
            map('n', '<leader>0', ':BufferLast<CR>', opts)
            -- Close buffer
            map('n', '<leader>wd', ':BufferClose<CR>', opts)
            -- Wipeout buffer
            --                 :BufferWipeout<CR>
            -- Close commands
            --                 :BufferCloseAllButCurrent<CR>
            --                 :BufferCloseBuffersLeft<CR>
            --                 :BufferCloseBuffersRight<CR>
            -- Magic buffer-picking mode
            -- map('n', '<C-p>', ':BufferPick<CR>', opts)
            -- Sort automatically by...
            -- map('n', '<Space>bb', ':BufferOrderByBufferNumber<CR>', opts)
            -- map('n', '<Space>bd', ':BufferOrderByDirectory<CR>', opts)
            -- map('n', '<Space>bl', ':BufferOrderByLanguage<CR>', opts)

            -- Other:
            -- :BarbarEnable - enables barbar (enabled by default)
            -- :BarbarDisable - very bad command, should never be used
        end,
    }
}
