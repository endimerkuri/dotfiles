-- Easier keybindings for switching panes
vim.keymap.set("n", "<leader>wo", "<c-w>o", { noremap = true, desc = "Maximize window" })
vim.keymap.set("n", "<leader>wd", ":close<CR>", { noremap = true, desc = "Close window" })

local function smart_split(direction)
	local prev = vim.fn.winnr()
	local ok = pcall(vim.cmd, "wincmd " .. direction)
	local new_win = vim.api.nvim_get_current_win()
	local cmd = (direction == "l" or direction == "h") and "vsplit" or "split"

	if not ok or vim.fn.winnr() == prev then
		vim.cmd(cmd)
	end
end

vim.keymap.set("n", "<leader>h", function()
	smart_split("h")
end, {
	noremap = true,
	desc = "Switch to or create left window",
})
vim.keymap.set("n", "<leader>j", function()
	smart_split("j")
end, {
	noremap = true,
	desc = "Switch to or create bottom window",
})
vim.keymap.set("n", "<leader>l", function()
	smart_split("l")
end, {
	noremap = true,
	desc = "Switch to or create right window",
})
vim.keymap.set("n", "<leader>k", function()
	smart_split("k")
end, {
	noremap = true,
	desc = "Switch to or create top window",
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
	desc = "Open diagnostic float",
})
