vim.o.nu = true
vim.o.rnu = true
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.shiftround = true
vim.o.smartindent = true
vim.o.hlsearch = false
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.wrap = false
vim.o.scrolloff = 8
vim.o.signcolumn = 'yes:2'
vim.o.termguicolors = true
vim.o.cursorline = true
vim.o.hidden = true
-- vim.o.cmdheight = 0
vim.opt.undodir = os.getenv('HOME') .. '/.vim/undodir'
vim.opt.undofile = true
vim.o.background = 'dark'
vim.o.ignorecase = true
vim.o.smartcase = true

vim.g.mapleader = ' '
vim.cmd[[set winbar=%=%m\ %f]]

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noinsert,noselect'

-- Avoid showing message extra message when using completion
vim.o.shortmess = vim.o.shortmess .. 'c'
