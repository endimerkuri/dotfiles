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
vim.o.signcolumn = 'yes'
vim.o.termguicolors = true
vim.o.cursorline = true

local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd 'packadd packer.nvim'
end

vim.api.nvim_exec(
[[
augroup Packer
autocmd!
autocmd BufWritePost init.lua PackerCompile
augroup end
]],
false
)

local plugins = require('plugins')

-- Easier keybindings for switching panes
vim.g.mapleader = ' '
vim.api.nvim_set_keymap('n', '<leader>w', '<c-w>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>h', ':wincmd h<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>j', ':wincmd j<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>l', ':wincmd l<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>k', ':wincmd k<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>bd', ':bd<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>q', ':q<CR>', { noremap = true })

-- Easier keybindings to switch buffers
vim.api.nvim_set_keymap('n', '<leader><Tab>', ':BufNext<CR>', {})
vim.api.nvim_set_keymap('n', '<leader><S-Tab>', ':BufPrev<CR>', {})
vim.api.nvim_set_keymap('n', '<leader><leader>', '<c-^>', { noremap = true })

-- Create new buffer
vim.api.nvim_set_keymap('n', '<leader>t', ':e<Space>', { noremap = true })

-- Create new split
vim.api.nvim_set_keymap('n', '<leader>s', ':sp<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>v', ':vsp<CR>', { noremap = true })

-- Copy paste from system clipboard
vim.api.nvim_set_keymap('n', '<leader>y', '\"+y', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>p', '\"+p', { noremap = true })
vim.api.nvim_set_keymap('v', '<leader>y', '\"+y', { noremap = true })
vim.api.nvim_set_keymap('v', '<leader>p', '\"+p', { noremap = true })

-- Gruvbox color theme
vim.o.background = 'dark'
vim.g.gruvbox_contrast_dark = 'hard'
vim.g.gruvbox_termcolors = 256
vim.cmd([[colorscheme gruvbox]])

-- Startify configuration
vim.g.startify_session_autoload = 1
vim.g.startify_change_to_vcs_root = 1

require('lualine').setup{
    options = {
        theme = 'gruvbox',
        section_separators = '',
        component_separators = '',
    },
}

-- Vim maximizer keybindings
vim.g.maximizer_set_default_mapping = 0
vim.g.maximizer_set_mapping_with_bang = 1
vim.api.nvim_set_keymap('n', '<leader>m', ':MaximizerToggle<CR>', {})
vim.api.nvim_set_keymap('v', '<leader>m', ':MaximizerToggle<CR>', {})

-- Vim Fugitive keybindings
vim.api.nvim_set_keymap('n', '<leader>gs', ':G<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>gb', ':MerginalToggle<CR>', {})

-- " " Save and make
-- " nmap <leader>cm :w<CR>:10sp<CR>:terminal make<CR>

-- Terminal mode keybindings
vim.api.nvim_set_keymap('n', '<leader>;', ':10sp<CR>:terminal<CR>', { noremap = true })
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true })
vim.api.nvim_exec([[
augroup custom_term
autocmd!
autocmd TermOpen * setlocal bufhidden=hide
augroup END
]],
false)

