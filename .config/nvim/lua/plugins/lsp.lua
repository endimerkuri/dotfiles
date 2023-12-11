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
        config = function()
            local on_attach = function(client, bufnr)
                vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
                local opts = { noremap = true, silent = true }

                vim.keymap.set('n', 'gi', ':lua vim.lsp.buf.implementation()<CR>', opts)
                vim.keymap.set('n', 'gd', ':lua vim.lsp.buf.definition()<CR>', opts)
                vim.keymap.set('n', 'grr', ':lua vim.lsp.buf.references()<CR>', opts)
                vim.keymap.set('n', 'K', ':lua vim.lsp.buf.hover()<CR>', opts)
                vim.keymap.set('n', '<leader>ca', ':lua vim.lsp.buf.code_action()<CR>', opts)
                vim.keymap.set('v', '<leader>ca', ':lua vim.lsp.buf.code_action()<CR>', opts)
                vim.keymap.set('n', '<leader>r', ':Lspsaga rename<CR>', opts)
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
            require'lspconfig'.phpactor.setup{
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
            require'lspconfig'.tsserver.setup{
                on_attach = on_attach,
                capabilities = capabilities,
                root_dir = function(fname)
                    return require'lspconfig'.util.root_pattern('.git')(fname) or vim.fn.getcwd()
                end
            }
            require'nvim-treesitter.configs'.setup {
                ensure_installed = 'all', -- one of "all", "maintained" (parsers with maintainers), or a list of languages
                highlight = {
                    enable = true,              -- false will disable the whole extension
                },
            }
            require'lspconfig'.csharp_ls.setup{
                on_attach = on_attach,
                capabilities = capabilities,
                root_dir = function(fname)
                    return require'lspconfig'.util.root_pattern('*.sln')(fname) or vim.fn.getcwd()
                end
            }
        end
    },
    {
        'folke/trouble.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opt = {

        },
        config = function ()
            vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end)
            vim.keymap.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end)
            vim.keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end)
            vim.keymap.set("n", "<leader>xq", function() require("trouble").toggle("quickfix") end)
            vim.keymap.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end)
        end
    }
}
