return {
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',
    'onsails/lspkind-nvim',
    'saadparwaiz1/cmp_luasnip',
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'onsails/lspkind-nvim',
            'saadparwaiz1/cmp_luasnip',
            'kristijanhusak/vim-dadbod-completion',
        },
        config = function()
            local cmp = require('cmp')
            local lspkind = require('lspkind')
            local t = function(str)
                return vim.api.nvim_replace_termcodes(str, true, true, true)
            end
            local check_back_space = function()
                local col = vim.fn.col '.' - 1
                return col == 0 or vim.fn.getline('.'):sub(col, col):match '%s' ~= nil
            end
            local has_words_before = function()
                local line, col = unpack(vim.api.nvim_win_get_cursor(0))
                return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
            end

            require('nvim-autopairs').setup{}
            local cmp_autopairs = require('nvim-autopairs.completion.cmp')

            cmp.setup {
                formatting = {
                    format = require('lspkind').cmp_format({
                        with_text = true,
                        menu = ({
                            buffer = '[Buffer]',
                            nvim_lsp = '[LSP]',
                            luasnip = '[LuaSnip]',
                            nvim_lua = '[Lua]',
                            latex_symbols = '[Latex]',
                            ['vim-dadbod-completion'] = '[DB]',
                        })
                    }),
                },
                mapping = {
                    ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
                    ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
                    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.close(),
                    ['<CR>'] = cmp.mapping.confirm({
                        behavior = cmp.ConfirmBehavior.Insert,
                        select = true,
                    })
                },

                -- You should specify your *installed* sources.
                sources = {
                    { name = 'nvim_lsp' },
                    {
                        name = 'buffer',
                        option = {
                            get_bufnrs = function()
                                local bufs = {}
                                for _, win in ipairs(vim.api.nvim_list_wins()) do
                                    bufs[vim.api.nvim_win_get_buf(win)] = true
                                end
                                return vim.tbl_keys(bufs)
                            end
                        }
                    },
                    { name = 'luasnip' },
                    { name = 'path' },
                    { name = 'copilot' }
                },
                snippet = {
                    -- REQUIRED - you must specify a snippet engine
                    expand = function(args)
                        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
                        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
                        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
                        -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
                    end,
                },
            }
            local autocomplete_group = vim.api.nvim_create_augroup('vimrc_autocompletion', { clear = true })
            vim.api.nvim_create_autocmd('FileType', {
                pattern = { 'sql', 'mysql', 'plsql' },
                callback = function()
                    cmp.setup.buffer({
                        sources = {
                            { name = 'vim-dadbod-completion' },
                            { name = 'buffer' }
                        }
                    })
                end,
                group = autocomplete_group,
            })
            cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))
        end
    }
}
