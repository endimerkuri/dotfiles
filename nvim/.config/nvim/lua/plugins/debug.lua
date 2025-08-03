return {
	{
		"microsoft/vscode-js-debug",
		build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
		lazy = true,
	},
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			{
				"mxsdev/nvim-dap-vscode-js",
				lazy = true,
				config = function()
					require("dap-vscode-js").setup({
						debugger_path = vim.fn.stdpath("data") .. "/lazy/vscode-js-debug",
						adapters = { "pwa-node" },
					})
				end,
			},
		},
        -- stylua: ignore
        keys = {
            { '<leader>dB', function() require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = 'Breakpoint Condition' },
            { '<leader>db', function() require('dap').toggle_breakpoint() end, desc = 'Toggle Breakpoint' },
            { '<leader>dc', function() require('dap').continue() end, desc = 'Continue' },
            { '<leader>da', function() require('dap').continue({ before = get_args }) end, desc = 'Run with Args' },
            { '<leader>dC', function() require('dap').run_to_cursor() end, desc = 'Run to Cursor' },
            { '<leader>dg', function() require('dap').goto_() end, desc = "Go to line (no execute)" },
            { '<leader>di', function() require('dap').step_into() end, desc = 'Step Into' },
            { '<leader>dj', function() require('dap').down() end, desc = 'Down' },
            { '<leader>dk', function() require('dap').up() end, desc = 'Up' },
            { '<leader>dl', function() require('dap').run_last() end, desc = 'Run Last' },
            { '<leader>do', function() require('dap').step_out() end, desc = 'Step Out' },
            { '<leader>dO', function() require('dap').step_over() end, desc = 'Step Over' },
            { '<leader>dp', function() require('dap').pause() end, desc = 'Pause' },
            { '<leader>dr', function() require('dap').repl.toggle() end, desc = 'Toggle REPL' },
            { '<leader>ds', function() require('dap').session() end, desc = 'Session' },
            { '<leader>dt', function() require('dap').terminate() end, desc = 'Terminate' },
        },
		config = function()
			local dap = require("dap")
			dap.adapters.coreclr = {
				type = "executable",
				command = "/usr/local/netcoredbg",
				args = { "--interpreter=vscode" },
			}
			dap.configurations.cs = {
				{
					type = "coreclr",
					name = "attach - netcoredbg",
					request = "attach",
					processId = require("dap.utils").pick_process,
				},
			}
			dap.configurations.javascript = {
				{
					type = "pwa-node",
					request = "attach",
					name = "attach nodejs",
					processId = require("dap.utils").pick_process,
				},
			}
		end,
	},
}
