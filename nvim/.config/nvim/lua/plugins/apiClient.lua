return {
	{
		"mistweaverco/kulala.nvim",
		ft = "http",
		opts = {
			default_winbar_panes = { "body", "headers", "script_output" },
			global_keymaps = true,
			winbar = true,
			load = {
				["core.defaults"] = {},
			},
		},
	},
}
