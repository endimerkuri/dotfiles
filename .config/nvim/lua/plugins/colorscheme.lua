return {
    -- gruvbox
    {
        'ellisonleao/gruvbox.nvim',
        name = 'gruvbox',
        priority = 1000,
        config = function()
            require('gruvbox').setup({
                contrast = 'hard'
            })
            vim.cmd([[colorscheme gruvbox]])
        end,
    },
}

