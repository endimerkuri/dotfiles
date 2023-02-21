-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local Util = require("lazyvim.util")
vim.keymap.set("n", "<leader>wo", "<c-w>o", { noremap = true, silent = true, desc = "Keep only this window open" })
vim.keymap.set('n', '<leader>h', ':wincmd h<CR>', { noremap = true, silent = true, desc = "Move to left window" })
vim.keymap.set('n', '<leader>j', ':wincmd j<CR>', { noremap = true, silent = true, desc = "Move to bottom window" })
vim.keymap.set('n', '<leader>l', ':wincmd l<CR>', { noremap = true, silent = true, desc = "Move to right window" })
vim.keymap.set('n', '<leader>k', ':wincmd k<CR>', { noremap = true, silent = true, desc = "Move to above window" })

if Util.has("bufferline.nvim") then
    local opts = { noremap = true, silent = true }
    vim.keymap.set("n", "<leader>1", ":BufferLineGoToBuffer 1<CR>", opts)
    vim.keymap.set("n", "<leader>2", ":BufferLineGoToBuffer 2<CR>", opts)
    vim.keymap.set("n", "<leader>3", ":BufferLineGoToBuffer 3<CR>", opts)
    vim.keymap.set("n", "<leader>4", ":BufferLineGoToBuffer 4<CR>", opts)
    vim.keymap.set("n", "<leader>5", ":BufferLineGoToBuffer 5<CR>", opts)
    vim.keymap.set("n", "<leader>6", ":BufferLineGoToBuffer 6<CR>", opts)
    vim.keymap.set("n", "<leader>7", ":BufferLineGoToBuffer 7<CR>", opts)
    vim.keymap.set("n", "<leader>8", ":BufferLineGoToBuffer 8<CR>", opts)
    vim.keymap.set("n", "<leader>9", ":BufferLineGoToBuffer 9<CR>", opts)
end

-- Copy paste from system clipboard
vim.keymap.set("n", "<leader>y", '"+y', { noremap = true, desc = "Copy to system clipboard" })
vim.keymap.set("n", "<leader>p", '"+p', { noremap = true, desc = "Paste from system clipboard" })
vim.keymap.set("v", "<leader>y", '"+y', { noremap = true, desc = "Copy to system clipboard" })
vim.keymap.set("v", "<leader>p", '"+p', { noremap = true, desc = "Paste from system clipboard" })

-- Move in the quickfix list
vim.keymap.set('n', ']q', ':cnext<CR>', { noremap = true, desc = "Next in quickfix list" })
vim.keymap.set('n', '[q', ':cprevious<CR>', { noremap = true, desc = "Previous in quickfix list" })

-- Git
vim.keymap.set('n', '<leader>gs', ':Gedit :<CR>', { desc = 'Vim fugitive status'})
vim.keymap.set('n', '<leader>gu', ':G pull<CR>', { desc = 'Git pull' })
vim.keymap.set('n', '<leader>gb', ':G blame<CR>', { desc = 'Open git blame' })

-- Projectionist
vim.keymap.set("n", "]r", ":A<CR>", { noremap = true, desc = 'Projectionist open related file' })

-- Open env
vim.keymap.set("n", "<leader>oe", ":e ./config/.env.development<CR>", { noremap = true, desc = 'Open .env.development' })

-- Rest requests
vim.keymap.set('n', '<leader>or', '<Plug>RestNvim<CR>', { noremap = true, desc = 'Send rest request' })

-- UndoTree
vim.keymap.set('n', '<leader>ou', ':UndotreeToggle<CR>', { noremap = true, desc = 'Toggle undo tree' })

-- Open terminal
vim.keymap.set('n', '<leader>;', ':vsp<CR>:terminal<CR>', { noremap = true, desc = 'Open terminal' })
