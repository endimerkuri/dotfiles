-- Vim maximizer keybindings
vim.g.maximizer_set_default_mapping = 0
vim.g.maximizer_set_mapping_with_bang = 1
vim.api.nvim_set_keymap('n', '<leader>m', ':MaximizerToggle<CR>', {})
vim.api.nvim_set_keymap('v', '<leader>m', ':MaximizerToggle<CR>', {})
