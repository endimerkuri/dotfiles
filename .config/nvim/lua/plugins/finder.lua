-- Fuzzy finder
vim.g.rooter_patterns = { '.git' }
vim.g.fzf_layout = { window = { width = 0.9, height = 0.9 } }
vim.api.nvim_set_keymap('n', '<leader>f', ':Files<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>bb', ':Buffers<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<c-p>', ':Rg<CR>', { noremap = true })
