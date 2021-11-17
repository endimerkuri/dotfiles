-- Easier keybindings for switching panes
vim.api.nvim_set_keymap('n', '<leader>w', '<c-w>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>h', ':wincmd h<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>j', ':wincmd j<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>l', ':wincmd l<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>k', ':wincmd k<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>bd', ':bd<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>q', ':q<CR>', { noremap = true })

-- Switch to previous buffer
vim.api.nvim_set_keymap('n', '<leader><leader>', '<c-^>', { noremap = true })

-- Create new buffer
vim.api.nvim_set_keymap('n', '<leader>ot', ':e<Space>', { noremap = true })

-- Create new split
vim.api.nvim_set_keymap('n', '<leader>s', ':sp<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>v', ':vsp<CR>', { noremap = true })

-- Copy paste from system clipboard
vim.api.nvim_set_keymap('n', '<leader>y', '\"+y', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>p', '\"+p', { noremap = true })
vim.api.nvim_set_keymap('v', '<leader>y', '\"+y', { noremap = true })
vim.api.nvim_set_keymap('v', '<leader>p', '\"+p', { noremap = true })

-- Save and submit slurm job via tmux
vim.api.nvim_set_keymap('n', '<leader>wr', ':w<CR>:silent !trun<CR>:redraw!<CR>', {})

-- Terminal mode keybindings
-- vim.api.nvim_set_keymap('n', '<leader>;', ':10sp<CR>:terminal<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>;', ':vsp<CR>:terminal<CR>', { noremap = true })
-- vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true })

-- Keep visual mode after changing indentation
vim.api.nvim_set_keymap('v', '<', '<gv', { noremap = true })
vim.api.nvim_set_keymap('v', '>', '>gv', { noremap = true })

-- Move line in visual mode
vim.api.nvim_set_keymap('v', 'J', ':m \'>+1<CR>gv=gv', { noremap = true })
vim.api.nvim_set_keymap('v', 'K', ':m \'<-2<CR>gv=gv', { noremap = true })
