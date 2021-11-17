-- Fuzzy finder
vim.g.rooter_patterns = { '.git' }

require('telescope').setup{
    defaults = {
        preview = {
            treesitter = false
        }
    }
}
require('telescope').load_extension('fzf')

vim.api.nvim_set_keymap('n', '<leader>f', ':Telescope find_files<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>bb', ':Telescope buffers<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>ts', ':Telescope grep_string<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<c-p>', ':Telescope live_grep<CR>', { noremap = true })
