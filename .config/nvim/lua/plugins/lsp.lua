-- Nvim-lsp
local on_attach = function(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  local opts = { noremap = true, silent = true }

  vim.api.nvim_set_keymap('n', 'gi', ':lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_set_keymap('n', 'gd', ':lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_set_keymap('n', 'grr', ':lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_set_keymap('n', 'K', ':lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_set_keymap('n', '<leader>ca', ':lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_set_keymap('v', '<leader>ca', ':lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_set_keymap('n', '<leader>r', ':Lspsaga rename<CR>', opts)
  vim.api.nvim_set_keymap('n', '<leader>gt', ':TroubleToggle document_diagnostics<CR>', opts)
end

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

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
    configurationSources = { "pycodestyle", "pyflakes" },
    capabilities = capabilities,
}
require'lspconfig'.texlab.setup{
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        texlab = {
            auxDirectory = ".",
            bibtexFormatter = "texlab",
            build = {
                args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
                executable = "latexmk",
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
            latexFormatter = "latexindent",
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
}
require'nvim-treesitter.configs'.setup {
    ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    highlight = {
        enable = true,              -- false will disable the whole extension
    },
}
local null_ls = require("null-ls")
require("null-ls").setup({
    sources = {
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.code_actions.eslint,
        null_ls.builtins.formatting.prettier
    },
})
