return {
	{
		"mistweaverco/kulala.nvim",
		ft = "http",
		opts = {
			default_winbar_panes = { "body", "headers", "script_output" },
			winbar = true,
			load = {
				["core.defaults"] = {},
			},
		},
		keys = {
			{
				"<leader>sr",
				function()
					require("kulala").run()
				end,
				desc = "Send REST request",
			},
		},
	},
	{
		"hudclark/grpc-nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		ft = "grpc",
		config = function()
			vim.keymap.set("n", "<leader>sr", ":Grpc<CR>", {
				noremap = true,
				desc = "Send GRPC request",
			})
		end,
	},
}
