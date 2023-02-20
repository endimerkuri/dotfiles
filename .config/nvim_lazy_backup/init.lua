local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

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

vim.g.mapleader = ' '
vim.cmd[[set winbar=%=%m\ %f]]

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noinsert,noselect'

-- Avoid showing message extra message when using completion
vim.o.shortmess = vim.o.shortmess .. 'c'

require('keys')
require('lazy').setup('plugins')

vim.api.nvim_exec([[
augroup custom_term
autocmd!
autocmd TermOpen * setlocal bufhidden=hide
augroup END
]],
false)

vim.cmd[[set wildignore+=*node_modules*]]
vim.api.nvim_exec([[ autocmd BufWritePre *.ts Neoformat ]], false)

vim.o.background = 'dark' -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])

vim.g.gruvbox_termcolors = 256
