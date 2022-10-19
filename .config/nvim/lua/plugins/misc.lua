-- UndoTree
vim.api.nvim_set_keymap('n', '<leader>u', ':UndotreeToggle<CR>', { noremap = true })

-- Symbols outline
-- vim.api.nvim_set_keymap('n', '<leader>os', ':SymbolsOutline<CR>', { noremap = true })

vim.g.UltiSnipsExpandTrigger = '<c-l>'
vim.g.UltiSnipsForwardTrigger = '<c-j>'
vim.g.UltiSnipsBackwardTrigger = '<c-k>'

-- Rest requests
vim.api.nvim_set_keymap('n', '<leader>cr', ':lua require("rest-nvim").run()<CR>', { noremap = true })

-- Dial Nvim
local dial = require'dial.map'
local augend = require'dial.augend'
require'dial.config'.augends:register_group{
    -- default augends used when no group name is specified
    default = {
        augend.integer.alias.decimal,
        augend.integer.alias.hex,
        augend.date.alias["%Y/%m/%d"],
        augend.constant.alias.bool,
        augend.constant.new{
            elements = { "True", "False" },
            word = true,
            cyclic = true,
        }
    }
}

vim.api.nvim_set_keymap("n", "<C-a>", dial.inc_normal(), { noremap = true })
vim.api.nvim_set_keymap("n", "<C-x>", dial.dec_normal(), { noremap = true })
vim.api.nvim_set_keymap("v", "<C-a>", dial.inc_visual(), { noremap = true })
vim.api.nvim_set_keymap("v", "<C-x>", dial.dec_visual(), { noremap = true })
vim.api.nvim_set_keymap("v", "g<C-a>", dial.inc_gvisual(), { noremap = true })
vim.api.nvim_set_keymap("v", "g<C-x>", dial.dec_gvisual(), { noremap = true })

-- Projectionist
vim.api.nvim_set_keymap("n", "]r", ":A<CR>", { noremap = true })

-- Open env
vim.api.nvim_set_keymap("n", "<leader>oe", ":e ./config/.env.development<CR>", { noremap = true })
