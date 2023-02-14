local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd 'packadd packer.nvim'
end

-- vim.cmd [[packadd packer.nvim]]

vim.api.nvim_exec(
[[
augroup Packer
autocmd!
autocmd BufWritePost init.lua PackerCompile
augroup end
]],
false
)

vim.api.nvim_exec([[
augroup custom_term
autocmd!
autocmd TermOpen * setlocal bufhidden=hide
augroup END
]],
false)

require('plugins.plugins')
require('plugins.treesitter')
require('plugins.bufferline')
require('plugins.color')
require('plugins.startify')
require('plugins.finder')
require('plugins.maximizer')
require('plugins.statusline')
require('plugins.tests')
require('plugins.git')
require('plugins.db')
require('plugins.lsp')
require('plugins.debug')
require('plugins.completion')
require('plugins.misc')

vim.cmd[[set wildignore+=*node_modules*]]
vim.api.nvim_exec([[ autocmd BufWritePre *.ts Neoformat ]], false)
