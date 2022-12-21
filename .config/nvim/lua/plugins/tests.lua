-- Tests
vim.g['test#strategy'] = 'basic'
vim.g['test#basic#start_normal'] = 1
vim.keymap.set('n', '<leader>tf', ':Dotenv config/.env.test<CR>:TestFile<CR>', { noremap = true })
vim.keymap.set('n', '<leader>ta', ':Dotenv config/.env.test<CR>:TestSuite<CR>', { noremap = true })
