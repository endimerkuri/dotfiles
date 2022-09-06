-- Fuzzy finder
vim.g.rooter_patterns = { '.git' }

require('telescope').setup{
    defaults = {
        layout_config = {
            width = 0.9,
            height = 0.9,
        },
        preview = {
            treesitter = false
        }
    }
}
require('telescope').load_extension('fzf')
require('telescope').load_extension('projects')

vim.api.nvim_set_keymap('n', '<leader>f', ':Telescope find_files<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>b', ':Telescope buffers<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>ts', ':Telescope grep_string<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<c-p>', ':Telescope live_grep<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>op', ':Telescope projects<CR>', { noremap = true })
