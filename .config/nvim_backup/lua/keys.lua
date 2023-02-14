-- Easier keybindings for switching panes
vim.keymap.set('n', '<leader>w', '<c-w>', { noremap = true })
vim.keymap.set('n', '<leader>h', ':wincmd h<CR>', { noremap = true })
vim.keymap.set('n', '<leader>j', ':wincmd j<CR>', { noremap = true })
vim.keymap.set('n', '<leader>l', ':wincmd l<CR>', { noremap = true })
vim.keymap.set('n', '<leader>k', ':wincmd k<CR>', { noremap = true })
vim.keymap.set('n', '<leader>wd', ':bd<CR>', { noremap = true })
vim.keymap.set('n', '<leader>q', ':q<CR>', { noremap = true })

-- Switch to previous buffer
vim.keymap.set('n', '<leader><leader>', '<c-^>', { noremap = true })

-- Create new buffer
vim.keymap.set('n', '<leader>ot', ':e<Space>', { noremap = true })

-- Create new split
vim.keymap.set('n', '<leader>s', ':sp<CR>', { noremap = true })
vim.keymap.set('n', '<leader>v', ':vsp<CR>', { noremap = true })

-- Copy paste from system clipboard
vim.keymap.set('n', '<leader>y', '\"+y', { noremap = true })
vim.keymap.set('n', '<leader>p', '\"+p', { noremap = true })
vim.keymap.set('v', '<leader>y', '\"+y', { noremap = true })
vim.keymap.set('v', '<leader>p', '\"+p', { noremap = true })

-- Save and submit slurm job via tmux
vim.keymap.set('n', '<leader>wr', ':w<CR>:silent !trun<CR>:redraw!<CR>', {})

-- Terminal mode keybindings
vim.keymap.set('n', '<leader>;', ':vsp<CR>:terminal<CR>', { noremap = true })
-- vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { noremap = true })

-- Keep visual mode after changing indentation
vim.keymap.set('v', '<', '<gv', { noremap = true })
vim.keymap.set('v', '>', '>gv', { noremap = true })

-- Move line in visual mode
vim.keymap.set('v', 'J', ':m \'>+1<CR>gv=gv', { noremap = true })
vim.keymap.set('v', 'K', ':m \'<-2<CR>gv=gv', { noremap = true })

-- Move in the quickfix list
vim.keymap.set('n', '<c-j>', ':cnext<CR>', { noremap = true })
vim.keymap.set('n', '<c-k>', ':cprevious<CR>', { noremap = true })
