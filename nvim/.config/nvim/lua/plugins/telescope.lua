return {
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make'
    },
    'nvim-telescope/telescope-project.nvim',
    {
        'nvim-telescope/telescope.nvim',
        config = function()
            vim.g.rooter_patterns = { '.git' }

            local telescope = require'telescope'

            require('telescope').setup{
                file_ignore_patterns = { "tags*" },
                defaults = {
                    layout_config = {
                        width = 0.9,
                        height = 0.9,
                    },
                    preview = {
                        treesitter = false
                    },
                    extensions = {
                        fzf = {
                            fuzzy = true,                    -- false will only do exact matching
                            override_generic_sorter = true,  -- override the generic sorter
                            override_file_sorter = true,     -- override the file sorter
                            case_mode = 'smart_case',        -- or "ignore_case" or "respect_case"
                            -- the default case_mode is "smart_case"
                        }
                    }
                }
            }
            telescope.load_extension('project')

            vim.keymap.set('n', '<leader>f', ':Telescope find_files<CR>', {
                noremap = true,
                desc = "Fuzzy find files"
            })
            vim.keymap.set('n', '<leader>,', ':Telescope buffers<CR>', {
                noremap = true,
                desc = "Fuzzy find open buffers"
            })
            vim.keymap.set('n', '<c-p>', ':Telescope live_grep<CR>', {
                noremap = true,
                desc = "Live grep"
            })
            vim.keymap.set('n', '<leader>sw', ':Telescope grep_string<CR>', {
                noremap = true,
                desc = "Grep string in project"
            })
            vim.keymap.set('n', '<leader>ss', ':Telescope lsp_document_symbols<CR>', {
                noremap = true,
                desc = "Fuzzy find document symbols"
            })
        end,
        dependencies = {
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
                config = function()
                    require("telescope").load_extension("fzf")
                end,
            },
            'nvim-telescope/telescope-project.nvim',
            'nvim-lua/plenary.nvim'
        }
    }
}
