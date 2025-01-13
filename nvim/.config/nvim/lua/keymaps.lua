-- Easier keybindings for switching panes
vim.keymap.set('n', '<leader>w', '<c-w>', { noremap = true })
vim.keymap.set('n', '<leader>h', ':wincmd h<CR>', {
    noremap = true,
    desc = 'Switch to left window'
})
vim.keymap.set('n', '<leader>j', ':wincmd j<CR>', {
    noremap = true,
    desc = 'Switch to bottom window'
})
vim.keymap.set('n', '<leader>l', ':wincmd l<CR>', {
    noremap = true,
    desc = 'Switch to right window'
})
vim.keymap.set('n', '<leader>k', ':wincmd k<CR>', {
    noremap = true,
    desc = 'Switch to top window'
})
vim.keymap.set('n', '<leader>wd', ':bd<CR>', {
    noremap = true,
    desc = 'Delete buffer'
})
vim.keymap.set('n', '<leader>q', ':q<CR>', {
    noremap = true,
    desc = 'Quit'
})
vim.keymap.set('n', '[b', ':bp<CR>', {
    noremap = true,
    desc = 'Previous Buffer'
})
vim.keymap.set('n', ']b', ':bn<CR>', {
    noremap = true,
    desc = 'Next Buffer'
})

-- Switch to previous buffer
vim.keymap.set('n', '<leader><leader>', '<c-^>', {
    noremap = true,
    desc = 'Previous File'
})

-- Create new buffer
vim.keymap.set('n', '<leader>ot', ':e<Space>', {
    noremap = true,
    desc = 'New File'
})

-- Create new split
vim.keymap.set('n', '<leader>-', ':sp<CR>', {
    noremap = true,
    desc = 'Horizontal Split'
})
vim.keymap.set('n', '<leader>\\', ':vsp<CR>', {
    noremap = true,
    desc = 'Vertical Split'
})

-- Copy paste from system clipboard
vim.keymap.set('n', '<leader>y', '\"+y', {
    noremap = true,
    desc = 'Copy to system clipboard'
})
vim.keymap.set('n', '<leader>p', '\"+p', {
    noremap = true,
    desc = 'Paste from system clipboard'
})
vim.keymap.set('v', '<leader>y', '\"+y', {
    noremap = true,
    desc = 'Copy to system clipboard'
})
vim.keymap.set('v', '<leader>p', '\"+p', {
    noremap = true,
    desc = 'Paste from system clipboard'
})

-- Terminal mode keybindings
vim.keymap.set('n', '<leader>;', ':vsp<CR>:terminal<CR>', {
    noremap = true,
    desc = 'Terminal in Vertical Split'
})

-- Keep visual mode after changing indentation
vim.keymap.set('v', '<', '<gv', {
    noremap = true,
    desc = 'Indent'
})
vim.keymap.set('v', '>', '>gv', {
    noremap = true,
    desc = 'Indent'
})

-- Move line in visual mode
vim.keymap.set('v', 'J', ':m \'>+1<CR>gv=gv', {
    noremap = true,
    desc = 'Move Line Down'
})
vim.keymap.set('v', 'K', ':m \'<-2<CR>gv=gv', {
    noremap = true,
    desc = 'Move Line Up'
})

-- Move in the quickfix list
vim.keymap.set('n', '<c-j>', ':cnext<CR>', {
    noremap = true,
    desc = 'Next Quickfix List Entry'
})
vim.keymap.set('n', '<c-k>', ':cprevious<CR>', {
    noremap = true,
    desc = 'Previous Quickfix List Entry'
})
