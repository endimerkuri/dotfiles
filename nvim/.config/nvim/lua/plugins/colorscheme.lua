return {
    -- {
    --     "catppuccin/nvim",
    --     name = "catppuccin",
    --     priority = 1000,
    --     config = function()
    --         require('catppuccin').setup{}
    --         vim.cmd([[colorscheme catppuccin]])
    --     end
    -- }
    {
        "rebelot/kanagawa.nvim",
        name = "kanagawa",
        priority = 1000,
        config = function()
            require('kanagawa').setup{}
            vim.cmd([[colorscheme kanagawa]])
        end
    }
}
