return {
    {
        'williamboman/mason.nvim',
        build = ':MasonUpdate',
        config = function ()
            require('mason').setup()
        end
    },
    {
        'neovim/nvim-lspconfig',
        event = { 'BufReadPre', "BufNewFile" },
        config = function()
            local on_attach = function(client, bufnr)
                vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
                local opts = { noremap = true, silent = true }

                vim.keymap.set('n', 'gi', ':lua vim.lsp.buf.implementation()<CR>', opts)
                vim.keymap.set('n', 'gd', ':lua vim.lsp.buf.definition()<CR>', opts)
                vim.keymap.set('n', 'grr', ':lua vim.lsp.buf.references()<CR>', opts)
                vim.keymap.set('n', 'grn', ':lua vim.lsp.buf.rename()<CR>', opts)
                vim.keymap.set('n', 'K', ':lua vim.lsp.buf.hover()<CR>', opts)
                vim.keymap.set('n', '<leader>ca', ':lua vim.lsp.buf.code_action()<CR>', opts)
                vim.keymap.set('v', '<leader>ca', ':lua vim.lsp.buf.code_action()<CR>', opts)
                vim.keymap.set('n', '<leader>gt', ':TroubleToggle document_diagnostics<CR>', opts)
            end

            -- nvim-cmp supports additional completion capabilities
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = require('cmp_nvim_lsp').default_capabilities()

            require'lspconfig'.jdtls.setup{
                on_attach = on_attach,
                capabilities = capabilities,
                cmd = { 'jdtls' },
                root_dir = function(fname)
                    return require'lspconfig'.util.root_pattern('pom.xml', 'gradle.build', '.git')(fname) or vim.fn.getcwd()
                end

            }
            require'lspconfig'.intelephense.setup{
                on_attach = on_attach,
                capabilities = capabilities,
            }
            require'lspconfig'.pylsp.setup{
                on_attach = on_attach,
                configurationSources = { 'pycodestyle', 'pyflakes' },
                capabilities = capabilities,
            }
            require'lspconfig'.texlab.setup{
                on_attach = on_attach,
                capabilities = capabilities,
                settings = {
                    texlab = {
                        auxDirectory = '.',
                        bibtexFormatter = 'texlab',
                        build = {
                            args = { '-pdf', '-interaction=nonstopmode', '-synctex=1', '%f' },
                            executable = 'latexmk',
                            forwardSearchAfter = false,
                            onSave = true
                        },
                        chktex = {
                            onEdit = false,
                            onOpenAndSave = false
                        },
                        diagnosticsDelay = 300,
                        formatterLineLength = 80,
                        forwardSearch = {
                            args = {}
                        },
                        latexFormatter = 'latexindent',
                        latexindent = {
                            modifyLineBreaks = false
                        }
                    }
                }
            }
            require'lspconfig'.clangd.setup{
                on_attach = on_attach,
                capabilities = capabilities,
            }
            require'lspconfig'.gopls.setup{
                on_attach = on_attach,
                capabilities = capabilities,
            }
            require'lspconfig'.ts_ls.setup{
                on_attach = on_attach,
                capabilities = capabilities,
                root_dir = function(fname)
                    return require'lspconfig'.util.root_pattern('.git')(fname) or vim.fn.getcwd()
                end
            }
            require'lspconfig'.csharp_ls.setup{
                on_attach = on_attach,
                capabilities = capabilities,
                root_dir = function(fname)
                    return require'lspconfig'.util.root_pattern('*.sln')(fname) or vim.fn.getcwd()
                end
            }
            require'nvim-treesitter.configs'.setup {
                ensure_installed = 'all', -- one of "all", "maintained" (parsers with maintainers), or a list of languages
                highlight = {
                    enable = true,              -- false will disable the whole extension
                },
            }
        end
    },
    {
        "folke/trouble.nvim",
        opts = {}, -- for default options, refer to the configuration section for custom setup.
        cmd = "Trouble",
        keys = {
            {
                "<leader>xx",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Diagnostics (Trouble)",
            },
            {
                "<leader>xX",
                "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                desc = "Buffer Diagnostics (Trouble)",
            },
            {
                "<leader>cs",
                "<cmd>Trouble symbols toggle focus=false<cr>",
                desc = "Symbols (Trouble)",
            },
            {
                "<leader>cl",
                "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
                desc = "LSP Definitions / references / ... (Trouble)",
            },
            {
                "<leader>xL",
                "<cmd>Trouble loclist toggle<cr>",
                desc = "Location List (Trouble)",
            },
            {
                "<leader>xQ",
                "<cmd>Trouble qflist toggle<cr>",
                desc = "Quickfix List (Trouble)",
            },
        },
    }
}
