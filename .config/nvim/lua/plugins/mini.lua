return {
    {
        'echasnovski/mini.nvim',
        version = false,
        config = function()
            trailspace = require('mini.trailspace')
            trailspace.setup()
            starter = require('mini.starter')
            starter.setup({
                evaluate_single = true,
                items = {
                    {
                        name = 'Find file',
                        section = 'Actions',
                        action = 'lua require("telescope.builtin").git_files()'
                    },
                    {
                        name = 'Projects',
                        section = 'Actions',
                        action = 'lua require"telescope".extensions.project.project{ display_type = "full" }'
                    },
                    {
                        name = 'Config',
                        section = 'Actions',
                        action = 'e $MYVIMRC'
                    },
                    {
                        name = 'Lazy',
                        section = 'Actions',
                        action = 'Lazy'
                    },
                    {
                        name = 'Mason',
                        section = 'Actions',
                        action = 'Mason'
                    },
                    starter.sections.recent_files(10, true),
                    starter.sections.builtin_actions(),
                }
            })
        end
    },
}
