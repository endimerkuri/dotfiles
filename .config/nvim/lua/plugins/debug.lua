-- Debugger
vim.api.nvim_set_keymap('n', '<leader>dc', ':Dotenv config/.env.development<CR>:lua require\'dap\'.continue()<CR>', { noremap = true } )
vim.api.nvim_set_keymap('n', '<leader>db', ':lua require\'dap\'.toggle_breakpoint()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>dl', ':lua require\'dap\'.step_into()<CR>', { noremap = true })

local dap, dapui = require('dap'), require('dapui')
dapui.setup()
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
dap.listeners.after.event_initialized['dapui_config'] = function() dapui.open() end
dap.listeners.before.event_terminated['dapui_config'] = function() dapui.close() end
dap.listeners.before.event_exited['dapui_config'] = function() dapui.close() end
