-- Tests
vim.g['test#strategy'] = 'basic'
vim.g['test#basic#start_normal'] = 1
vim.api.nvim_set_keymap('n', '<leader>tf', ':Dotenv config/.env.test<CR>:TestFile<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>ta', ':Dotenv config/.env.test<CR>:TestSuite<CR>', { noremap = true })
