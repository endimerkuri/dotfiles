-- Vim maximizer keybindings
vim.g.maximizer_set_default_mapping = 0
vim.g.maximizer_set_mapping_with_bang = 1
vim.keymap.set('n', '<leader>m', ':MaximizerToggle<CR>', {})
vim.keymap.set('v', '<leader>m', ':MaximizerToggle<CR>', {})
