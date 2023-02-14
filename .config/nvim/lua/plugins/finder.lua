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
        end,
    }
}
