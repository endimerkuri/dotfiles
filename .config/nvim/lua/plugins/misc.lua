-- UndoTree
vim.api.nvim_set_keymap('n', '<leader>u', ':UndotreeToggle<CR>', { noremap = true })

-- Symbols outline
vim.api.nvim_set_keymap('n', '<leader>os', ':SymbolsOutline<CR>', { noremap = true })

vim.g.UltiSnipsExpandTrigger = '<c-l>'
vim.g.UltiSnipsForwardTrigger = '<c-j>'
vim.g.UltiSnipsBackwardTrigger = '<c-k>'

vim.api.nvim_set_keymap('n', '<leader>br', ':lua require("rest-nvim").run()<CR>', { noremap = true })
