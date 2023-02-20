return {
    {
        'goolord/alpha-nvim',
        config = function(_, opts)
            require'alpha'.setup(require'alpha.themes.dashboard'.config)
        end
    }
}
