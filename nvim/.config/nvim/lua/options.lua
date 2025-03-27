vim.o.nu = true
vim.o.rnu = true
vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.shiftround = true
vim.o.smartindent = true
vim.o.hlsearch = false
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.wrap = false
vim.o.scrolloff = 8
vim.o.signcolumn = "yes"
vim.o.termguicolors = true
vim.o.cursorline = true
vim.o.hidden = true
-- vim.o.cmdheight = 0
vim.o.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.laststatus = 3
vim.g.gruvbox_material_background = "hard"

local function augroup(name)
	return vim.api.nvim_create_augroup("my_lazyvim_" .. name, { clear = true })
end

vim.g.mapleader = " "

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noinsert,noselect"

-- Avoid showing message extra message when using completion
vim.o.shortmess = vim.o.shortmess .. "c"

vim.filetype.add({
	extension = {
		["http"] = "http",
	},
})

vim.lsp.enable({ "csharp_ls", "gopls", "intelephense", "pylsp", "ts_ls" })
