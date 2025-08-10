-- Easier keybindings for switching panes
vim.keymap.set("n", "<leader>wo", "<c-w>o", { noremap = true, desc = "Maximize window" })
vim.keymap.set("n", "<leader>wd", ":close<CR>", { noremap = true, desc = "Close window" })
vim.keymap.set("n", "<leader>h", ":wincmd h<CR>", {
	noremap = true,
	desc = "Switch to left window",
})
vim.keymap.set("n", "<leader>j", ":wincmd j<CR>", {
	noremap = true,
	desc = "Switch to bottom window",
})
vim.keymap.set("n", "<leader>l", ":wincmd l<CR>", {
	noremap = true,
	desc = "Switch to right window",
})
vim.keymap.set("n", "<leader>k", ":wincmd k<CR>", {
	noremap = true,
	desc = "Switch to top window",
})
vim.keymap.set("n", "<leader>bd", ":bd<CR>", {
	noremap = true,
	desc = "Delete buffer",
})
vim.keymap.set("n", "<leader>q", ":q<CR>", {
	noremap = true,
	desc = "Quit",
})

-- Switch to previous buffer
vim.keymap.set("n", "<leader><leader>", "<c-^>", {
	noremap = true,
	desc = "Previous File",
})

-- Create new split
vim.keymap.set("n", "<leader>-", ":sp<CR>", {
	noremap = true,
	desc = "Horizontal Split",
})
vim.keymap.set("n", "<leader>\\", ":vsp<CR>", {
	noremap = true,
	desc = "Vertical Split",
})

-- Copy paste from system clipboard
vim.keymap.set("n", "<leader>y", '"+y', {
	noremap = true,
	desc = "Copy to system clipboard",
})
vim.keymap.set("n", "<leader>p", '"+p', {
	noremap = true,
	desc = "Paste from system clipboard",
})
vim.keymap.set("v", "<leader>y", '"+y', {
	noremap = true,
	desc = "Copy to system clipboard",
})
vim.keymap.set("v", "<leader>p", '"+p', {
	noremap = true,
	desc = "Paste from system clipboard",
})

vim.keymap.set("n", "<leader>;", ":vsp<CR>:terminal<CR>", {
	noremap = true,
	desc = "Open terminal in Vertical Split",
})

-- Keep visual mode after changing indentation
vim.keymap.set("v", "<", "<gv", {
	noremap = true,
	desc = "Indent",
})
vim.keymap.set("v", ">", ">gv", {
	noremap = true,
	desc = "Indent",
})

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", {
	noremap = true,
	desc = "Move Line Down",
})
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", {
	noremap = true,
	desc = "Move Line Up",
})

vim.keymap.set("n", "<c-j>", ":cnext<CR>", {
	noremap = true,
	desc = "Next Quickfix List Entry",
})
vim.keymap.set("n", "<c-k>", ":cprevious<CR>", {
	noremap = true,
	desc = "Previous Quickfix List Entry",
})

vim.keymap.set("n", "gK", vim.diagnostic.open_float, {
	noremap = true,
	desc = "Open diagnostic float"
})