-- Nvim-lsp
vim.api.nvim_set_keymap('n', 'gi', ':lua vim.lsp.buf.declaration()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'gd', ':lua vim.lsp.buf.definition()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'grr', ':lua vim.lsp.buf.references()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'K', ':lua vim.lsp.buf.hover()<CR>', { noremap = true })

-- Fuzzy finder
vim.g.rooter_patterns = { '.git' }
vim.api.nvim_set_keymap('n', '<leader>f', ':Files<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>bb', ':Buffers<CR>', { noremap = true })

-- UndoTree
vim.api.nvim_set_keymap('n', '<leader>u', ':UndotreeToggle<CR>', { noremap = true })

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noinsert,noselect'

-- Avoid showing message extra message when using completion
vim.o.shortmess = vim.o.shortmess .. 'c'

vim.g.UltiSnipsExpandTrigger = '<c-l>'
vim.g.UltiSnipsForwardTrigger = '<c-j>'
vim.g.UltiSnipsBackwardTrigger = '<c-k>'

-- Tests
vim.g['test#strategy'] = 'neovim'
vim.api.nvim_set_keymap('n', '<leader>tf', ':Dotenv config/.env.test<CR>:TestFile<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>ts', ':Dotenv config/.env.test<CR>:TestSuite<CR>', { noremap = true })

-- Debugger
vim.api.nvim_set_keymap('n', '<leader>dc', ':Dotenv config/.env.development<CR>:lua require\'dap\'.continue()<CR>', { noremap = true } )
vim.api.nvim_set_keymap('n', '<leader>db', ':lua require\'dap\'.toggle_breakpoint()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>dl', ':lua require\'dap\'.step_into()<CR>', { noremap = true })

-- DBUI
vim.api.nvim_set_keymap('n', '<leader>od', ':DBUIToggle<CR>', { noremap = true })
vim.g.db_ui_win_position = 'right'
vim.g.db_ui_use_nerd_fonts = true
vim.g.db_ui_auto_execute_table_helpers = true
vim.g.db_ui_icons = {
    expanded = {
        db = '▾  ',
        buffers = '▾  ',
        saved_queries = '▾  ',
        schemas = '▾  ',
        schema = '▾ פּ ',
        tables = '▾ 藺 ',
        table = '▾  ',
    },
    collapsed = {
        db = '▸  ',
        buffers = '▸  ',
        saved_queries = '▸  ',
        schemas = '▸  ',
        schema = '▸ פּ ',
        tables = '▸ 藺 ',
        table = '▸  ',
    },
    saved_query = ' ',
    new_query = '璘 ',
    tables = '離 ',
    buffers = '﬘ ',
    add_connection = ' ',
    connection_ok = '✓ ',
    connection_error = '✕ ',
}

require('buftabline').setup{}
require('gitsigns').setup{
    keymaps = {
        noremap = true,
        ['n ]c'] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'"},
        ['n [c'] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'"},
        ['n ghs'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
        ['v ghs'] = '<cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
        ['n ghu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
        ['n ghr'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
        ['v ghr'] = '<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
        ['n ghR'] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',
        ['n ghp'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
        ['n ghb'] = '<cmd>lua require"gitsigns".blame_line(true)<CR>',
    }
}
require'lspconfig'.pylsp.setup{
    on_attach = on_attach,
    configurationSources = { "pycodestyle", "pyflakes" },
}
require'lspconfig'.texlab.setup{
    on_attach = on_attach,
    settings = {
        texlab = {
            auxDirectory = ".",
            bibtexFormatter = "texlab",
            build = {
                args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
                executable = "latexmk",
                forwardSearchAfter = false,
                onSave = true
            },
            chktex = {
                onEdit = false,
                onOpenAndSave = false
            },
            diagnosticsDelay = 300,
            formatterLineLength = 80,
            forwardSearch = {
                args = {}
            },
            latexFormatter = "latexindent",
            latexindent = {
                modifyLineBreaks = false
            }
        }
    }
}
require'lspconfig'.clangd.setup{
    on_attach = on_attach,
}
require'lspconfig'.tsserver.setup{}
require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    highlight = {
        enable = true,              -- false will disable the whole extension
    },
}
local dap = require'dap'
dap.adapters.node2 = {
    type = 'executable',
    command = 'node',
    args = {os.getenv('HOME') .. '/software/vscode-node-debug2/out/src/nodeDebug.js'},
}
dap.configurations.javascript = {
    {
        type = 'node2',
        request = 'launch',
        program = '${workspaceFolder}/index.js',
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        protocol = 'inspector',
        console = 'integratedTerminal',
    },
}
require'dapui'.setup()

vim.api.nvim_exec([[ autocmd BufWritePre *.ts Neoformat ]], false)

local cmp = require('cmp')
local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end
local check_back_space = function()
    local col = vim.fn.col '.' - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match '%s' ~= nil
end
cmp.setup {
    snippet = {
        expand = function(args)
            vim.fn['UltiSnips#Anon'](args.body)
        end,
    },
    mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
        })
    },

    -- supertab-like mapping
    mapping = {
        ["<tab>"] = cmp.mapping(function(fallback)
            if vim.fn.pumvisible() == 1 then
                vim.fn.feedkeys(t("<C-n>"), "n")
            elseif check_back_space() then
                vim.fn.feedkeys(t("<tab>"), "n")
            else
                fallback()
            end
        end, {
        "i",
        "s",
    }),
    ["<S-tab>"] = cmp.mapping(function(fallback)
        if vim.fn.pumvisible() == 1 then
            vim.fn.feedkeys(t("<C-p>"), "n")
        else
            fallback()
        end
    end, {
    "i",
    "s",
}),
    },

    -- You should specify your *installed* sources.
    sources = {
        { name = 'buffer' },
        { name = 'nvim-lsp' },
        { name = 'ultisnips' },
        { name = 'path' },
    },

    require('lspconfig')['tsserver'].setup {
        capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
    }
}
