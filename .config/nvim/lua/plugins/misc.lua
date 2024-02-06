return {
    { "nvim-lua/plenary.nvim", lazy = true },
    {
        "gennaro-tedesco/nvim-jqx",
        ft = { "json", "yaml" },
    },
    { "tpope/vim-vinegar" },
    "tpope/vim-projectionist",
    {
        "monaqa/dial.nvim",
        config = function ()
            local dial = require'dial.map'
            local augend = require'dial.augend'
            require'dial.config'.augends:register_group{
                -- default augends used when no group name is specified
                default = {
                    augend.integer.alias.decimal,
                    augend.integer.alias.hex,
                    augend.date.alias["%Y/%m/%d"],
                    augend.constant.alias.bool,
                    augend.constant.new{
                        elements = { "True", "False" },
                        word = true,
                        cyclic = true,
                    }
                }
            }
            vim.keymap.set("n", "<C-a>", dial.inc_normal(), { noremap = true })
            vim.keymap.set("n", "<C-x>", dial.dec_normal(), { noremap = true })
            vim.keymap.set("v", "<C-a>", dial.inc_visual(), { noremap = true })
            vim.keymap.set("v", "<C-x>", dial.dec_visual(), { noremap = true })
            vim.keymap.set("v", "g<C-a>", dial.inc_gvisual(), { noremap = true })
            vim.keymap.set("v", "g<C-x>", dial.dec_gvisual(), { noremap = true })
        end
    },
    "tpope/vim-dotenv",
    "mbbill/undotree",
    "ludovicchabant/vim-gutentags",
    {
        'rest-nvim/rest.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('rest-nvim').setup({
                -- Open request results in a horizontal split
                result_split_horizontal = false,
                -- Keep the http file buffer above|left when split horizontal|vertical
                result_split_in_place = false,
                -- Skip SSL verification, useful for unknown certificates
                skip_ssl_verification = true,
                -- Encode URL before making request
                encode_url = true,
                -- Highlight request on run
                highlight = {
                    enabled = true,
                    timeout = 150,
                },
                result = {
                    -- toggle showing URL, HTTP info, headers at top the of result window
                    show_url = true,
                    show_http_info = true,
                    show_headers = true,
                    -- executables or functions for formatting response body [optional]
                    -- set them to nil if you want to disable them
                    formatters = {
                        json = 'jq',
                        html = function(body)
                            return vim.fn.system({ 'tidy', '-i', '-q', '-' }, body)
                        end
                    },
                },
                -- Jump to request line on run
                jump_to_request = false,
                env_file = '.env',
                custom_dynamic_variables = {},
                yank_dry_run = true,
            })
        end
    },
    'hudclark/grpc-nvim',
    'airblade/vim-rooter',
    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
    {    
        'windwp/nvim-autopairs',
        config = function ()
            require('nvim-autopairs').setup {}
        end
    },
    'tpope/vim-surround',
    'github/copilot.vim',
}
